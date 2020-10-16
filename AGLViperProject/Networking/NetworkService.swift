//
//  NetworkService.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 30.09.2020.
//

import Foundation

class NetworkService {
    
    func getDataFromJSON<T: Codable>(fileName: String, response: @escaping ([T]?) -> Void) {
            if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let objects = self.decodeJSONData(type: [T].self, from: data)
                    response(objects)
                } catch {
                    print("Failed to parse \(fileName).json")
                }
            }
    }
    
    func decodeJSONData<T: Codable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON: \(jsonError.localizedDescription)")
            return nil
        }
    }
}
