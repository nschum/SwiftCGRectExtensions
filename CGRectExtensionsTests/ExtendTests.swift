import CGRectExtensions
import XCTest

class ExtendTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 20, height: 40)

    func testExtending() {
        XCTAssertEqual(rect.rectByExtending(-5), CGRect(x: 6, y: 7, width: 10, height: 30))
    }

    func testExtendingDxDy() {
        XCTAssertEqual(
            rect.rectByExtending(dx: -3, dy: -5),
            CGRect(x: 4, y: 7, width: 14, height: 30))
    }

    func testExtendingDx() {
        XCTAssertEqual(rect.rectByExtending(dx: -5), CGRect(x: 6, y: 2, width: 10, height: 40))
    }

    func testExtendingDy() {
        XCTAssertEqual(rect.rectByExtending(dy: -5), CGRect(x: 1, y: 7, width: 20, height: 30))
    }

    func testExtendingMinXMinYMaxXMaxY() {
        XCTAssertEqual(rect.rectByExtending(minX: -5, minY: -10, maxX: -3, maxY: -7),
            CGRect(x: 6, y: 12, width: 12, height: 23))
    }

    func testExtendingMinX() {
        XCTAssertEqual(rect.rectByExtending(minX: -5), CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testExtendingMaxX() {
        XCTAssertEqual(rect.rectByExtending(maxX: -5), CGRect(x: 1, y: 2, width: 15, height: 40))
    }

    func testExtendingMinXMinY() {
        XCTAssertEqual(
            rect.rectByExtending(minX: -5, minY: -10),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingMinY() {
        XCTAssertEqual(rect.rectByExtending(minY: -10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendingMaxXMinY() {
        XCTAssertEqual(
            rect.rectByExtending(maxX: -5, minY: -10),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendingMinXMaxY() {
        XCTAssertEqual(
            rect.rectByExtending(minX: -5, maxY: -10),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingMaxY() {
        XCTAssertEqual(rect.rectByExtending(maxY: -10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendingMaxXMaxY() {
        XCTAssertEqual(
            rect.rectByExtending(maxX: -5, maxY: -10),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendingLeft() {
        XCTAssertEqual(rect.rectByExtending(left: -5), CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testExtendingRight() {
        XCTAssertEqual(rect.rectByExtending(right: -5), CGRect(x: 1, y: 2, width: 15, height: 40))
    }
}

#if os(OSX)
class ExtendPlatformTests: ExtendTests {

    func testExtendingTopLeft() {
        XCTAssertEqual(
            rect.rectByExtending(top: -10, left: -5),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingTop() {
        XCTAssertEqual(rect.rectByExtending(top: -10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendingTopRight() {
        XCTAssertEqual(
            rect.rectByExtending(top: -10, right: -5),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendingBottomLeft() {
        XCTAssertEqual(
            rect.rectByExtending(bottom: -10, left: -5),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingBottom() {
        XCTAssertEqual(
            rect.rectByExtending(bottom: -10),
            CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendingBottomRight() {
        XCTAssertEqual(
            rect.rectByExtending(bottom: -10, right: -5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendingTopLeftSize() {
        XCTAssertEqual(
            rect.rectByExtending(topLeft: CGSize(width: -5, height: -10)),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingTopRightSize() {
        XCTAssertEqual(
            rect.rectByExtending(topRight: CGSize(width: -5, height: -10)),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendingBottomLeftSize() {
        XCTAssertEqual(
            rect.rectByExtending(bottomLeft: CGSize(width: -5, height: -10)),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingBottomRightSize() {
        XCTAssertEqual(
            rect.rectByExtending(bottomRight: CGSize(width: -5, height: -10)),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }
}
#else
class ExtendPlatformTests: ExtendTests {

    func testExtendingTopLeft() {
        XCTAssertEqual(
            rect.rectByExtending(top: -10, left: -5),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingTop() {
        XCTAssertEqual(rect.rectByExtending(top: -10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendingTopRight() {
        XCTAssertEqual(
            rect.rectByExtending(top: -10, right: -5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendingBottomLeft() {
        XCTAssertEqual(
            rect.rectByExtending(bottom: -10, left: -5),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingBottom() {
        XCTAssertEqual(rect.rectByExtending(bottom: -10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendingBottomRight() {
        XCTAssertEqual(
            rect.rectByExtending(bottom: -10, right: -5),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendingTopLeftSize() {
        XCTAssertEqual(
            rect.rectByExtending(topLeft: CGSize(width: -5, height: -10)),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendingTopRightSize() {
        XCTAssertEqual(
            rect.rectByExtending(topRight: CGSize(width: -5, height: -10)),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendingBottomLeftSize() {
        XCTAssertEqual(
            rect.rectByExtending(bottomLeft: CGSize(width: -5, height: -10)),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendingBottomRightSize() {
        XCTAssertEqual(
            rect.rectByExtending(bottomRight: CGSize(width: -5, height: -10)),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }
}
#endif

class MutatingExtendTests: XCTestCase {

    var rect = CGRect(x: 1, y: 2, width: 20, height: 40)

    func testExtendting() {
        rect.extend(-5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 7, width: 10, height: 30))
    }

    func testExtendtingDx() {
        rect.extend(dx: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 10, height: 40))
    }

    func testExtendtingDy() {
        rect.extend(dy: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 7, width: 20, height: 30))
    }

    func testExtendtingMinXMinYMaxXMaxY() {
        rect.extend(minX: -5, minY: -10, maxX: -3, maxY: -7)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 12, height: 23))
    }

    func testExtendtingMinX() {
        rect.extend(minX: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testExtendtingMaxX() {
        rect.extend(maxX: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 40))
    }

    func testExtendtingMinXMinY() {
        rect.extend(minX: -5, minY: -10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingMinY() {
        rect.extend(minY: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendtingMaxXMinY() {
        rect.extend(maxX: -5, minY: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendtingMinXMaxY() {
        rect.extend(minX: -5, maxY: -10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendtingMaxY() {
        rect.extend(maxY: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendtingMaxXMaxY() {
        rect.extend(maxX: -5, maxY: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendtingLeft() {
        rect.extend(left: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testExtendtingRight() {
        rect.extend(right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 40))
    }
}

#if os(OSX)
class MutatingExtendPlatformTests: MutatingExtendTests {

    func testExtendtingTopLeft() {
       rect.extend(top: -10, left: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendtingTop() {
        rect.extend(top: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendtingTopRight() {
        rect.extend(top: -10, right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendtingBottomLeft() {
        rect.extend(bottom: -10, left: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingBottom() {
        rect.extend(bottom: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendtingBottomRight() {
        rect.extend(bottom: -10, right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendtingTopLeftSize() {
        rect.extend(topLeft: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendtingTopRightSize() {
        rect.extend(topRight: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendtingBottomLeftSize() {
        rect.extend(bottomLeft: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingBottomRightSize() {
        rect.extend(bottomRight: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }
}
#else
class MutatingExtendPlatformTests: MutatingExtendTests {

    func testExtendtingTopLeft() {
        rect.extend(top: -10, left: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingTop() {
        rect.extend(top: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testExtendtingTopRight() {
        rect.extend(top: -10, right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendtingBottomLeft() {
        rect.extend(bottom: -10, left: -5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testExtendtingBottom() {
        rect.extend(bottom: -10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testExtendtingBottomRight() {
        rect.extend(bottom: -10, right: -5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testExtendtingTopLeftSize() {
        rect.extend(topLeft: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testExtendtingTopRightSize() {
        rect.extend(topRight: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testExtendtingBottomLeftSize() {
        rect.extend(bottomLeft: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }
    
    func testExtendtingBottomRightSize() {
        rect.extend(bottomRight: CGSize(width: -5, height: -10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }
}
#endif
