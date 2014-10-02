import CGRectExtensions
import XCTest

class SizesTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 10, height: 20)

    func testCentering() {
        XCTAssertEqual(
            rect.rectByCentering(CGSize(width: 5, height: 8)),
            CGRect(x: 3.5, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMinX() {
        XCTAssertEqual(
            rect.rectByCentering(CGSize(width: 5, height: 8), alignTo: .MinXEdge),
            CGRect(x: 1, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMaxX() {
        XCTAssertEqual(
            rect.rectByCentering(CGSize(width: 5, height: 8), alignTo: .MaxXEdge),
            CGRect(x: 6, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMinY() {
        XCTAssertEqual(
            rect.rectByCentering(CGSize(width: 5, height: 8), alignTo: .MinYEdge),
            CGRect(x: 3.5, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxY() {
        XCTAssertEqual(
            rect.rectByCentering(CGSize(width: 5, height: 8), alignTo: .MaxYEdge),
            CGRect(x: 3.5, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMinXMinY() {
        XCTAssertEqual(
            rect.rectByAligning(CGSize(width: 5, height: 8), corner: .MinXEdge, .MinYEdge),
            CGRect(x: 1, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxXMinY() {
        XCTAssertEqual(
            rect.rectByAligning(CGSize(width: 5, height: 8), corner: .MaxXEdge, .MinYEdge),
            CGRect(x: 6, y: 2, width: 5, height: 8))
    }
    
    func testCenteringAtMinXMaxY() {
        XCTAssertEqual(
            rect.rectByAligning(CGSize(width: 5, height: 8), corner: .MinXEdge, .MaxYEdge),
            CGRect(x: 1, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMaxXMaxY() {
        XCTAssertEqual(
            rect.rectByAligning(CGSize(width: 5, height: 8), corner: .MaxXEdge, .MaxYEdge),
            CGRect(x: 6, y: 14, width: 5, height: 8))
    }
    
    func testCenteringPermutation() {
        let combinations: [(CGRectEdge, CGRectEdge)] = [
            (.MinXEdge, .MinYEdge), (.MaxXEdge, .MinYEdge),
            (.MinXEdge, .MaxYEdge), (.MaxXEdge, .MaxYEdge)
        ]
        for (edge1, edge2) in combinations {
            let size = CGSize(width: 5, height: 8)
            XCTAssertEqual(
                rect.rectByAligning(size, corner: edge1, edge2),
                rect.rectByAligning(size, corner: edge2, edge1))
        }
    }
}

class MutatingSizesTests: XCTestCase {

    var rect = CGRect(x: 1, y: 2, width: 10, height: 20)

    func testCentering() {
        rect.setSizeCentered(CGSize(width: 5, height: 8))
        XCTAssertEqual(rect, CGRect(x: 3.5, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMinX() {
        rect.setSizeCentered(CGSize(width: 5, height: 8), alignTo: .MinXEdge)
        XCTAssertEqual(rect, CGRect(x: 1, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMaxX() {
        rect.setSizeCentered(CGSize(width: 5, height: 8), alignTo: .MaxXEdge)
        XCTAssertEqual(rect, CGRect(x: 6, y: 8, width: 5, height: 8))
    }

    func testCenteringAtMinY() {
        rect.setSizeCentered(CGSize(width: 5, height: 8), alignTo: .MinYEdge)
        XCTAssertEqual(rect, CGRect(x: 3.5, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxY() {
        rect.setSizeCentered(CGSize(width: 5, height: 8), alignTo: .MaxYEdge)
        XCTAssertEqual(rect, CGRect(x: 3.5, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMinXMinY() {
        rect.setSizeAligned(CGSize(width: 5, height: 8), corner: .MinXEdge, .MinYEdge)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxXMinY() {
        rect.setSizeAligned(CGSize(width: 5, height: 8), corner: .MaxXEdge, .MinYEdge)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMinXMaxY() {
        rect.setSizeAligned(CGSize(width: 5, height: 8), corner: .MinXEdge, .MaxYEdge)
        XCTAssertEqual(rect, CGRect(x: 1, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMaxXMaxY() {
        rect.setSizeAligned(CGSize(width: 5, height: 8), corner: .MaxXEdge, .MaxYEdge)
        XCTAssertEqual(rect, CGRect(x: 6, y: 14, width: 5, height: 8))
    }

    func testCenteringPermutation() {
        let combinations: [(CGRectEdge, CGRectEdge)] = [
            (.MinXEdge, .MinYEdge), (.MaxXEdge, .MinYEdge),
            (.MinXEdge, .MaxYEdge), (.MaxXEdge, .MaxYEdge)
        ]
        let size = CGSize(width: 5, height: 8)
        for (edge1, edge2) in combinations {
            var rect1 = rect
            var rect2 = rect
            rect1.setSizeAligned(size, corner: edge1, edge2)
            rect2.setSizeAligned(size, corner: edge2, edge1)
            XCTAssertEqual(rect1, rect2)
        }
    }
}
