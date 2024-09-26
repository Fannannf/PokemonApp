//
//  Helpers.swift
//  PokemonApp
//
//  Created by MacBook Air on 07/09/24.
//

import Foundation

extension Bundle {
    func decode<T:Decodable>(file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Could not find \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Could not load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else{
            fatalError("Could not decode \(file) from bundle")
        }
        
        return loadedData
    }
    
    func fetchData<T:Decodable>(url:String, model:T.Type, completion:@escaping(T)->(), failure:@escaping(Error)->()) {
        guard let url = URL(string: url) else {fatalError("Could not find \(url)")}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                // Check for network errors
                if let error = error {
                    failure(error)
                    return
                }
                // Check for data
                guard let data = data else {
                    failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                    return
                }
                // Decode JSON
                do {
                    let serverData = try JSONDecoder().decode(T.self, from: data)
                    completion(serverData)
                } catch {
                    failure(error)
                }
            }
            
            task.resume()
    }
}
