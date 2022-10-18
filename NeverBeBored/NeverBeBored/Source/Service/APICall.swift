//
//  API Call.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 11/10/22.
//

import Foundation

// MARK: - Creating an extension of an object URLSession to make a func request. Every request need to receive an URL.
// MARK: - To this request I pass a generic type of reponse so I can a different response based on the api I'm calling

extension URLSession {
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            guard let url = url else {
                completion(.failure(EnumError.invalidURL))
                return
            }
            let task = dataTask(with: url) { data, _, error in
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(EnumError.invalidData))
                    }
                    return
                }
                do {
                    let result = try JSONDecoder().decode(expecting, from: data)
                    print(result)
                    completion(.success(result))}
                catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
}
