import CGRectExtensions
import XCTest

class PropertyGetterTests: XCTestCase {

    let rect = CGRect(x: 1, y: 2, width: 10, height: 20)

    func testX() {
        XCTAssertEqual(rect.x, CGFloat(1))
    }

    func testY() {
        XCTAssertEqual(rect.y, CGFloat(2))
    }
    
    func testCenterX() {
        XCTAssertEqual(rect.centerX, CGFloat(6))
    }

    func testCenterY() {
        XCTAssertEqual(rect.centerY, CGFloat(12))
    }

    func testLeft() {
        XCTAssertEqual(rect.left, CGFloat(1))
    }

    func testRight() {
        XCTAssertEqual(rect.right, CGFloat(11))
    }

    func testCenterLeft() {
        XCTAssertEqual(rect.centerLeft, CGPoint(x: 1, y: 12))
    }

    func testCenter() {
        XCTAssertEqual(rect.center, CGPoint(x: 6, y: 12))
    }

    func testCenterRight() {
        XCTAssertEqual(rect.centerRight, CGPoint(x: 11, y: 12))
    }
}

#if os(OSX)
class PropertyGetterPlatformTests: PropertyGetterTests {

    func testTop() {
        XCTAssertEqual(rect.top, CGFloat(22))
    }

    func testTopLeft() {
        XCTAssertEqual(rect.topLeft, CGPoint(x: 1, y: 22))
    }

    func testTopCenter() {
        XCTAssertEqual(rect.topCenter, CGPoint(x: 6, y: 22))
    }

    func testTopRight() {
        XCTAssertEqual(rect.topRight, CGPoint(x: 11, y: 22))
    }

    func testBottom() {
        XCTAssertEqual(rect.bottom, CGFloat(2))
    }

    func testBottomLeft() {
        XCTAssertEqual(rect.bottomLeft, CGPoint(x: 1, y: 2))
    }

    func testBottomCenter() {
        XCTAssertEqual(rect.bottomCenter, CGPoint(x: 6, y: 2))
    }

    func testBottomRight() {
        XCTAssertEqual(rect.bottomRight, CGPoint(x: 11, y: 2))
    }
}
#else
class PropertyGetterPlatformTests: PropertyGetterTests {

    func testTop() {
        XCTAssertEqual(rect.top, CGFloat(2))
    }

    func testTopLeft() {
        XCTAssertEqual(rect.topLeft, CGPoint(x: 1, y: 2))
    }

    func testTopCenter() {
        XCTAssertEqual(rect.topCenter, CGPoint(x: 6, y: 2))
    }

    func testTopRight() {
        XCTAssertEqual(rect.topRight, CGPoint(x: 11, y: 2))
    }

    func testBottom() {
        XCTAssertEqual(rect.bottom, CGFloat(22))
    }

    func testBottomLeft() {
        XCTAssertEqual(rect.bottomLeft, CGPoint(x: 1, y: 22))
    }

    func testBottomCenter() {
        XCTAssertEqual(rect.bottomCenter, CGPoint(x: 6, y: 22))
    }

    func testBottomRight() {
        XCTAssertEqual(rect.bottomRight, CGPoint(x: 11, y: 22))
    }
}
#endif

class PropertySetterTests: XCTestCase {

    var rect = CGRect(x: 0, y: 0, width: 10, height: 20)

    func testX() {
        rect.x = 1
        XCTAssertEqual(rect, CGRect(x: 1, y: 0, width: 10, height: 20))
    }

    func testY() {
        rect.y = 2
        XCTAssertEqual(rect, CGRect(x: 0, y: 2, width: 10, height: 20))
    }

    func testCenterX() {
        rect.centerX = 6
        XCTAssertEqual(rect, CGRect(x: 1, y: 0, width: 10, height: 20))
    }

    func testCenterY() {
        rect.centerY = 12
        XCTAssertEqual(rect, CGRect(x: 0, y: 2, width: 10, height: 20))
    }

    func testLeft() {
        rect.left = 1
        XCTAssertEqual(rect, CGRect(x: 1, y: 0, width: 10, height: 20))
    }

    func testRight() {
        rect.right = 11
        XCTAssertEqual(rect, CGRect(x: 1, y: 0, width: 10, height: 20))
    }
}

#if os(OSX)
class PropertySetterPlatformTests: PropertySetterTests {
    func testTop() {
        rect.top = 22
        XCTAssertEqual(rect, CGRect(x: 0, y: 2, width: 10, height: 20))
    }

    func testBottom() {
        rect.bottom = 2
        XCTAssertEqual(rect, CGRect(x: 0, y: 2, width: 10, height: 20))
    }

    func testTopLeft() {
        rect.topLeft = CGPoint(x: 1, y: 22)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testTopCenter() {
        rect.topCenter = CGPoint(x: 6, y: 22)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testTopRight() {
        rect.topRight = CGPoint(x: 11, y: 22)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testCenterLeft() {
        rect.centerLeft = CGPoint(x: 1, y: 12)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testCenter() {
        rect.center = CGPoint(x: 6, y: 12)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testCenterRight() {
        rect.centerRight = CGPoint(x: 11, y: 12)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testBottomLeft() {
        rect.bottomLeft = CGPoint(x: 1, y: 2)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testBottomCenter() {
        rect.bottomCenter = CGPoint(x: 6, y: 2)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testBottomRight() {
        rect.bottomRight = CGPoint(x: 11, y: 2)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }
}
#else
class PropertySetterPlatformTests: PropertySetterTests {
    func testTop() {
        rect.top = 2
        XCTAssertEqual(rect, CGRect(x: 0, y: 2, width: 10, height: 20))
    }

    func testBottom() {
        rect.bottom = 22
        XCTAssertEqual(rect, CGRect(x: 0, y: 2, width: 10, height: 20))
    }

    func testTopLeft() {
        rect.topLeft = CGPoint(x: 1, y: 2)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testTopCenter() {
        rect.topCenter = CGPoint(x: 6, y: 2)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testTopRight() {
        rect.topRight = CGPoint(x: 11, y: 2)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testCenterLeft() {
        rect.centerLeft = CGPoint(x: 1, y: 12)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testCenter() {
        rect.center = CGPoint(x: 6, y: 12)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testCenterRight() {
        rect.centerRight = CGPoint(x: 11, y: 12)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testBottomLeft() {
        rect.bottomLeft = CGPoint(x: 1, y: 22)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testBottomCenter() {
        rect.bottomCenter = CGPoint(x: 6, y: 22)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }

    func testBottomRight() {
        rect.bottomRight = CGPoint(x: 11, y: 22)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 10, height: 20))
    }
}
#endif
