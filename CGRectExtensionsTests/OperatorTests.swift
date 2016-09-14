import CGRectExtensions
import XCTest

class PointOperatorTests: XCTestCase {

    var point = CGPoint(x: 1, y: 2)

    func testAddPoint() {
        XCTAssertEqual(point + CGPoint(x: 3, y: 4), CGPoint(x: 4, y: 6))
    }

    func testAddPointAssignment() {
        point += CGPoint(x: 3, y: 4)
        XCTAssertEqual(point, CGPoint(x: 4, y: 6))
    }

    func testSubtractPoint() {
        XCTAssertEqual(point - CGPoint(x: -3, y: -4), CGPoint(x: 4, y: 6))
    }

    func testSubtractPointAssignment() {
        point -= CGPoint(x: -3, y: -4)
        XCTAssertEqual(point, CGPoint(x: 4, y: 6))
    }

    func testAddSize() {
        XCTAssertEqual(point + CGSize(width: 3, height: 4), CGPoint(x: 4, y: 6))
    }

    func testAddSizeAssignment() {
        point += CGSize(width: 3, height: 4)
        XCTAssertEqual(point, CGPoint(x: 4, y: 6))
    }

    func testSubtractSize() {
        XCTAssertEqual(point - CGSize(width: -3, height: -4), CGPoint(x: 4, y: 6))
    }

    func testSubtractSizeAssignment() {
        point -= CGSize(width: -3, height: -4)
        XCTAssertEqual(point, CGPoint(x: 4, y: 6))
    }

    func testAddTuple() {
        XCTAssertEqual(point + (3, 4), CGPoint(x: 4, y: 6))
    }

    func testAddTupleAssignment() {
        point += (3, 4)
        XCTAssertEqual(point, CGPoint(x: 4, y: 6))
    }

    func testSubtractTuple() {
        XCTAssertEqual(point - (-3, -4), CGPoint(x: 4, y: 6))
    }

    func testSubtractTupleAssignment() {
        point -= (-3, -4)
        XCTAssertEqual(point, CGPoint(x: 4, y: 6))
    }

    func testMultiplyScalar() {
        XCTAssertEqual(point * 3, CGPoint(x: 3, y: 6))
    }

    func testMultiplyScalarAssignment() {
        point *= 3
        XCTAssertEqual(point, CGPoint(x: 3, y: 6))
    }

    func testMultiplyTuple() {
        XCTAssertEqual(point * (3, 4), CGPoint(x: 3, y: 8))
    }

    func testMultiplyTupleAssignment() {
        point *= (3, 4)
        XCTAssertEqual(point, CGPoint(x: 3, y: 8))
    }

    func testDivideScalar() {
        XCTAssertEqual(point / 3, CGPoint(x: 1.0/3, y: 2.0/3))
    }

    func testDivideScalarAssignment() {
        point /= 3
        XCTAssertEqual(point, CGPoint(x: 1.0/3, y: 2.0/3))
    }

    func testDivideTuple() {
        XCTAssertEqual(point / (3, 4), CGPoint(x: 1.0/3, y: 0.5))
    }

    func testDivideTupleAssignment() {
        point /= (3, 4)
        XCTAssertEqual(point, CGPoint(x: 1.0/3, y: 0.5))
    }
}

class SizeOperatorTests: XCTestCase {

    var size = CGSize(width: 1, height: 2)

    func testAddSize() {
        XCTAssertEqual(size + CGSize(width: 3, height: 4), CGSize(width: 4, height: 6))
    }

    func testAddSizeAssignment() {
        size += CGSize(width: 3, height: 4)
        XCTAssertEqual(size, CGSize(width: 4, height: 6))
    }

    func testSubtractSize() {
        XCTAssertEqual(size - CGSize(width: -3, height: -4), CGSize(width: 4, height: 6))
    }

    func testSubtractSizeAssignment() {
        size -= CGSize(width: -3, height: -4)
        XCTAssertEqual(size, CGSize(width: 4, height: 6))
    }

    func testAddTuple() {
        XCTAssertEqual(size + (3, 4), CGSize(width: 4, height: 6))
    }

    func testAddTupleAssignment() {
        size += (3, 4)
        XCTAssertEqual(size, CGSize(width: 4, height: 6))
    }

    func testSubtractTuple() {
        XCTAssertEqual(size - (-3, -4), CGSize(width: 4, height: 6))
    }

    func testSubtractTupleAssignment() {
        size -= (-3, -4)
        XCTAssertEqual(size, CGSize(width: 4, height: 6))
    }

    func testMultiplyScalar() {
        XCTAssertEqual(size * 3, CGSize(width: 3, height: 6))
    }

