//
//  YoutubePlayer.swift
//  BlossomMovie
//
//  Created by Amulek Angulo on 10/21/25.
//

import SwiftUI
@preconcurrency import WebKit

struct YoutubePlayer: UIViewRepresentable {
    // ✅ Use a configured WKWebView (inline playback, fresh datastore)
    let webView: WKWebView = {
        let cfg = WKWebViewConfiguration()
        cfg.websiteDataStore = .nonPersistent()
        cfg.allowsInlineMediaPlayback = true
        if #available(iOS 16.0, *) { cfg.mediaTypesRequiringUserActionForPlayback = [] }
        return WKWebView(frame: .zero, configuration: cfg)
    }()

    let videoId: String
    let youtubeBaseURL = APIConfig.shared?.youtubeBaseURL // should be https://www.youtube.com/embed/

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.scrollView.isScrollEnabled = false
        if #available(iOS 16.4, *) { webView.isInspectable = true }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard !videoId.isEmpty else { return }

        // Use your config base if present, else nocookie embed
        let base = (youtubeBaseURL?.isEmpty == false) ? youtubeBaseURL! : "https://www.youtube-nocookie.com/embed/"
        guard var url = URL(string: base) else { return }
        url.append(path: videoId)

        var comps = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        comps.queryItems = [
            URLQueryItem(name: "playsinline", value: "1"),
            URLQueryItem(name: "rel", value: "0"),
            URLQueryItem(name: "modestbranding", value: "1"),
            URLQueryItem(name: "enablejsapi", value: "1"),
            URLQueryItem(name: "origin", value: "https://localhost")
        ]

        guard let finalURL = comps.url else { return }
        if uiView.url != finalURL {
            uiView.load(URLRequest(url: finalURL))
        }
    }

    final class Coordinator: NSObject, WKNavigationDelegate {
        // Prevent the embed from bouncing to the full /watch page
        func webView(_ webView: WKWebView,
                     decidePolicyFor action: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let u = action.request.url,
               u.host?.contains("youtube.com") == true,
               u.path == "/watch" {
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
    }
}
