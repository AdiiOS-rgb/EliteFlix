//
//  ApiManager.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 25/10/23.
//

import Foundation
typealias Handler<T> = (Result<T, DataError>) -> Void

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case serverError
    case encodeError(Error)
    case decodeError(Error)
}

final class APIManager {
    static let shared = APIManager()
    var request: URLRequest? = nil
    private init() {}
    
    func request<T: Codable>(
        modelType: T.Type,
        type: ApiEndPoints,
        completion: @escaping Handler<T>
    ) {
        var components = URLComponents()
        components.host = type.host
        components.scheme = type.schema
        components.path = type.path
        components.queryItems = type.queryItems
        
        guard let url = components.url else {
            completion(.failure(.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = type.methods
        
        type.headers.forEach { (key, value) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        
        if let requestBody = type.body {
            do {
                let data = try JSONEncoder().encode(requestBody)
                urlRequest.httpBody = data
            } catch {
                completion(.failure(.network(error)))
            }
        }

        //
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let response = try JSONDecoder().decode(modelType, from: data)
                completion(.success(response))
            } catch {
                print(error)
                completion(.failure(.network(error)))
            }
        }.resume()
    }
   
}
