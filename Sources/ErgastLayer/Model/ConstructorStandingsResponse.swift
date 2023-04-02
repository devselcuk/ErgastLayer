//
//  File.swift
//  
//
//  Created by SELCUK YILDIZ on 01.04.23.
//

import Foundation


public struct ConstructorStandingsResponse: Codable {
    public let MRData: ConstructorStandingsMRData
}

public struct ConstructorStandingsMRData: Codable {
    public let StandingsTable: ConstructorStandingsTable
}

public struct ConstructorStandingsList : Codable {
    public let season: String
    public let ConstructorStandings: [ConstructorStanding]
}

public struct ConstructorStandingsTable: Codable {
    public let StandingsLists : [ConstructorStandingsList]
}

public struct ConstructorStanding: Codable {
    public let position: String
    public let points: String
    public let wins: String
    public let Constructor: Constructor
}
