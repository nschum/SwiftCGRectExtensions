import CGRectExtensions
import XCTest

class PointWithTests: XCTestCase {

    let point = CGPoint(x: 1, y: 2)

    func testWithX() {
        XCTAssertEqual(point.with(x: 3), CGPoint(x: 3, y: 2))
    }

    func testWithY() {
        XCTAssertEqual(point.with(y: 3), CGPoint(x: 1, y: 3))
    }
}

class SizeWithTests: XCTestCase {

    let size = CGSize(width: 1, height: 2)

    func testWithWidth() {
        XCTAssertEqual(size.with(width: 3), CGSize(width: 3, height: 2))
    }

    func testWithHeight() {
        XCTAssertEqual(size.with(height: 3), CGSize(width: 1, height: 3))
    }
}

class RectWithTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 10, height: 20)

    func testWithOrigin() {
        XCTAssertEqual(
            rect.with(origin: CGPoint(x: 3, y: 4)),
            CGRect(x: 3, y: 4, width: 10, height: 20))
    }

    func testWithXY() {
        XCTAssertEqual(rect.with(x: 3, y: 4), CGRect(x: 3, y: 4, width: 10, height: 20))
    }

    func testWithX() {
        XCTAssertEqual(rect.with(x: 3), CGRect(x: 3, y: 2, width: 10, height: 20))
    }

    func testWithY() {
        XCTAssertEqual(rect.with(y: 4), CGRect(x: 1, y: 4, width: 10, height: 20))
    }

    func testWithSize() {
        XCTAssertEqual(
            rect.with(size: CGSize(width: 30, height: 40)),
            CGRect(x: 1, y: 2, width: 30, height: 40))
    }

    func testWithWidthHeight() {
        XCTAssertEqual(rect.with(width: 30, height: 40), CGRect(x: 1, y: 2, width: 30, height: 40))
    }

    func testWithWidth() {
        XCTAssertEqual(rect.with(width: 30), CGRect(x: 1, y: 2, width: 30, height: 20))
    }

    func testWithHeight() {
        XCTAssertEqual(rect.with(height: 40), CGRect(x: 1, y: 2, width: 10, height: 40))
    }

    func testWithXWidth() {
        XCTAssertEqual(rect.with(x: 3, width: 30), CGRect(x: 3, y: 2, width: 30, height: 20))
    }

    func testWithYHeight() {
        XCTAssertEqual(rect.with(y: 4, height: 40), CGRect(x: 1, y: 4, width: 10, height: 40))
    }
}
