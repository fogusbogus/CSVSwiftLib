import XCTest
@testable import CSVSwiftLib

final class CSVSwiftLibTests: XCTestCase {
    func testSimple() throws {
        let csv = "H1,H2\nPart a,Part b"
		let res = CSVTranslation.getArrayFromCSVContent(csv: csv)
		XCTAssert(res.count == 2)
		res.forEach { XCTAssert($0.count == 2) }
		XCTAssert(res[0][0] == "H1")
		XCTAssert(res[0][1] == "H2")
		XCTAssert(res[1][0] == "Part a")
		XCTAssert(res[1][1] == "Part b")
    }
	
	func testQuoted() throws {
		let csv = "H1,\"Heading, 2\"\n\"This, is some data\",this is the second part"
		let res = CSVTranslation.getArrayFromCSVContent(csv: csv)
		XCTAssert(res.count == 2)
		res.forEach { XCTAssert($0.count == 2) }
		XCTAssert(res[0][0] == "H1")
		XCTAssert(res[0][1] == "Heading, 2")
		XCTAssert(res[1][0] == "This, is some data")
		XCTAssert(res[1][1] == "this is the second part")
	}
}
