
import Foundation

public struct ErgastLayer {
   
    
    
    @available(iOS 13.0.0, *)
    public static func execute<Task : NetworkTask>(task : Task) async throws -> Task.Response {
        
        guard let url = task.url else { throw APIError.invalidURL}
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            let response =  try JSONDecoder().decode(Task.Response.self, from: data)
            print(response)
            return response
        } catch {
            print(error)
            
          throw  error
        }
        
    }
    
}


public enum APIError : Error {
    case invalidURL
}


public protocol NetworkTask {
    associatedtype Response : Codable
    
     var endPoint : EndPoint { get set}
    
    var endPointValue : String? { get set}
    
    
}

extension NetworkTask {
    var url : URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "ergast.com"
        urlComponents.path = "/api/f1" + "/\(endPointValue ?? "")" + endPoint.rawValue
        
        return urlComponents.url
    }
}

public struct DriverStandingTask : NetworkTask {
    
    public var endPointValue: String?
    
    public typealias Response = DriverStandingsResponse
    
    public var endPoint: EndPoint = .driverStandings
    

    public init(endPointValue : String?) {
        self.endPointValue = endPointValue
    }
    
    
}

public struct ConstructorStandingTask : NetworkTask {
    public var endPoint: EndPoint = .constructorStandings
    
    public var endPointValue: String?
    
    public typealias Response = ConstructorStandingsResponse
    
    public init( endPointValue: String?) {
        self.endPointValue = endPointValue
    }
    
}

// Model for driver standings
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

public struct Driver: Codable {
    public let driverId: String
    public let permanentNumber: String?
    public let code: String?
    public let givenName: String
    public let familyName: String
    public let nationality: String
}

public struct Constructor: Codable {
    public let constructorId: String
    public let name: String
    public let nationality: String
}

// Model for constructor standings
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

// Model for current drivers
public struct CurrentDriversResponse: Codable {
    public let mrData: CurrentDriversMRData
}

public struct CurrentDriversMRData: Codable {
    public let driverTable: DriverTable
}

public struct DriverTable: Codable {
    public let drivers: [Driver]
}

// Model for current teams
public struct CurrentTeamsResponse: Codable {
    public let mrData: CurrentTeamsMRData
}

public struct CurrentTeamsMRData: Codable {
    public let teamTable: TeamTable
}

public struct TeamTable: Codable {
    public let teams: [Team]
}

public struct Team: Codable {
    public let constructorId: String
    public let name: String
    public let nationality: String
    public let url: String
}



public struct MockData {
   public static let driverStanding = DriverStanding(position: "7", points: "8", wins: "0", Driver: Driver(driverId: "stroll", permanentNumber: Optional("18"), code: Optional("STR"), givenName: "Lance", familyName: "Stroll", nationality: "Canadian"), Constructors: [Constructor(constructorId: "aston_martin", name: "Aston Martin", nationality: "British")])
    
    
    public static let constructorStanding = ConstructorStanding(position: "1", points: "87", wins: "2", Constructor: Constructor(constructorId: "red_bull", name: "Red Bull", nationality: "Austrian"))
    
    
    public static let race = Race(season: "2023", round: "1", url: "https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix", raceName: "Bahrain Grand Prix", circuit: Circuit(circuitId: "bahrain", url: "http://en.wikipedia.org/wiki/Bahrain_International_Circuit", circuitName: "Bahrain International Circuit", location: Location(lat: "26.0325", long: "50.5106", locality: "Sakhir", country: "Bahrain")), date: "2023-03-05", time: Optional("15:00:00Z"))
}
