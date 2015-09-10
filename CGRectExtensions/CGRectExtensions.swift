// Copyright (c) 2014 Nikolaj Schumacher
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

// MARK: CGPoint

extension CGPoint {

    /// Creates a point with unnamed arguments.
    public init(_ x: CGFloat, _ y: CGFloat) {
        self.x = x
        self.y = y
    }

    /// Returns a copy with the x value changed.
    public func with(x x: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    /// Returns a copy with the y value changed.
    public func with(y y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
}

// MARK: CGSize

extension CGSize {

    /// Creates a size with unnamed arguments.
    public init(_ width: CGFloat, _ height: CGFloat) {
        self.width = width
        self.height = height
    }

    /// Returns a copy with the width value changed.
    public func with(width width: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }
    /// Returns a copy with the height value changed.
    public func with(height height: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }
}

// MARK: CGRect

extension CGRect {

    /// Creates a rect with unnamed arguments.
    public init(_ origin: CGPoint, _ size: CGSize) {
        self.origin = origin
        self.size = size
    }

    /// Creates a rect with unnamed arguments.
    public init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.origin = CGPoint(x: x, y: y)
        self.size = CGSize(width: width, height: height)
    }

    // MARK: access shortcuts

    /// Alias for origin.x.
    public var x: CGFloat {
        get {return origin.x}
        set {origin.x = newValue}
    }
    /// Alias for origin.y.
    public var y: CGFloat {
        get {return origin.y}
        set {origin.y = newValue}
    }

    /// Accesses origin.x + 0.5 * size.width.
    public var centerX: CGFloat {
        get {return x + width * 0.5}
        set {x = newValue - width * 0.5}
    }
    /// Accesses origin.y + 0.5 * size.height.
    public var centerY: CGFloat {
        get {return y + height * 0.5}
        set {y = newValue - height * 0.5}
    }

    // MARK: edges

    /// Alias for origin.x.
    public var left: CGFloat {
        get {return origin.x}
        set {origin.x = newValue}
    }
    /// Accesses origin.x + size.width.
    public var right: CGFloat {
        get {return x + width}
        set {x = newValue - width}
    }

    #if os(iOS)
    /// Alias for origin.y.
    public var top: CGFloat {
        get {return y}
        set {y = newValue}
    }
    /// Accesses origin.y + size.height.
    public var bottom: CGFloat {
        get {return y + height}
        set {y = newValue - height}
    }
    #else
    /// Accesses origin.y + size.height.
    public var top: CGFloat {
        get {return y + height}
        set {y = newValue - height}
    }
    /// Alias for origin.y.
    public var bottom: CGFloat {
        get {return y}
        set {y = newValue}
    }
    #endif

    // MARK: points

    /// Accesses the point at the top left corner.
    public var topLeft: CGPoint {
        get {return CGPoint(x: left, y: top)}
        set {left = newValue.x; top = newValue.y}
    }
    /// Accesses the point at the middle of the top edge.
    public var topCenter: CGPoint {
        get {return CGPoint(x: centerX, y: top)}
        set {centerX = newValue.x; top = newValue.y}
    }
    /// Accesses the point at the top right corner.
    public var topRight: CGPoint {
        get {return CGPoint(x: right, y: top)}
        set {right = newValue.x; top = newValue.y}
    }

    /// Accesses the point at the middle of the left edge.
    public var centerLeft: CGPoint {
        get {return CGPoint(x: left, y: centerY)}
        set {left = newValue.x; centerY = newValue.y}
    }
    /// Accesses the point at the center.
    public var center: CGPoint {
        get {return CGPoint(x: centerX, y: centerY)}
        set {centerX = newValue.x; centerY = newValue.y}
    }
    /// Accesses the point at the middle of the right edge.
    public var centerRight: CGPoint {
        get {return CGPoint(x: right, y: centerY)}
        set {right = newValue.x; centerY = newValue.y}
    }

    /// Accesses the point at the bottom left corner.
    public var bottomLeft: CGPoint {
        get {return CGPoint(x: left, y: bottom)}
        set {left = newValue.x; bottom = newValue.y}
    }
    /// Accesses the point at the middle of the bottom edge.
    public var bottomCenter: CGPoint {
        get {return CGPoint(x: centerX, y: bottom)}
        set {centerX = newValue.x; bottom = newValue.y}
    }
    /// Accesses the point at the bottom right corner.
    public var bottomRight: CGPoint {
        get {return CGPoint(x: right, y: bottom)}
        set {right = newValue.x; bottom = newValue.y}
    }

    // MARK: with

    /// Returns a copy with the origin value changed.
    public func with(origin origin: CGPoint) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    /// Returns a copy with the x and y values changed.
    public func with(x x: CGFloat, y: CGFloat) -> CGRect {
        return with(origin: CGPoint(x: x, y: y))
    }
    /// Returns a copy with the x value changed.
    public func with(x x: CGFloat) -> CGRect {
        return with(x: x, y: y)
    }
    /// Returns a copy with the y value changed.
    public func with(y y: CGFloat) -> CGRect {
        return with(x: x, y: y)
    }

    /// Returns a copy with the size value changed.
    public func with(size size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    /// Returns a copy with the width and height values changed.
    public func with(width width: CGFloat, height: CGFloat) -> CGRect {
        return with(size: CGSize(width: width, height: height))
    }
    /// Returns a copy with the width value changed.
    public func with(width width: CGFloat) -> CGRect {
        return with(width: width, height: height)
    }
    /// Returns a copy with the height value changed.
    public func with(height height: CGFloat) -> CGRect {
        return with(width: width, height: height)
    }

    /// Returns a copy with the x and width values changed.
    public func with(x x: CGFloat, width: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
    }
    /// Returns a copy with the y and height values changed.
    public func with(y y: CGFloat, height: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
    }

    // MARK: offset

    /// Returns a copy with the x and y values offset.
    public func offsetBy(dx: CGFloat, _ dy: CGFloat) -> CGRect {
        return with(x: x + dx, y: y + dy)
    }
    /// Returns a copy with the x value values offset.
    public func offsetBy(dx dx: CGFloat) -> CGRect {
        return with(x: x + dx)
    }
    /// Returns a copy with the y value values offset.
    public func offsetBy(dy dy: CGFloat) -> CGRect {
        return with(y: y + dy)
    }
    /// Returns a copy with the x and y values offset.
    public func offsetBy(by: CGSize) -> CGRect {
        return with(x: x + by.width, y: y + by.height)
    }

    /// Modifies the x and y values by offsetting.
    public mutating func offsetInPlace(dx: CGFloat, _ dy: CGFloat) {
        offsetInPlace(dx: dx, dy: dy)
    }
    /// Modifies the x value values by offsetting.
    public mutating func offsetInPlace(dx dx: CGFloat = 0) {
        x += dx
    }
    /// Modifies the y value values by offsetting.
    public mutating func offsetInPlace(dy dy: CGFloat = 0) {
        y += dy
    }
    /// Modifies the x and y values by offsetting.
    public mutating func offsetInPlace(by: CGSize) {
        offsetInPlace(dx: by.width, dy: by.height)
    }

    // MARK: inset

    /// Returns a copy inset on all edges by the same value.
    public func insetBy(by: CGFloat) -> CGRect {
        return insetBy(dx: by, dy: by)
    }

    /// Returns a copy inset on the left and right edges.
    public func insetBy(dx dx: CGFloat) -> CGRect {
        return with(x: x + dx, width: width - dx * 2)
    }
    /// Returns a copy inset on the top and bottom edges.
    public func insetBy(dy dy: CGFloat) -> CGRect {
        return with(y: y + dy, height: height - dy * 2)
    }

    /// Returns a copy inset on all edges by different values.
    public func insetBy(minX minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) -> CGRect {
        return CGRect(x: x + minX, y: y + minY, width: width - minX - maxX, height: height - minY - maxY)
    }

    /// Returns a copy inset on all edges by different values.
    public func insetBy(top top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> CGRect {
        #if os(iOS)
            return CGRect(x: x + left, y: y + top, width: width - right - left, height: height - top - bottom)
        #else
            return CGRect(x: x + left, y: y + bottom, width: width - right - left, height: height - top - bottom)
        #endif
    }

    /// Returns a copy inset on the top and left edges.
    public func insetBy(topLeft topLeft: CGSize) -> CGRect {
        return insetBy(top: topLeft.height, left: topLeft.width)
    }
    /// Returns a copy inset on the top and right edges.
    public func insetBy(topRight topRight: CGSize) -> CGRect {
        return insetBy(top: topRight.height, right: topRight.width)
    }
    /// Returns a copy inset on the bottom and left edges.
    public func insetBy(bottomLeft bottomLeft: CGSize) -> CGRect {
        return insetBy(bottom: bottomLeft.height, left: bottomLeft.width)
    }
    /// Returns a copy inset on the bottom and right edges.
    public func insetBy(bottomRight bottomRight: CGSize) -> CGRect {
        return insetBy(bottom: bottomRight.height, right: bottomRight.width)
    }

    /// Modifies all values by insetting all edges by the same value.
    public mutating func insetInPlace(by: CGFloat) {
        insetInPlace(dx: by, dy: by)
    }

    /// Modifies all values by insetting on the left and right edges.
    public mutating func insetInPlace(dx dx: CGFloat) {
        insetInPlace(dx: dx, dy: 0)
    }
    /// Modifies all values by insetting on the top and bottom edges.
    public mutating func insetInPlace(dy dy: CGFloat) {
        insetInPlace(dx: 0, dy: dy)
    }

    /// Modifies all values by insetting all edges by different value.
    public mutating func insetInPlace(minX minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) {
        self = insetBy(minX: minX, minY: minY, maxX: maxX, maxY: maxY)
    }

    /// Modifies all values by insetting all edges by different value.
    public mutating func insetInPlace(top top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self = insetBy(top: top, left: left, bottom: bottom, right: right)
    }

    /// Modifies all values by insetting the top and left edges.
    public mutating func insetInPlace(topLeft topLeft: CGSize) {
        self = insetBy(topLeft: topLeft)
    }
    /// Modifies all values by insetting the top and right edges.
    public mutating func insetInPlace(topRight topRight: CGSize) {
        self = insetBy(topRight: topRight)
    }
    /// Modifies all values by insetting the bottom and left edges.
    public mutating func insetInPlace(bottomLeft bottomLeft: CGSize) {
        self = insetBy(bottomLeft: bottomLeft)
    }
    /// Modifies all values by insetting the bottom and right edges.
    public mutating func insetInPlace(bottomRight bottomRight: CGSize) {
        self = insetBy(bottomRight: bottomRight)
    }

    // MARK: extending

    /// Returns a copy extended on all edges by different values.
    public func extendBy(dx dx: CGFloat, dy: CGFloat = 0) -> CGRect {
        return insetBy(dx: -dx, dy: -dy)
    }
    /// Returns a copy extended on the top and bottom edges.
    public func extendBy(dy dy: CGFloat) -> CGRect {
        return insetBy(dy: -dy)
    }

    /// Returns a copy extended on all edges by the same value.
    public func extendBy(by: CGFloat) -> CGRect {
        return insetBy(dx: -by, dy: -by)
    }

    /// Returns a copy extended on all edges by different values.
    public func extendBy(minX minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) -> CGRect {
        return insetBy(minX: -minX, minY: -minY, maxX: -maxX, maxY: -maxY)
    }
    /// Returns a copy extended on all edges by different values.
    public func extendBy(top top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> CGRect {
        return insetBy(top: -top, left: -left, bottom: -bottom, right: -right)
    }

    /// Modifies all values by extending the top and left edges.
    public func extendBy(topLeft topLeft: CGSize) -> CGRect {
        return extendBy(top: topLeft.height, left: topLeft.width)
    }
    /// Modifies all values by extending the top and right edges.
    public func extendBy(topRight topRight: CGSize) -> CGRect {
        return insetBy(top: -topRight.height, right: -topRight.width)
    }
    /// Modifies all values by extending the bottom and left edges.
    public func extendBy(bottomLeft bottomLeft: CGSize) -> CGRect {
        return insetBy(bottom: -bottomLeft.height, left: -bottomLeft.width)
    }
    /// Modifies all values by extending the bottom and right edges.
    public func extendBy(bottomRight bottomRight: CGSize) -> CGRect {
        return insetBy(bottom: -bottomRight.height, right: -bottomRight.width)
    }

    /// Modifies all values by extending all edges by different values.
    public mutating func extendInPlace(dx dx: CGFloat, dy: CGFloat = 0) {
        self = insetBy(dx: -dx, dy: -dy)
    }
    /// Modifies all values by extending the top and bottom edges.
    public mutating func extendInPlace(dy dy: CGFloat) {
        self = insetBy(dy: -dy)
    }

    /// Modifies all values by extending all edges by the same value.
    public mutating func extendInPlace(by: CGFloat) {
        self = insetBy(dx: -by, dy: -by)
    }

    /// Modifies all values by extending all edges by different values.
    public mutating func extendInPlace(minX minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) {
        self = insetBy(minX: -minX, minY: -minY, maxX: -maxX, maxY: -maxY)
    }
    /// Modifies all values by extending all edges by different values.
    public mutating func extendInPlace(top top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self = insetBy(top: -top, left: -left, bottom: -bottom, right: -right)
    }

    /// Modifies all values by extending the top and left edges.
    public mutating func extendInPlace(topLeft topLeft: CGSize) {
        self = extendBy(top: topLeft.height, left: topLeft.width)
    }
    /// Modifies all values by extending the top and right edges.
    public mutating func extendInPlace(topRight topRight: CGSize) {
        self = insetBy(top: -topRight.height, right: -topRight.width)
    }
    /// Modifies all values by extending the bottom and left edges.
    public mutating func extendInPlace(bottomLeft bottomLeft: CGSize) {
        self = insetBy(bottom: -bottomLeft.height, left: -bottomLeft.width)
    }
    /// Modifies all values by extending the bottom and right edges.
    public mutating func extendInPlace(bottomRight bottomRight: CGSize) {
        self = insetBy(bottom: -bottomRight.height, right: -bottomRight.width)
    }

    // MARK: sizes

    /// Returns a rect of the specified size centered in this rect.
    public func center(size: CGSize) -> CGRect {
        let dx = width - size.width
        let dy = height - size.height
        return CGRect(x: x + dx * 0.5, y: y + dy * 0.5, width: size.width, height: size.height)
    }

    /// Returns a rect of the specified size centered in this rect touching the specified edge.
    public func center(size: CGSize, alignTo edge: CGRectEdge) -> CGRect {
        return CGRect(origin: alignedOrigin(size, edge: edge), size: size)
    }

    private func alignedOrigin(size: CGSize, edge: CGRectEdge) -> CGPoint {
        let dx = width - size.width
        let dy = height - size.height
        switch edge {
        case .MinXEdge:
            return CGPoint(x: x, y: y + dy * 0.5)
        case .MinYEdge:
            return CGPoint(x: x + dx * 0.5, y: y)
        case .MaxXEdge:
            return CGPoint(x: x + dx, y: y + dy * 0.5)
        case .MaxYEdge:
            return CGPoint(x: x + dx * 0.5, y: y + dy)
        }
    }

    /// Returns a rect of the specified size centered in this rect touching the specified corner.
    public func align(size: CGSize, corner e1: CGRectEdge, _ e2: CGRectEdge) -> CGRect {
        return CGRect(origin: alignedOrigin(size, corner: e1, e2), size: size)
    }

    private func alignedOrigin(size: CGSize, corner e1: CGRectEdge, _ e2: CGRectEdge) -> CGPoint {
        let dx = width - size.width
        let dy = height - size.height
        switch (e1, e2) {
        case (.MinXEdge, .MinYEdge), (.MinYEdge, .MinXEdge):
            return CGPoint(x: x, y: y)
        case (.MaxXEdge, .MinYEdge), (.MinYEdge, .MaxXEdge):
            return CGPoint(x: x + dx, y: y)
        case (.MinXEdge, .MaxYEdge), (.MaxYEdge, .MinXEdge):
            return CGPoint(x: x, y: y + dy)
        case (.MaxXEdge, .MaxYEdge), (.MaxYEdge, .MaxXEdge):
            return CGPoint(x: x + dx, y: y + dy)
        default:
            preconditionFailure("Cannot align to this combination of edges")
        }
    }

    /// Modifies all values by setting the size while centering the rect.
    public mutating func centerInPlace(size: CGSize) {
        self = center(size)
    }

    /// Modifies all values by setting the size while centering the rect touching the specified edge.
    public mutating func centerInPlace(size: CGSize, alignTo edge: CGRectEdge) {
        self = center(size, alignTo: edge)
    }

    /// Modifies all values by setting the size while centering the rect touching the specified corner.
    public mutating func alignInPlace(size: CGSize, corner e1: CGRectEdge, _ e2: CGRectEdge) {
        self = align(size, corner: e1, e2)
    }
}

// MARK: transform

extension CGAffineTransform: Equatable {
}

public func ==(t1: CGAffineTransform, t2: CGAffineTransform) -> Bool {
    return CGAffineTransformEqualToTransform(t1, t2)
}

extension CGAffineTransform: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "(\(a),\(b),\(c),\(d),\(tx),\(ty))"
    }
}

// MARK: operators

/// Returns a point by adding the coordinates of another point.
public func +(p1: CGPoint, p2: CGPoint) -> CGPoint {
    return CGPoint(x: p1.x + p2.x, y: p1.y + p2.y)
}
/// Modifies the x and y values by adding the coordinates of another point.
public func +=(inout p1: CGPoint, p2: CGPoint) {
    p1.x += p2.x
    p1.y += p2.y
}
/// Returns a point by subtracting the coordinates of another point.
public func -(p1: CGPoint, p2: CGPoint) -> CGPoint {
    return CGPoint(x: p1.x - p2.x, y: p1.y - p2.y)
}
/// Modifies the x and y values by subtracting the coordinates of another points.
public func -=(inout p1: CGPoint, p2: CGPoint) {
    p1.x -= p2.x
    p1.y -= p2.y
}

/// Returns a point by adding a size to the coordinates.
public func +(point: CGPoint, size: CGSize) -> CGPoint {
    return CGPoint(x: point.x + size.width, y: point.y + size.height)
}
/// Modifies the x and y values by adding a size to the coordinates.
public func +=(inout point: CGPoint, size: CGSize) {
    point.x += size.width
    point.y += size.height
}
/// Returns a point by subtracting a size from the coordinates.
public func -(point: CGPoint, size: CGSize) -> CGPoint {
    return CGPoint(x: point.x - size.width, y: point.y - size.height)
}
/// Modifies the x and y values by subtracting a size from the coordinates.
public func -=(inout point: CGPoint, size: CGSize) {
    point.x -= size.width
    point.y -= size.height
}

/// Returns a point by adding a tuple to the coordinates.
public func +(point: CGPoint, tuple: (CGFloat, CGFloat)) -> CGPoint {
    return CGPoint(x: point.x + tuple.0, y: point.y + tuple.1)
}
/// Modifies the x and y values by adding a tuple to the coordinates.
public func +=(inout point: CGPoint, tuple: (CGFloat, CGFloat)) {
    point.x += tuple.0
    point.y += tuple.1
}
/// Returns a point by subtracting a tuple from the coordinates.
public func -(point: CGPoint, tuple: (CGFloat, CGFloat)) -> CGPoint {
    return CGPoint(x: point.x - tuple.0, y: point.y - tuple.1)
}
/// Modifies the x and y values by subtracting a tuple from the coordinates.
public func -=(inout point: CGPoint, tuple: (CGFloat, CGFloat)) {
    point.x -= tuple.0
    point.y -= tuple.1
}
/// Returns a point by multiplying the coordinates with a value.
public func *(point: CGPoint, factor: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * factor, y: point.y * factor)
}
/// Modifies the x and y values by multiplying the coordinates with a value.
public func *=(inout point: CGPoint, factor: CGFloat) {
    point.x *= factor
    point.y *= factor
}
/// Returns a point by multiplying the coordinates with a tuple.
public func *(point: CGPoint, tuple: (CGFloat, CGFloat)) -> CGPoint {
    return CGPoint(x: point.x * tuple.0, y: point.y * tuple.1)
}
/// Modifies the x and y values by multiplying the coordinates with a tuple.
public func *=(inout point: CGPoint, tuple: (CGFloat, CGFloat)) {
    point.x *= tuple.0
    point.y *= tuple.1
}
/// Returns a point by dividing the coordinates by a tuple.
public func /(point: CGPoint, tuple: (CGFloat, CGFloat)) -> CGPoint {
    return CGPoint(x: point.x / tuple.0, y: point.y / tuple.1)
}
/// Modifies the x and y values by dividing the coordinates by a tuple.
public func /=(inout point: CGPoint, tuple: (CGFloat, CGFloat)) {
    point.x /= tuple.0
    point.y /= tuple.1
}
/// Returns a point by dividing the coordinates by a factor.
public func /(point: CGPoint, factor: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / factor, y: point.y / factor)
}
/// Modifies the x and y values by dividing the coordinates by a factor.
public func /=(inout point: CGPoint, factor: CGFloat) {
    point.x /= factor
    point.y /= factor
}

