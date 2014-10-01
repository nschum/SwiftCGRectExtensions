import CGRectExtensions
import XCTest

class OffsetTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 10, height: 20)

    func testOffsettingDxDy() {
        XCTAssertEqual(rect.rectByOffsetting(3, 4), CGRect(x: 4, y: 6, width: 10, height: 20))
    }

    func testOffsettingDx() {
        XCTAssertEqual(rect.rectByOffsetting(dx: 3), CGRect(x: 4, y: 2, width: 10, height: 20))
    }

    func testOffsettingDy() {
        XCTAssertEqual(rect.rectByOffsetting(dy: 4), CGRect(x: 1, y: 6, width: 10, height: 20))
    }

    func testOffsettingBySize() {
        XCTAssertEqual(
            rect.rectByOffsetting(CGSize(3, 4)),
            CGRect(x: 4, y: 6, width: 10, height: 20))
    }
}
