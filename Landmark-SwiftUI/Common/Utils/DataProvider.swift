//
//  DataProvider.swift
//  Landmark-SwiftUI
//
//  Created by Aleksander Wędrychowski on 04/01/2021.
//

import Foundation

struct DataProvider {
    
    enum Error: LocalizedError {
        case fileNotFound
        case unableToDecodeDataFromFile
        case unableToDecodeTypeInstanceUsingData
        case unknown
    }
    
    static func load<T: Decodable>(from fileName: String) throws -> T {
        let data: Data
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            throw DataProvider.Error.fileNotFound
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            throw DataProvider.Error.unableToDecodeDataFromFile
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw DataProvider.Error.unableToDecodeTypeInstanceUsingData
        }
        
        throw DataProvider.Error.unknown
    }
    
}
