//
//  AngelType.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/14.
//

import Foundation

enum AngelType: Int, Codable {
    case angel
    case nice
    case soso
    case ghost
    case devil
}

extension AngelType {
    var emoji: String {
        switch self {
        case .angel:
            return "😇"
        case .nice:
            return "😄"
        case .soso:
            return "😐"
        case .ghost:
            return "😫"
        case .devil:
            return "👿"
        }
    }
}
