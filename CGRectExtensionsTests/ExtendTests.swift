import CGRectExtensions
import XCTest

class ExtendTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 20, height: 40)

    func testExtending() {
        XCTAssertEqual(rect.extendBy(-5), CGRect(x: 6, y: 7, width: 10, height: 30))
    }

    func testExtendingDxDy() {
        XCTAssertEqual(
            rect.extendBy(dx: -3, dy: -5),
            CGRect(x: 4, y: 7, width: 14, height: 30))
    }

    func testExtendingDx() {
        XCTAssertEqual(rect.extendBy(dx: -5), CGRect(x: 6, y: 2, width: 10, height: 40))
    }

    func testExtendingDy() {
        XCTAssertEqual(rect.extendBy(dy: -5), CGRect(x: 1, y: 7, width: 20, height: 30))
    }

    func testExtendingMinXMinYMaxXMaxY() {
        XCTAssertEqual(rect.extendBy(minX: -5, minY: -10, maxX: -3, maxY: -7),
            CGRect(x: 6, y: 12, width: 12, height: 23))
    }

    func testExtendingMinX() {
        XCTAssertEqual(rect.extendBy(minX: -5), CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testExtendingMaxX() {
        XCTAssertEqual(rect.extendBy(maxX: -5), CGRect(x: 1, y: 2, width: 15, height: 40))
    }

    func testExtendingMinXMinY() {
        XCTAssertEqual(
            rect.extendBy(minX: -5, minY: -10),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingMinY() {
        XCTAssertEqual(rect.extendBy(minY: -10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendingMaxXMinY() {
        XCTAssertEqual(
            rect.extendBy(minY: -10, maxX: -5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendingMinXMaxY() {
        XCTAssertEqual(
            rect.extendBy(minX: -5, maxY: -10),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingMaxY() {
        XCTAssertEqual(rect.extendBy(maxY: -10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendingMaxXMaxY() {
        XCTAssertEqual(
            rect.extendBy(maxX: -5, maxY: -10),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendingLeft() {
        XCTAssertEqual(rect.extendBy(left: -5), CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testExtendingRight() {
        XCTAssertEqual(rect.extendBy(right: -5), CGRect(x: 1, y: 2, width: 15, height: 40))
    }
}

#if os(OSX)
class ExtendPlatformTests: ExtendTests {

    func testExtendingTopLeft() {
        XCTAssertEqual(
            rect.extendBy(top: -10, left: -5),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingTop() {
        XCTAssertEqual(rect.extendBy(top: -10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendingTopRight() {
        XCTAssertEqual(
            rect.extendBy(top: -10, right: -5),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendingBottomLeft() {
        XCTAssertEqual(
            rect.extendBy(left: -5, bottom: -10),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingBottom() {
        XCTAssertEqual(
            rect.extendBy(bottom: -10),
            CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendingBottomRight() {
        XCTAssertEqual(
            rect.extendBy(bottom: -10, right: -5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendingTopLeftSize() {
        XCTAssertEqual(
            rect.extendBy(topLeft: CGSize(width: -5, height: -10)),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingTopRightSize() {
        XCTAssertEqual(
            rect.extendBy(topRight: CGSize(width: -5, height: -10)),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendingBottomLeftSize() {
        XCTAssertEqual(
            rect.extendBy(bottomLeft: CGSize(width: -5, height: -10)),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingBottomRightSize() {
        XCTAssertEqual(
            rect.extendBy(bottomRight: CGSize(width: -5, height: -10)),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }
}
#else
class ExtendPlatformTests: ExtendTests {

    func testExtendingTopLeft() {
        XCTAssertEqual(
            rect.extendBy(top: -10, left: -5),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingTop() {
        XCTAssertEqual(rect.extendBy(top: -10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendingTopRight() {
        XCTAssertEqual(
            rect.extendBy(top: -10, right: -5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendingBottomLeft() {
        XCTAssertEqual(
            rect.extendBy(left: -5, bottom: -10),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingBottom() {
        XCTAssertEqual(rect.extendBy(bottom: -10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendingBottomRight() {
        XCTAssertEqual(
            rect.extendBy(bottom: -10, right: -5),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendingTopLeftSize() {
        XCTAssertEqual(
            rect.extendBy(topLeft: CGSize(width: -5, height: -10)),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingTopRightSize() {
        XCTAssertEqual(
            rect.extendBy(topRight: CGSize(width: -5, height: -10)),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendingBottomLeftSize() {
        XCTAssertEqual(
            rect.extendBy(bottomLeft: CGSize(width: -5, height: -10)),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingBottomRightSize() {
        XCTAssertEqual(
            rect.extendBy(bottomRight: CGSize(width: -5, height: -10)),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }
}
#endif

class MutatingExtendTests: XCTestCase {

    var rect = CGRect(x: 1, y: 2, width: 20, height: 40)

    func testExtendting() {
        rect.extendInPlace(-5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 7, width: 10, height: 30))
    }

    func testExtendtingDx() {
        rect.extendInPlace(dx: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 10, height: 40))
    }

    func testExtendtingDy() {
        rect.extendInPlace(dy: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 7, width: 20, height: 30))
    }

    func testExtendtingMinXMinYMaxXMaxY() {
        rect.extendInPlace(minX: -5, minY: -10, maxX: -3, maxY: -7)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 12, height: 23))
    }

    func testExtendtingMinX() {
        rect.extendInPlace(minX: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testExtendtingMaxX() {
        rect.extendInPlace(maxX: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 40))
    }

    func testExtendtingMinXMinY() {
        rect.extendInPlace(minX: -5, minY: -10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingMinY() {
        rect.extendInPlace(minY: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendtingMaxXMinY() {
        rect.extendInPlace(minY: -10, maxX: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendtingMinXMaxY() {
        rect.extendInPlace(minX: -5, maxY: -10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendtingMaxY() {
        rect.extendInPlace(maxY: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendtingMaxXMaxY() {
        rect.extendInPlace(maxX: -5, maxY: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendtingLeft() {
        rect.extendInPlace(left: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testExtendtingRight() {
        rect.extendInPlace(right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 40))
    }
}

#if os(OSX)
class MutatingExtendPlatformTests: MutatingExtendTests {

    func testExtendtingTopLeft() {
       rect.extendInPlace(top: -10, left: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendtingTop() {
        rect.extendInPlace(top: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendtingTopRight() {
        rect.extendInPlace(top: -10, right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendtingBottomLeft() {
        rect.extendInPlace(left: -5, bottom: -10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingBottom() {
        rect.extendInPlace(bottom: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendtingBottomRight() {
        rect.extendInPlace(bottom: -10, right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendtingTopLeftSize() {
        rect.extendInPlace(topLeft: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendtingTopRightSize() {
        rect.extendInPlace(topRight: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendtingBottomLeftSize() {
        rect.extendInPlace(bottomLeft: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingBottomRightSize() {
        rect.extendInPlace(bottomRight: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }
}
#else
class MutatingExtendPlatformTests: MutatingExtendTests {

    func testExtendtingTopLeft() {
        rect.extendInPlace(top: -10, left: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingTop() {
        rect.extendInPlace(top: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendtingTopRight() {
        rect.extendInPlace(top: -10, right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendtingBottomLeft() {
        rect.extendInPlace(left: -5, bottom: -10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendtingBottom() {
        rect.extendInPlace(bottom: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendtingBottomRight() {
        rect.extendInPlace(bottom: -10, right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendtingTopLeftSize() {
        rect.extendInPlace(topLeft: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingTopRightSize() {
        rect.extendInPlace(topRight: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendtingBottomLeftSize() {
        rect.extendInPlace(bottomLeft: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }
    
    func testExtendtingBottomRightSize() {
        rect.extendInPlace(bottomRight: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }
}
#endif
