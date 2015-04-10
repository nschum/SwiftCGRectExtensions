import CGRectExtensions
import XCTest

class PinningTests: XCTestCase {

    let srcRect = CGRect(x: 0, y: 0, width: 100, height: 200)
    
    let controlPoints: [CGRectControlPoint] = [
      .MinXMinY,
      .CenterXMinY,
      .MaxXMinY,
      .MaxXCenterY,
      .MaxXMaxY,
      .CenterXMaxY,
      .MinXMaxY,
      .MinXCenterY,
      .CenterXCenterY,
    ]
    
    func testPinningDistinctControlPoints() {
        for srcCPoint in controlPoints {
            for dstCPoint in controlPoints {
                var dstRect = srcRect.rectByPinning(CGSize(width: 5, height: 8), controlPoint: dstCPoint, toTargetControlPoint: srcCPoint)
                XCTAssertEqual(
                    dstRect.pointOfControlPoint(dstCPoint),
                    srcRect.pointOfControlPoint(srcCPoint)
                )
            }
        }
    }
    
    func testControlPointCGPoint() {
        let expectedPoints: [(CGRectControlPoint, CGPoint)] = [
          (.MinXMinY, CGPoint(0, 0)),
          (.CenterXMinY, CGPoint(50, 0)),
          (.MaxXMinY, CGPoint(100, 0)),
          (.MaxXCenterY, CGPoint(100, 100)),
          (.MaxXMaxY, CGPoint(100, 200)),
          (.CenterXMaxY, CGPoint(50, 200)),
          (.MinXMaxY, CGPoint(0, 200)),
          (.MinXCenterY, CGPoint(0, 100)),
          (.CenterXCenterY, CGPoint(50, 100)),
        ]
        for (cPoint, cgPoint) in expectedPoints {
            XCTAssertEqual(
                srcRect.pointOfControlPoint(cPoint),
                cgPoint
            )
        }
    }
}

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
            rect.rectByPinning(CGSize(width: 5, height: 8), controlPoints: .MinXMinY),
            CGRect(x: 1, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxXMinY() {
        XCTAssertEqual(
            rect.rectByPinning(CGSize(width: 5, height: 8), controlPoints: .MaxXMinY),
            CGRect(x: 6, y: 2, width: 5, height: 8))
    }
    
    func testCenteringAtMinXMaxY() {
        XCTAssertEqual(
            rect.rectByPinning(CGSize(width: 5, height: 8), controlPoints: .MinXMaxY),
            CGRect(x: 1, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMaxXMaxY() {
        XCTAssertEqual(
            rect.rectByPinning(CGSize(width: 5, height: 8), controlPoints: .MaxXMaxY),
            CGRect(x: 6, y: 14, width: 5, height: 8))
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
        rect.setSizeWhilePinning(CGSize(width: 5, height: 8), controlPoints: .MinXMinY)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMaxXMinY() {
        rect.setSizeWhilePinning(CGSize(width: 5, height: 8), controlPoints: .MaxXMinY)
        XCTAssertEqual(rect, CGRect(x: 6, y: 2, width: 5, height: 8))
    }

    func testCenteringAtMinXMaxY() {
        rect.setSizeWhilePinning(CGSize(width: 5, height: 8), controlPoints: .MinXMaxY)
        XCTAssertEqual(rect, CGRect(x: 1, y: 14, width: 5, height: 8))
    }

    func testCenteringAtMaxXMaxY() {
        rect.setSizeWhilePinning(CGSize(width: 5, height: 8), controlPoints: .MaxXMaxY)
        XCTAssertEqual(rect, CGRect(x: 6, y: 14, width: 5, height: 8))
    }

}
