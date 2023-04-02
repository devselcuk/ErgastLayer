
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





// Model for constructor standings


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




