//
//  File.swift
//  
//
//  Created by SELCUK YILDIZ on 01.04.23.
//

import Foundation

public struct DriverStandingsResponse: Codable {
    public let MRData: DriverStandingsMRData
}

public struct DriverStandingsMRData: Codable {
    public let StandingsTable: DriverStandingsTable
}

public struct DriverStandingsTable: Codable {
    public let StandingsLists : [StandingsLists]
}
public struct StandingsLists : Codable {
    public let season: String
    public let DriverStandings: [DriverStanding]
}



public struct DriverStanding: Codable {
    public let position: String
    public let points: String
    public let wins: String
    public let Driver: Driver
    public let Constructors: [Constructor]
}