/// Returns a point by adding another size.
public func +(s1: CGSize, s2: CGSize) -> CGSize {
    return CGSize(width: s1.width + s2.width, height: s1.height + s2.height)
}
/// Modifies the width and height values by adding another size.
public func +=(inout s1: CGSize, s2: CGSize) {
    s1.width += s2.width
    s1.height += s2.height
}
/// Returns a point by subtracting another size.
public func -(s1: CGSize, s2: CGSize) -> CGSize {
    return CGSize(width: s1.width - s2.width, height: s1.height - s2.height)
}
/// Modifies the width and height values by subtracting another size.
public func -=(inout s1: CGSize, s2: CGSize) {
    s1.width -= s2.width
    s1.height -= s2.height
}

/// Returns a point by adding a tuple.
public func +(size: CGSize, tuple: (CGFloat, CGFloat)) -> CGSize {
    return CGSize(width: size.width + tuple.0, height: size.height + tuple.1)
}
/// Modifies the width and height values by adding a tuple.
public func +=(inout size: CGSize, tuple: (CGFloat, CGFloat)) {
    size.width += tuple.0
    size.height += tuple.1
}
/// Returns a point by subtracting a tuple.
public func -(size: CGSize, tuple: (CGFloat, CGFloat)) -> CGSize {
    return CGSize(width: size.width - tuple.0, height: size.height - tuple.1)
}
/// Modifies the width and height values by subtracting a tuple.
public func -=(inout size: CGSize, tuple: (CGFloat, CGFloat)) {
    size.width -= tuple.0
    size.height -= tuple.1
}
/// Returns a point by multiplying the size with a factor.
public func *(size: CGSize, factor: CGFloat) -> CGSize {
    return CGSize(width: size.width * factor, height: size.height * factor)
}
/// Modifies the width and height values by multiplying them with a factor.
public func *=(inout size: CGSize, factor: CGFloat) {
    size.width *= factor
    size.height *= factor
}
/// Returns a point by multiplying the size with a tuple.
public func *(size: CGSize, tuple: (CGFloat, CGFloat)) -> CGSize {
    return CGSize(width: size.width * tuple.0, height: size.height * tuple.1)
}
/// Modifies the width and height values by multiplying them with a tuple.
public func *=(inout size: CGSize, tuple: (CGFloat, CGFloat)) {
    size.width *= tuple.0
    size.height *= tuple.1
}
/// Returns a point by dividing the size by a factor.
public func /(size: CGSize, factor: CGFloat) -> CGSize {
    return CGSize(width: size.width / factor, height: size.height / factor)
}
/// Modifies the width and height values by dividing them by a factor.
public func /=(inout size: CGSize, factor: CGFloat) {
    size.width /= factor
    size.height /= factor
}
/// Returns a point by dividing the size by a tuple.
public func /(size: CGSize, tuple: (CGFloat, CGFloat)) -> CGSize {
    return CGSize(width: size.width / tuple.0, height: size.height / tuple.1)
}
/// Modifies the width and height values by dividing them by a tuple.
public func /=(inout size: CGSize, tuple: (CGFloat, CGFloat)) {
    size.width /= tuple.0
    size.height /= tuple.1
}

