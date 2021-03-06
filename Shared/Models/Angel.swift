//
//  Angel.swift
//  TCA (iOS)
//
//  Created by Henry Fan on 2022/6/10.
//

import Foundation

struct Angel: Codable, Identifiable {
    let id = UUID()
    let aid: Int
    let level: String
    let name: String
    let period: String
    let type: AngelType
    let updatedAt: Date
    
    enum CodingKeys: CodingKey {
        case aid
        case level
        case name
        case period
        case type
        case updatedAt
    }
    
    // MARK: - Initialization
    
    init(
        aid: Int = -1,
        level: String = "",
        name: String = "",
        period: String = "",
        type: AngelType = .angel,
        updatedAt: Date = .init()
    ) {
        self.aid = aid
        self.level = level
        self.name = name
        self.period = period
        self.type = type
        self.updatedAt = updatedAt
    }
    
    // MARK: - Decoder
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Angel.CodingKeys> = try decoder.container(keyedBy: Angel.CodingKeys.self)
        
        self.aid = try container.decode(Int.self, forKey: Angel.CodingKeys.aid)
        self.level = try container.decode(String.self, forKey: Angel.CodingKeys.level)
        self.name = try container.decode(String.self, forKey: Angel.CodingKeys.name)
        self.period = try container.decode(String.self, forKey: Angel.CodingKeys.period)
        self.type = try container.decode(AngelType.self, forKey: Angel.CodingKeys.type)
        
        let dateString = try container.decode(String.self, forKey: Angel.CodingKeys.updatedAt)
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        if let date = dateFormatter.date(from: dateString) {
            self.updatedAt = date
        } else {
            throw DecodingError.dataCorrupted(.init(
                codingPath: [CodingKeys.updatedAt],
                debugDescription: "unable to convert date string to Date object. Format not recognised",
                underlyingError: nil)
            )
        }
    }
    
    // MARK: - Encoder
    
    func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<Angel.CodingKeys> = encoder.container(keyedBy: Angel.CodingKeys.self)
        
        try container.encode(self.aid, forKey: Angel.CodingKeys.aid)
        try container.encode(self.level, forKey: Angel.CodingKeys.level)
        try container.encode(self.name, forKey: Angel.CodingKeys.name)
        try container.encode(self.period, forKey: Angel.CodingKeys.period)
        try container.encode(self.type, forKey: Angel.CodingKeys.type)
        try container.encode(self.updatedAt, forKey: Angel.CodingKeys.updatedAt)
    }
}
