//
//  File.swift
//  
//
//  Created by SELCUK YILDIZ on 31.03.23.
//

import Foundation




public struct RaceScheduleTask : NetworkTask {
    
    public typealias Response = RaceResultResponse
    
    public var endPoint: EndPoint  = .schedule
    
    public var endPointValue: String?
    
    public init(endPointValue: String?) {
        self.endPointValue = endPointValue
    }
    
    
}

public struct RaceResultResponse: Codable {
    public let mrData: MRData
    
    private enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

public struct MRData: Codable {
    public let xmlns: String
    public let series: String
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let raceTable: RaceTable
    
    private enum CodingKeys: String, CodingKey {
        case xmlns
        case series
        case url
        case limit
        case offset
        case total
        case raceTable = "RaceTable"
    }
}

public struct RaceTable: Codable {
    public let season: String
    public let races: [Race]
    
    private enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}

public struct Race: Codable {
    public let season: String
    public let round: String
    public let url: String
    public let raceName: String
    public let circuit: Circuit
    public let date: String
    public let time: String?
    
    private enum CodingKeys: String, CodingKey {
        case season
        case round
        case url
        case raceName
        case circuit = "Circuit"
        case date
        case time
    }
}

public struct Circuit: Codable {
    public let circuitId: String
    public let url: String
    public let circuitName: String
    public let location: Location
    
    private enum CodingKeys: String, CodingKey {
        case circuitId
        case url
        case circuitName
        case location = "Location"
    }
}

public struct Location: Codable {
    public let lat: String
    public let long: String
    public let locality: String
    public let country: String
    
    private enum CodingKeys: String, CodingKey {
        case lat
        case long
        case locality
        case country
    }
}
