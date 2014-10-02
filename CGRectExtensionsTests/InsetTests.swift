import CGRectExtensions
import XCTest

class InsetTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 20, height: 40)

    func testInsetting() {
        XCTAssertEqual(rect.rectByInsetting(5), CGRect(x: 6, y: 7, width: 10, height: 30))
    }

    func testInsettingDx() {
        XCTAssertEqual(rect.rectByInsetting(dx: 5), CGRect(x: 6, y: 2, width: 10, height: 40))
    }

    func testInsettingDy() {
        XCTAssertEqual(rect.rectByInsetting(dy: 5), CGRect(x: 1, y: 7, width: 20, height: 30))
    }

    func testInsettingMinXMinYMaxXMaxY() {
        XCTAssertEqual(rect.rectByInsetting(minX: 5, minY: 10, maxX: 3, maxY: 7),
            CGRect(x: 6, y: 12, width: 12, height: 23))
    }

    func testInsettingMinX() {
        XCTAssertEqual(rect.rectByInsetting(minX: 5), CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testInsettingMaxX() {
        XCTAssertEqual(rect.rectByInsetting(maxX: 5), CGRect(x: 1, y: 2, width: 15, height: 40))
    }

    func testInsettingMinXMinY() {
        XCTAssertEqual(
            rect.rectByInsetting(minX: 5, minY: 10),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingMinY() {
        XCTAssertEqual(rect.rectByInsetting(minY: 10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingMaxXMinY() {
        XCTAssertEqual(
            rect.rectByInsetting(maxX: 5, minY: 10),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingMinXMaxY() {
        XCTAssertEqual(
            rect.rectByInsetting(minX: 5, maxY: 10),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingMaxY() {
        XCTAssertEqual(rect.rectByInsetting(maxY: 10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingMaxXMaxY() {
        XCTAssertEqual(
            rect.rectByInsetting(maxX: 5, maxY: 10),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingLeft() {
        XCTAssertEqual(rect.rectByInsetting(left: 5), CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testInsettingRight() {
        XCTAssertEqual(rect.rectByInsetting(right: 5), CGRect(x: 1, y: 2, width: 15, height: 40))
    }
}

#if os(OSX)
class InsetPlatformTests: InsetTests {

    func testInsettingTopLeft() {
        XCTAssertEqual(
            rect.rectByInsetting(top: 10, left: 5),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingTop() {
        XCTAssertEqual(rect.rectByInsetting(top: 10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingTopRight() {
        XCTAssertEqual(
            rect.rectByInsetting(top: 10, right: 5),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomLeft() {
        XCTAssertEqual(
            rect.rectByInsetting(bottom: 10, left: 5),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingBottom() {
        XCTAssertEqual(rect.rectByInsetting(bottom: 10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingBottomRight() {
        XCTAssertEqual(
            rect.rectByInsetting(bottom: 10, right: 5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingTopLeftSize() {
        XCTAssertEqual(
            rect.rectByInsetting(topLeft: CGSize(width: 5, height: 10)),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingTopRightSize() {
        XCTAssertEqual(
            rect.rectByInsetting(topRight: CGSize(width: 5, height: 10)),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomLeftSize() {
        XCTAssertEqual(
            rect.rectByInsetting(bottomLeft: CGSize(width: 5, height: 10)),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomRightSize() {
        XCTAssertEqual(
            rect.rectByInsetting(bottomRight: CGSize(width: 5, height: 10)),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }
}
#else
class InsetPlatformTests: InsetTests {

    func testInsettingTopLeft() {
        XCTAssertEqual(
            rect.rectByInsetting(top: 10, left: 5),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingTop() {
        XCTAssertEqual(rect.rectByInsetting(top: 10), CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingTopRight() {
        XCTAssertEqual(
            rect.rectByInsetting(top: 10, right: 5),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomLeft() {
        XCTAssertEqual(
            rect.rectByInsetting(bottom: 10, left: 5),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingBottom() {
        XCTAssertEqual(rect.rectByInsetting(bottom: 10), CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingBottomRight() {
        XCTAssertEqual(
            rect.rectByInsetting(bottom: 10, right: 5),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingTopLeftSize() {
        XCTAssertEqual(
            rect.rectByInsetting(topLeft: CGSize(width: 5, height: 10)),
            CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingTopRightSize() {
        XCTAssertEqual(
            rect.rectByInsetting(topRight: CGSize(width: 5, height: 10)),
            CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomLeftSize() {
        XCTAssertEqual(
            rect.rectByInsetting(bottomLeft: CGSize(width: 5, height: 10)),
            CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomRightSize() {
        XCTAssertEqual(
            rect.rectByInsetting(bottomRight: CGSize(width: 5, height: 10)),
            CGRect(x: 1, y: 2, width: 15, height: 30))
    }
}
#endif

class MutatingInsetTests: XCTestCase {

    var rect = CGRect(x: 1, y: 2, width: 20, height: 40)

    func testInsetting() {
        rect.inset(5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 7, width: 10, height: 30))
    }

    func testInsettingDx() {
        rect.inset(dx: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 10, height: 40))
    }

    func testInsettingDy() {
        rect.inset(dy: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 7, width: 20, height: 30))
    }

    func testInsettingMinXMinYMaxXMaxY() {
        rect.inset(minX: 5, minY: 10, maxX: 3, maxY: 7)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 12, height: 23))
    }

    func testInsettingMinX() {
        rect.inset(minX: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testInsettingMaxX() {
        rect.inset(maxX: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 40))
    }

    func testInsettingMinXMinY() {
        rect.inset(minX: 5, minY: 10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingMinY() {
        rect.inset(minY: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingMaxXMinY() {
        rect.inset(maxX: 5, minY: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingMinXMaxY() {
        rect.inset(minX: 5, maxY: 10)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingMaxY() {
        rect.inset(maxY: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingMaxXMaxY() {
        rect.inset(maxX: 5, maxY: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingLeft() {
        rect.inset(left: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 40))
    }

    func testInsettingRight() {
        rect.inset(right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 40))
    }
}

#if os(OSX)
class MutatingInsetPlatformTests: MutatingInsetTests {

    func testInsettingTopLeft() {
        rect.inset(top: 10, left: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingTop() {
        rect.inset(top: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingTopRight() {
        rect.inset(top: 10, right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomLeft() {
        rect.inset(bottom: 10, left: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingBottom() {
        rect.inset(bottom: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingBottomRight() {
        rect.inset(bottom: 10, right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingTopLeftSize() {
        rect.inset(topLeft: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingTopRightSize() {
        rect.inset(topRight: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingBottomLeftSize() {
        rect.inset(bottomLeft: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomRightSize() {
        rect.inset(bottomRight: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }
}
#else
class MutatingInsetPlatformTests: MutatingInsetTests {

    func testInsettingTopLeft() {
        rect.inset(top: 10, left: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingTop() {
        rect.inset(top: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 20, height: 30))
    }

    func testInsettingTopRight() {
        rect.inset(top: 10, right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomLeft() {
        rect.inset(bottom: 10, left: 5)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }

    func testInsettingBottom() {
        rect.inset(bottom: 10)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 20, height: 30))
    }

    func testInsettingBottomRight() {
        rect.inset(bottom: 10, right: 5)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }

    func testInsettingTopLeftSize() {
        rect.inset(topLeft: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 12, width: 15, height: 30))
    }

    func testInsettingTopRightSize() {
        rect.inset(topRight: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 12, width: 15, height: 30))
    }

    func testInsettingBottomLeftSize() {
        rect.inset(bottomLeft: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 15, height: 30))
    }
    
    func testInsettingBottomRightSize() {
        rect.inset(bottomRight: CGSize(width: 5, height: 10))
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 15, height: 30))
    }
}
#endif
