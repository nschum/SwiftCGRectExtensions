import CGRectExtensions
import XCTest

class InsetTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 20, height: 40)

    func testInsetting() {
        XCTAssertEqual(rect.insetBy(5), CGRect(x: 6, y: 7, width: 10, height: 30))
    }

    func testInsettingDx() {
        XCTAssertEqual(rect.insetBy(dx: 5), CGRect(x: 6, y: 2, width: 10, height: 40))
    }

    func testInsettingDy() {
        XCTAssertEqual(rect.insetBy(dy: 5), CGRect(x: 1, y: 7, width: 20, height: 30))
    }

    func testInsettingMinXMinYMaxXMaxY() {
        XCTAssertEqual(rect.insetBy(minX: 5, minY: 10, maxX: 3, maxY: 7),
            CGRect(x: 6, y: 12, width: 12, height: 23))
    }

    func testInsettingMinX() {
        XCTAssertEqual(rect.insetBy(minX: 5), CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testInsettingMaxX() {
        XCTAssertEqual(rect.insetBy(maxX: 5), CGRect(x: 1, y: 2, width: 15, height: 40))
    }

    func testInsettingMinXMinY() {
        XCTAssertEqual(
            rect.insetBy(minX: 5, minY: 10),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingMinY() {
        XCTAssertEqual(rect.insetBy(minY: 10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingMaxXMinY() {
        XCTAssertEqual(
            rect.insetBy(minY: 10, maxX: 5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingMinXMaxY() {
        XCTAssertEqual(
            rect.insetBy(minX: 5, maxY: 10),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingMaxY() {
        XCTAssertEqual(rect.insetBy(maxY: 10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingMaxXMaxY() {
        XCTAssertEqual(
            rect.insetBy(maxX: 5, maxY: 10),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingLeft() {
        XCTAssertEqual(rect.insetBy(left: 5), CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testInsettingRight() {
        XCTAssertEqual(rect.insetBy(right: 5), CGRect(x: 1, y: 2, width: 15, height: 40))
    }
}

#if os(OSX)
class InsetPlatformTests: InsetTests {

    func testInsettingTopLeft() {
        XCTAssertEqual(
            rect.insetBy(top: 10, left: 5),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingTop() {
        XCTAssertEqual(rect.insetBy(top: 10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingTopRight() {
        XCTAssertEqual(
            rect.insetBy(top: 10, right: 5),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomLeft() {
        XCTAssertEqual(
            rect.insetBy(left: 5, bottom: 10),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingBottom() {
        XCTAssertEqual(rect.insetBy(bottom: 10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingBottomRight() {
        XCTAssertEqual(
            rect.insetBy(bottom: 10, right: 5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingTopLeftSize() {
        XCTAssertEqual(
            rect.insetBy(topLeft: CGSize(width: 5, height: 10)),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingTopRightSize() {
        XCTAssertEqual(
            rect.insetBy(topRight: CGSize(width: 5, height: 10)),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomLeftSize() {
        XCTAssertEqual(
            rect.insetBy(bottomLeft: CGSize(width: 5, height: 10)),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomRightSize() {
        XCTAssertEqual(
            rect.insetBy(bottomRight: CGSize(width: 5, height: 10)),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }
}
#else
class InsetPlatformTests: InsetTests {

    func testInsettingTopLeft() {
        XCTAssertEqual(
            rect.insetBy(top: 10, left: 5),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingTop() {
        XCTAssertEqual(rect.insetBy(top: 10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingTopRight() {
        XCTAssertEqual(
            rect.insetBy(top: 10, right: 5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomLeft() {
        XCTAssertEqual(
            rect.insetBy(left: 5, bottom: 10),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingBottom() {
        XCTAssertEqual(rect.insetBy(bottom: 10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingBottomRight() {
        XCTAssertEqual(
            rect.insetBy(bottom: 10, right: 5),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingTopLeftSize() {
        XCTAssertEqual(
            rect.insetBy(topLeft: CGSize(width: 5, height: 10)),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingTopRightSize() {
        XCTAssertEqual(
            rect.insetBy(topRight: CGSize(width: 5, height: 10)),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomLeftSize() {
        XCTAssertEqual(
            rect.insetBy(bottomLeft: CGSize(width: 5, height: 10)),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomRightSize() {
        XCTAssertEqual(
            rect.insetBy(bottomRight: CGSize(width: 5, height: 10)),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }
}
#endif

class MutatingInsetTests: XCTestCase {

    var rect = CGRect(x: 1, y: 2, width: 20, height: 40)

    func testInsetting() {
        rect.insetInPlace(5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 7, width: 10, height: 30))
    }

    func testInsettingDx() {
        rect.insetInPlace(dx: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 10, height: 40))
    }

    func testInsettingDy() {
        rect.insetInPlace(dy: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 7, width: 20, height: 30))
    }

    func testInsettingMinXMinYMaxXMaxY() {
        rect.insetInPlace(minX: 5, minY: 10, maxX: 3, maxY: 7)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 12, height: 23))
    }

    func testInsettingMinX() {
        rect.insetInPlace(minX: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testInsettingMaxX() {
        rect.insetInPlace(maxX: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 40))
    }

    func testInsettingMinXMinY() {
        rect.insetInPlace(minX: 5, minY: 10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingMinY() {
        rect.insetInPlace(minY: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingMaxXMinY() {
        rect.insetInPlace(minY: 10, maxX: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingMinXMaxY() {
        rect.insetInPlace(minX: 5, maxY: 10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingMaxY() {
        rect.insetInPlace(maxY: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingMaxXMaxY() {
        rect.insetInPlace(maxX: 5, maxY: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingLeft() {
        rect.insetInPlace(left: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testInsettingRight() {
        rect.insetInPlace(right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 40))
    }
}

#if os(OSX)
class MutatingInsetPlatformTests: MutatingInsetTests {

    func testInsettingTopLeft() {
        rect.insetInPlace(top: 10, left: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingTop() {
        rect.insetInPlace(top: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingTopRight() {
        rect.insetInPlace(top: 10, right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomLeft() {
        rect.insetInPlace(left: 5, bottom: 10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingBottom() {
        rect.insetInPlace(bottom: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingBottomRight() {
        rect.insetInPlace(bottom: 10, right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingTopLeftSize() {
        rect.insetInPlace(topLeft: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingTopRightSize() {
        rect.insetInPlace(topRight: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomLeftSize() {
        rect.insetInPlace(bottomLeft: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomRightSize() {
        rect.insetInPlace(bottomRight: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }
}
#else
class MutatingInsetPlatformTests: MutatingInsetTests {

    func testInsettingTopLeft() {
        rect.insetInPlace(top: 10, left: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingTop() {
        rect.insetInPlace(top: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingTopRight() {
        rect.insetInPlace(top: 10, right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomLeft() {
        rect.insetInPlace(left: 5, bottom: 10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingBottom() {
        rect.insetInPlace(bottom: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingBottomRight() {
        rect.insetInPlace(bottom: 10, right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingTopLeftSize() {
        rect.insetInPlace(topLeft: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingTopRightSize() {
        rect.insetInPlace(topRight: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomLeftSize() {
        rect.insetInPlace(bottomLeft: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }
    
    func testInsettingBottomRightSize() {
        rect.insetInPlace(bottomRight: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }
}
#endif
