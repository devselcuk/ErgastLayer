//
//  File.swift
//  
//
//  Created by SELCUK YILDIZ on 01.04.23.
//

import Foundation

public struct MockData {
   public static let driverStanding = DriverStanding(position: "7", points: "8", wins: "0", Driver: Driver(driverId: "stroll", permanentNumber: Optional("18"), code: Optional("STR"), givenName: "Lance", familyName: "Stroll", nationality: "Canadian"), Constructors: [Constructor(constructorId: "aston_martin", name: "Aston Martin", nationality: "British")])
    
    
    public static let constructorStanding = ConstructorStanding(position: "1", points: "87", wins: "2", Constructor: Constructor(constructorId: "red_bull", name: "Red Bull", nationality: "Austrian"))
    
    
    public static let race = Race(season: "2023", round: "1", url: "https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix", raceName: "Bahrain Grand Prix", circuit: Circuit(circuitId: "bahrain", url: "http://en.wikipedia.org/wiki/Bahrain_International_Circuit", circuitName: "Bahrain International Circuit", location: Location(lat: "26.0325", long: "50.5106", locality: "Sakhir", country: "Bahrain")), date: "2023-03-05", time: Optional("15:00:00Z"))
}