/// Returns a rect by adding the coordinates of a point to the origin.
public func +(rect: CGRect, point: CGPoint) -> CGRect {
    return CGRect(origin: rect.origin + point, size: rect.size)
}
/// Modifies the x and y values by adding the coordinates of a point.
public func +=(inout rect: CGRect, point: CGPoint) {
    rect.origin += point
}
/// Returns a rect by subtracting the coordinates of a point from the origin.
public func -(rect: CGRect, point: CGPoint) -> CGRect {
    return CGRect(origin: rect.origin - point, size: rect.size)
}
/// Modifies the x and y values by subtracting the coordinates from a point.
public func -=(inout rect: CGRect, point: CGPoint) {
    rect.origin -= point
}

/// Returns a rect by adding a size to the size.
public func +(rect: CGRect, size: CGSize) -> CGRect {
    return CGRect(origin: rect.origin, size: rect.size + size)
}
/// Modifies the width and height values by adding a size.
public func +=(inout rect: CGRect, size: CGSize) {
    rect.size += size
}
/// Returns a rect by subtracting a size from the size.
public func -(rect: CGRect, size: CGSize) -> CGRect {
    return CGRect(origin: rect.origin, size: rect.size - size)
}
/// Modifies the width and height values by subtracting a size.
public func -=(inout rect: CGRect, size: CGSize) {
    rect.size -= size
}

