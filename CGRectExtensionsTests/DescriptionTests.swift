import CGRectExtensions
import XCTest

class DescriptionTests: XCTestCase {

    func testTransformDescription() {
        let transform = CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6)
        XCTAssertEqual(transform.debugDescription, "(1.0,2.0,3.0,4.0,5.0,6.0)")
    }
}
