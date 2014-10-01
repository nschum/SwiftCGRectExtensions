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
