//
//  DataFetcher.swift
//  BlossomMovie
//
//  Created by Amulek Angulo on 10/21/25.
//

import Foundation

let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey

func fetchTitle(for media: String) async throws -> [Title] {
    
    guard let baseURL = tmdbBaseURL, let apiKey = tmdbAPIKey else {
        throw NetworkError.missingConfig
    }

    guard let fetchTitleURL = URL(string: baseURL)?
        .appending(path: "3/trending/\(media)/day")
        .appending(queryItems: [
            URLQueryItem(name: "api_key", value: apiKey)
        ]) else {
        throw NetworkError.urlBuildFailed
    }
    
    print(fetchTitleURL)
    
    let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitleURL)
    
    guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
        throw NetworkError.badURLResponse(underlyingError: NSError(
            domain: "DataFetcher",
            code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
            userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Request"]))
    }
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode(APIObject.self, from: data).results
}
