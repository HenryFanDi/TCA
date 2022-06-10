//
//  AngelDetail.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/10.
//

import Foundation

struct AngelDetail: Codable, Identifiable {
    let id = UUID()
    let aid: Int?
    let iid: Int?
    let nid: Int?
    let content: String
    let updatedAt: String
    
    enum CodingKeys: CodingKey {
        case aid
        case iid
        case nid
        case content
        case updatedAt
    }
    
    // MARK: - Initialization
    
    init(
        aid: Int? = nil,
        iid: Int? = nil,
        nid: Int? = nil,
        content: String = "",
        updatedAt: String = ""
    ) {
        self.aid = aid
        self.iid = iid
        self.nid = nid
        self.content = content
        self.updatedAt = updatedAt
    }
    
    // MARK: - Decoder
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<AngelDetail.CodingKeys> = try decoder.container(keyedBy: AngelDetail.CodingKeys.self)
        
        self.aid = try container.decodeIfPresent(Int.self, forKey: AngelDetail.CodingKeys.aid)
        self.iid = try container.decodeIfPresent(Int.self, forKey: AngelDetail.CodingKeys.iid)
        self.nid = try container.decodeIfPresent(Int.self, forKey: AngelDetail.CodingKeys.nid)
        self.content = try container.decode(String.self, forKey: AngelDetail.CodingKeys.content)
        self.updatedAt = try container.decode(String.self, forKey: AngelDetail.CodingKeys.updatedAt)
    }
    
    // MARK: - Encoder
    
    func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<AngelDetail.CodingKeys> = encoder.container(keyedBy: AngelDetail.CodingKeys.self)
        
        try container.encodeIfPresent(self.aid, forKey: AngelDetail.CodingKeys.aid)
        try container.encodeIfPresent(self.iid, forKey: AngelDetail.CodingKeys.iid)
        try container.encodeIfPresent(self.nid, forKey: AngelDetail.CodingKeys.nid)
        try container.encode(self.content, forKey: AngelDetail.CodingKeys.content)
        try container.encode(self.updatedAt, forKey: AngelDetail.CodingKeys.updatedAt)
    }
}