    func testMultiplyScalarAssignment() {
        size *= 3
        XCTAssertEqual(size, CGSize(width: 3, height: 6))
    }

    func testMultiplyTuple() {
        XCTAssertEqual(size * (3, 4), CGSize(width: 3, height: 8))
    }

    func testMultiplyTupleAssignment() {
        size *= (3, 4)
        XCTAssertEqual(size, CGSize(width: 3, height: 8))
    }

    func testDivideScalar() {
        XCTAssertEqual(size / 3, CGSize(width: 1.0/3, height: 2.0/3))
    }

    func testDivideScalarAssignment() {
        size /= 3
        XCTAssertEqual(size, CGSize(width: 1.0/3, height: 2.0/3))
    }

    func testDivideTuple() {
        XCTAssertEqual(size / (3, 4), CGSize(width: 1.0/3, height: 0.5))
    }

    func testDivideTupleAssignment() {
        size /= (3, 4)
        XCTAssertEqual(size, CGSize(width: 1.0/3, height: 0.5))
    }
}

class RectOperatorTests: XCTestCase {

    var rect = CGRect(x: 1, y: 2, width: 10, height: 20)

    func testAddPoint() {
        XCTAssertEqual(rect + CGPoint(x: 3, y: 4), CGRect(x: 4, y: 6, width: 10, height: 20))
    }

    func testAddPointAssignment() {
        rect += CGPoint(x: 3, y: 4)
        XCTAssertEqual(rect, CGRect(x: 4, y: 6, width: 10, height: 20))
    }

    func testSubtractPoint() {
        XCTAssertEqual(rect - CGPoint(x: -3, y: -4), CGRect(x: 4, y: 6, width: 10, height: 20))
    }

    func testSubtractPointAssignment() {
        rect -= CGPoint(x: -3, y: -4)
        XCTAssertEqual(rect, CGRect(x: 4, y: 6, width: 10, height: 20))
    }

    func testAddSize() {
        XCTAssertEqual(
            rect + CGSize(width: 3, height: 4),
            CGRect(x: 1, y: 2, width: 13, height: 24))
    }

    func testAddSizeAssignment() {
        rect += CGSize(width: 3, height: 4)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 13, height: 24))
    }

    func testSubtractSize() {
        XCTAssertEqual(
            rect - CGSize(width: -3, height: -4),
            CGRect(x: 1, y: 2, width: 13, height: 24))
    }

    func testSubtractSizeAssignment() {
        rect -= CGSize(width: -3, height: -4)
        XCTAssertEqual(rect, CGRect(x: 1, y: 2, width: 13, height: 24))
    }
}

class TransformOperatorTests: XCTestCase {

    let transform = CGAffineTransform(scaleX: 2, y: 3)

    func testEquatable() {
        let otherTransform = CGAffineTransform(scaleX: 2, y: 3)
        XCTAssertTrue(transform == otherTransform)
    }

    func testNotEquatable() {
        let otherTransform = CGAffineTransform(scaleX: 3, y: 2)
        XCTAssertFalse(transform == otherTransform)
    }

    func testMultiplyPoint() {
        let point = CGPoint(x: 10, y: 20)
        XCTAssertEqual(point * transform, CGPoint(x: 20, y: 60))
    }

    func testMultiplyPointAssignment() {
        var point = CGPoint(x: 10, y: 20)
        point *= transform
        XCTAssertEqual(point, CGPoint(x: 20, y: 60))
    }

    func testMultiplySize() {
        let size = CGSize(width: 10, height: 20)
        XCTAssertEqual(size * transform, CGSize(width: 20, height: 60))
    }

    func testMultiplySizeAssignment() {
        var size = CGSize(width: 10, height: 20)
        size *= transform
        XCTAssertEqual(size, CGSize(width: 20, height: 60))
    }

    func testMultiplyRect() {
        let rect = CGRect(x: 10, y: 20, width: 30, height: 40)
        XCTAssertEqual(rect * transform, CGRect(x: 20, y: 60, width: 60, height: 120))
    }

    func testMultiplyRectAssignment() {
        var rect = CGRect(x: 10, y: 20, width: 30, height: 40)
        rect *= transform
        XCTAssertEqual(rect, CGRect(x: 20, y: 60, width: 60, height: 120))
    }

    func testMultiplyTransform() {
        let otherTransform = CGAffineTransform(translationX: 10, y: 20)
        XCTAssertEqual(
            otherTransform * transform,
            otherTransform.concatenating(transform))
    }

    func testMultiplyTransformAssignment() {
        var otherTransform = CGAffineTransform(translationX: 10, y: 20)
        otherTransform *= transform
        XCTAssertEqual(
            otherTransform,
            CGAffineTransform(translationX: 10, y: 20).concatenating(transform))
    }
}
