import XCTest
@testable import ErgastLayer

final class ErgastLayerTests: XCTestCase {
    
    func testUrlBuilder() throws {
       
        let task = DriverStandingTask(endPointValue: "current")
        let url = task.url
        let urlString = url?.absoluteString ?? ""
        XCTAssertEqual(urlString, "http://ergast.com/api/f1/current/driverStandings.json")
        
    }
    
    @available(iOS 13.0.0, *)
    func testDriverStandingsResponse() async throws {
        let response = try await ErgastLayer.execute(task: DriverStandingTask(endPointValue: "current"))
       XCTAssert(!response.MRData.StandingsTable.StandingsLists[0].DriverStandings.isEmpty)
    }
    
    
    @available(iOS 13.0.0, *)
    func testConstructorStandingsResponse() async throws {
        let response = try await ErgastLayer.execute(task: ConstructorStandingTask(endPointValue: "current"))
        XCTAssert(!response.MRData.StandingsTable.StandingsLists[0].ConstructorStandings.isEmpty)
    }
}
