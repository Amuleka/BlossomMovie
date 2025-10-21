//
//  ViewModel.swift
//  BlossomMovie
//
//  Created by Amulek Angulo on 10/21/25.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    
    func getTitles() async {
        homeStatus = .fetching
        
        do {
            async let tMovies = dataFetcher.fetchTitle(for: "movie", by: "trending")
            async let tTV = dataFetcher.fetchTitle(for: "tv", by: "trending")
            async let tRMovies = dataFetcher.fetchTitle(for: "movie", by: "top_rated")
            async let tRTV = dataFetcher.fetchTitle(for: "tv", by: "top_rated")
            
            trendingMovies = try await tMovies
            trendingTV = try await tTV
            topRatedMovies = try await tRMovies
            topRatedTV = try await tRTV
            
            homeStatus = .success
        } catch {
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
