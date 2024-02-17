//
//  File.swift
//
//
//  Created by Venkatesh Nyamagoudar on 2/15/24.
//

import SwiftUI

public class NetworkManager: ObservableObject{
    public init() {}
    
    /// Description: Function used to extract data from from URL
    /// - Parameters:
    ///   - urlString: Desired URl in string format
    ///   - completion: Completion handler that handels the operation is success or failure
    public func extractJsonData(from urlString: String, completion: @escaping(Result<Data,Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
    
    /// Description: Function used to get the data according to the DailyPredictoion Model.
    /// - Parameters:
    ///   - jsonData: The jsondata that is extracted from the URL
    ///   - completion: completion handler that handels the operation is success or failure
    public func parseJsonData(jsonData: Data, completion: @escaping(Result<DailyPrediction,Error>) -> Void) {
        do{
            let decodedData = try JSONDecoder().decode(DailyPrediction.self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
}
