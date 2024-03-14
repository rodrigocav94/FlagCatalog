//
//  Country.swift
//  FlagCatalog
//
//  Created by Rodrigo Cavalcanti on 14/03/24.
//

import Foundation

// MARK: - WelcomeElement
struct Country: Codable {
    let name, alpha2: String

    enum CodingKeys: String, CodingKey {
        case name
        case alpha2 = "alpha-2"
    }
}

extension Country {
    static let all: [Country] = {
        do {
            guard let path = Bundle.main.path(forResource: "Countries", ofType: "json") else {
                fatalError("Couldn't find Challenges.json in the main bundle")
            }
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([Country].self, from: data)
            return decoded
        } catch {
            print(error.localizedDescription)
        }
        return []
    }()
}
