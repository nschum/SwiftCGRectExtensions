import CGRectExtensions
import XCTest

class SizesTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 10, height: 20)

    func testCentering() {
        XCTAssertEqual(
            rect.center(CGSize(width: 5, height: 8)),
            CGRect(x: 3.5, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMinX() {
        XCTAssertEqual(
            rect.center(CGSize(width: 5, height: 8), alignTo: .minXEdge),
            CGRect(x: 1, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMaxX() {
        XCTAssertEqual(
            rect.center(CGSize(width: 5, height: 8), alignTo: .maxXEdge),
            CGRect(x: 6, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMinY() {
        XCTAssertEqual(
            rect.center(CGSize(width: 5, height: 8), alignTo: .minYEdge),
            CGRect(x: 3.5, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxY() {
        XCTAssertEqual(
            rect.center(CGSize(width: 5, height: 8), alignTo: .maxYEdge),
            CGRect(x: 3.5, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMinXMinY() {
        XCTAssertEqual(
            rect.align(CGSize(width: 5, height: 8), corner: .minXEdge, .minYEdge),
            CGRect(x: 1, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxXMinY() {
        XCTAssertEqual(
            rect.align(CGSize(width: 5, height: 8), corner: .maxXEdge, .minYEdge),
            CGRect(x: 6, y: 2, width: 5, height: 8))
    }
    
    func testCenteringAtMinXMaxY() {
        XCTAssertEqual(
            rect.align(CGSize(width: 5, height: 8), corner: .minXEdge, .maxYEdge),
            CGRect(x: 1, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMaxXMaxY() {
        XCTAssertEqual(
            rect.align(CGSize(width: 5, height: 8), corner: .maxXEdge, .maxYEdge),
            CGRect(x: 6, y: 14, width: 5, height: 8))
    }
    
    func testCenteringPermutation() {
        let combinations: [(CGRectEdge, CGRectEdge)] = [
            (.minXEdge, .minYEdge), (.maxXEdge, .minYEdge),
            (.minXEdge, .maxYEdge), (.maxXEdge, .maxYEdge)
        ]
        for (edge1, edge2) in combinations {
            let size = CGSize(width: 5, height: 8)
            XCTAssertEqual(
                rect.align(size, corner: edge1, edge2),
                rect.align(size, corner: edge2, edge1))
        }
    }
}

class MutatingSizesTests: XCTestCase {

    var rect = CGRect(x: 1, y: 2, width: 10, height: 20)

    func testCentering() {
        rect.centerInPlace(CGSize(width: 5, height: 8))
        XCTAssertEqual(rect, CGRect(x: 3.5, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMinX() {
        rect.centerInPlace(CGSize(width: 5, height: 8), alignTo: .minXEdge)
        XCTAssertEqual(rect, CGRect(x: 1, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMaxX() {
        rect.centerInPlace(CGSize(width: 5, height: 8), alignTo: .maxXEdge)
        XCTAssertEqual(rect, CGRect(x: 6, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMinY() {
        rect.centerInPlace(CGSize(width: 5, height: 8), alignTo: .minYEdge)
        XCTAssertEqual(rect, CGRect(x: 3.5, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxY() {
        rect.centerInPlace(CGSize(width: 5, height: 8), alignTo: .maxYEdge)
        XCTAssertEqual(rect, CGRect(x: 3.5, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMinXMinY() {
        rect.alignInPlace(CGSize(width: 5, height: 8), corner: .minXEdge, .minYEdge)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxXMinY() {
        rect.alignInPlace(CGSize(width: 5, height: 8), corner: .maxXEdge, .minYEdge)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMinXMaxY() {
        rect.alignInPlace(CGSize(width: 5, height: 8), corner: .minXEdge, .maxYEdge)
        XCTAssertEqual(rect, CGRect(x: 1, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMaxXMaxY() {
        rect.alignInPlace(CGSize(width: 5, height: 8), corner: .maxXEdge, .maxYEdge)
        XCTAssertEqual(rect, CGRect(x: 6, y: 14, width: 5, height: 8))
    }

    func testCenteringPermutation() {
        let combinations: [(CGRectEdge, CGRectEdge)] = [
            (.minXEdge, .minYEdge), (.maxXEdge, .minYEdge),
            (.minXEdge, .maxYEdge), (.maxXEdge, .maxYEdge)
        ]
        let size = CGSize(width: 5, height: 8)
        for (edge1, edge2) in combinations {
            var rect1 = rect
            var rect2 = rect
            rect1.alignInPlace(size, corner: edge1, edge2)
            rect2.alignInPlace(size, corner: edge2, edge1)
            XCTAssertEqual(rect1, rect2)
        }
    }
}
