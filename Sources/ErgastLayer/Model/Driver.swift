//
//  File 2.swift
//  
//
//  Created by SELCUK YILDIZ on 01.04.23.
//

import Foundation

public struct Driver: Codable {
    public let driverId: String
    public let permanentNumber: String?
    public let code: String?
    public let givenName: String
    public let familyName: String
    public let nationality: String
}