/// Returns a point by applying a transform.
public func *(point: CGPoint, transform: CGAffineTransform) -> CGPoint {
    return CGPointApplyAffineTransform(point, transform)
}
/// Modifies all values by applying a transform.
public func *=(inout point: CGPoint, transform: CGAffineTransform) {
    point = CGPointApplyAffineTransform(point, transform)
}
/// Returns a size by applying a transform.
public func *(size: CGSize, transform: CGAffineTransform) -> CGSize {
    return CGSizeApplyAffineTransform(size, transform)
}
/// Modifies all values by applying a transform.
public func *=(inout size: CGSize, transform: CGAffineTransform) {
    size = CGSizeApplyAffineTransform(size, transform)
}
/// Returns a rect by applying a transform.
public func *(rect: CGRect, transform: CGAffineTransform) -> CGRect {
    return CGRectApplyAffineTransform(rect, transform)
}
/// Modifies all values by applying a transform.
public func *=(inout rect: CGRect, transform: CGAffineTransform) {
    rect = CGRectApplyAffineTransform(rect, transform)
}

/// Returns a transform by concatenating two transforms.
public func *(t1: CGAffineTransform, t2: CGAffineTransform) -> CGAffineTransform {
    return CGAffineTransformConcat(t1, t2)
}
/// Modifies all values by concatenating another transform.
public func *=(inout t1: CGAffineTransform, t2: CGAffineTransform) {
    t1 = CGAffineTransformConcat(t1, t2)
}
