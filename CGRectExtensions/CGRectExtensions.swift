import Foundation

// MARK: CGPoint

extension CGPoint {

    public init(_ x: CGFloat, _ y: CGFloat) {
        self.x = x
        self.y = y
    }

    public func with(# x: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    public func with(# y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
}

// MARK: CGSize

extension CGSize {

    public init(_ width: CGFloat, _ height: CGFloat) {
        self.width = width
        self.height = height
    }

    public func with(# width: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }
    public func with(# height: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }
}

// MARK: CGRect

extension CGRect {

    public init(_ origin: CGPoint, _ size: CGSize) {
        self.origin = origin
        self.size = size
    }

    public init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.origin = CGPoint(x: x, y: y)
        self.size = CGSize(width: width, height: height)
    }

    // MARK: access shortcuts

    public var x: CGFloat {
        get {return origin.x}
        set {origin.x = newValue}
    }
    public var y: CGFloat {
        get {return origin.y}
        set {origin.y = newValue}
    }

    public var centerX: CGFloat {
        get {return x + width * 0.5}
        set {x = newValue - width * 0.5}
    }
    public var centerY: CGFloat {
        get {return y + height * 0.5}
        set {y = newValue - height * 0.5}
    }

    // MARK: edges

    public var left: CGFloat {
        get {return origin.x}
        set {origin.x = newValue}
    }
    public var right: CGFloat {
        get {return x + width}
        set {x = newValue - width}
    }

    #if os(iOS)
    public var top: CGFloat {
        get {return y}
        set {y = newValue}
    }
    public var bottom: CGFloat {
        get {return y + height}
        set {y = newValue - height}
    }
    #else
    public var top: CGFloat {
        get {return y + height}
        set {y = newValue - height}
    }
    public var bottom: CGFloat {
        get {return y}
        set {y = newValue}
    }
    #endif

    // MARK: points

    public var topLeft: CGPoint {
        get {return CGPoint(x: left, y: top)}
        set {left = newValue.x; top = newValue.y}
    }
    public var topCenter: CGPoint {
        get {return CGPoint(x: centerX, y: top)}
        set {centerX = newValue.x; top = newValue.y}
    }
    public var topRight: CGPoint {
        get {return CGPoint(x: right, y: top)}
        set {right = newValue.x; top = newValue.y}
    }

    public var centerLeft: CGPoint {
        get {return CGPoint(x: left, y: centerY)}
        set {left = newValue.x; centerY = newValue.y}
    }
    public var center: CGPoint {
        get {return CGPoint(x: centerX, y: centerY)}
        set {centerX = newValue.x; centerY = newValue.y}
    }
    public var centerRight: CGPoint {
        get {return CGPoint(x: right, y: centerY)}
        set {right = newValue.x; centerY = newValue.y}
    }

    public var bottomLeft: CGPoint {
        get {return CGPoint(x: left, y: bottom)}
        set {left = newValue.x; bottom = newValue.y}
    }
    public var bottomCenter: CGPoint {
        get {return CGPoint(x: centerX, y: bottom)}
        set {centerX = newValue.x; bottom = newValue.y}
    }
    public var bottomRight: CGPoint {
        get {return CGPoint(x: right, y: bottom)}
        set {right = newValue.x; bottom = newValue.y}
    }

    // MARK: with

    public func with(# origin: CGPoint) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    public func with(# x: CGFloat, y: CGFloat) -> CGRect {
        return with(origin: CGPoint(x: x, y: y))
    }
    public func with(# x: CGFloat) -> CGRect {
        return with(x: x, y: y)
    }
    public func with(# y: CGFloat) -> CGRect {
        return with(x: x, y: y)
    }

    public func with(# size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    public func with(# width: CGFloat, height: CGFloat) -> CGRect {
        return with(size: CGSize(width: width, height: height))
    }
    public func with(# width: CGFloat) -> CGRect {
        return with(width: width, height: height)
    }
    public func with(# height: CGFloat) -> CGRect {
        return with(width: width, height: height)
    }

    public func with(# x: CGFloat, width: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
    }
    public func with(# y: CGFloat, height: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
    }

    // MARK: offset

    public func rectByOffsetting(dx: CGFloat, _ dy: CGFloat) -> CGRect {
        return with(x: x + dx, y: y + dy)
    }
    public func rectByOffsetting(# dx: CGFloat) -> CGRect {
        return with(x: x + dx)
    }
    public func rectByOffsetting(# dy: CGFloat) -> CGRect {
        return with(y: y + dy)
    }
    public func rectByOffsetting(by: CGSize) -> CGRect {
        return with(x: x + by.width, y: y + by.height)
    }

    public mutating func offset(dx: CGFloat, _ dy: CGFloat) {
        offset(dx: dx, dy: dy)
    }
    public mutating func offset(dx: CGFloat = 0) {
        x += dx
    }
    public mutating func offset(dy: CGFloat = 0) {
        y += dy
    }
    public mutating func offset(by: CGSize) {
        offset(dx: by.width, dy: by.height)
    }

    // MARK: inset

    public func rectByInsetting(by: CGFloat) -> CGRect {
        return rectByInsetting(dx: by, dy: by)
    }

    public func rectByInsetting(# dx: CGFloat) -> CGRect {
        return with(x: x + dx, width: width - dx * 2)
    }
    public func rectByInsetting(# dy: CGFloat) -> CGRect {
        return with(y: y + dy, height: height - dy * 2)
    }

    public func rectByInsetting(minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) -> CGRect {
        return CGRect(x: x + minX, y: y + minY, width: width - minX - maxX, height: height - minY - maxY)
    }

    public func rectByInsetting(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> CGRect {
        #if os(iOS)
            return CGRect(x: x + left, y: y + top, width: width - right - left, height: height - top - bottom)
        #else
            return CGRect(x: x + left, y: y + bottom, width: width - right - left, height: height - top - bottom)
        #endif
    }

    public func rectByInsetting(# topLeft: CGSize) -> CGRect {
        return rectByInsetting(top: topLeft.height, left: topLeft.width)
    }
    public func rectByInsetting(# topRight: CGSize) -> CGRect {
        return rectByInsetting(top: topRight.height, right: topRight.width)
    }
    public func rectByInsetting(# bottomLeft: CGSize) -> CGRect {
        return rectByInsetting(bottom: bottomLeft.height, left: bottomLeft.width)
    }
    public func rectByInsetting(# bottomRight: CGSize) -> CGRect {
        return rectByInsetting(bottom: bottomRight.height, right: bottomRight.width)
    }

    public mutating func inset(by: CGFloat) {
        inset(dx: by, dy: by)
    }

    public mutating func inset(# dx: CGFloat) {
        inset(dx: dx, dy: 0)
    }
    public mutating func inset(# dy: CGFloat) {
        inset(dx: 0, dy: dy)
    }

    public mutating func inset(minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) {
        self = rectByInsetting(minX: minX, minY: minY, maxX: maxX, maxY: maxY)
    }

    public mutating func inset(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self = rectByInsetting(top: top, left: left, bottom: bottom, right: right)
    }

    public mutating func inset(# topLeft: CGSize) {
        self = rectByInsetting(topLeft: topLeft)
    }
    public mutating func inset(# topRight: CGSize) {
        self = rectByInsetting(topRight: topRight)
    }
    public mutating func inset(# bottomLeft: CGSize) {
        self = rectByInsetting(bottomLeft: bottomLeft)
    }
    public mutating func inset(# bottomRight: CGSize) {
        self = rectByInsetting(bottomRight: bottomRight)
    }

    // MARK: extending

    public func rectByExtending(#dx: CGFloat, dy: CGFloat = 0) -> CGRect {
        return rectByInsetting(dx: -dx, dy: -dy)
    }
    public func rectByExtending(# dy: CGFloat) -> CGRect {
        return rectByInsetting(dy: -dy)
    }

    public func rectByExtending(by: CGFloat) -> CGRect {
        return rectByInsetting(dx: -by, dy: -by)
    }

    public func rectByExtending(minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) -> CGRect {
        return rectByInsetting(minX: -minX, minY: -minY, maxX: -maxX, maxY: -maxY)
    }
    public func rectByExtending(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> CGRect {
        return rectByInsetting(top: -top, left: -left, bottom: -bottom, right: -right)
    }

    public func rectByExtending(# topLeft: CGSize) -> CGRect {
        return rectByExtending(top: topLeft.height, left: topLeft.width)
    }
    public func rectByExtending(# topRight: CGSize) -> CGRect {
        return rectByInsetting(top: -topRight.height, right: -topRight.width)
    }
    public func rectByExtending(# bottomLeft: CGSize) -> CGRect {
        return rectByInsetting(bottom: -bottomLeft.height, left: -bottomLeft.width)
    }
    public func rectByExtending(# bottomRight: CGSize) -> CGRect {
        return rectByInsetting(bottom: -bottomRight.height, right: -bottomRight.width)
    }

    public mutating func extend(#dx: CGFloat, dy: CGFloat = 0) {
        self = rectByInsetting(dx: -dx, dy: -dy)
    }
    public mutating func extend(# dy: CGFloat) {
        self = rectByInsetting(dy: -dy)
    }

    public mutating func extend(by: CGFloat) {
        self = rectByInsetting(dx: -by, dy: -by)
    }

    public mutating func extend(minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) {
        self = rectByInsetting(minX: -minX, minY: -minY, maxX: -maxX, maxY: -maxY)
    }
    public mutating func extend(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self = rectByInsetting(top: -top, left: -left, bottom: -bottom, right: -right)
    }

    public mutating func extend(# topLeft: CGSize) {
        self = rectByExtending(top: topLeft.height, left: topLeft.width)
    }
    public mutating func extend(# topRight: CGSize) {
        self = rectByInsetting(top: -topRight.height, right: -topRight.width)
    }
    public mutating func extend(# bottomLeft: CGSize) {
        self = rectByInsetting(bottom: -bottomLeft.height, left: -bottomLeft.width)
    }
    public mutating func extend(# bottomRight: CGSize) {
        self = rectByInsetting(bottom: -bottomRight.height, right: -bottomRight.width)
    }

    // MARK: sizes

    public func rectByCentering(size: CGSize) -> CGRect {
        let dx = width - size.width
        let dy = height - size.height
        return CGRect(x: x + dx * 0.5, y: y + dy * 0.5, width: size.width, height: size.height)
    }

    public func rectByCentering(size: CGSize, alignTo edge: CGRectEdge) -> CGRect {
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

    public func rectByAligning(size: CGSize, corner e1: CGRectEdge, _ e2: CGRectEdge) -> CGRect {
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

    public mutating func setSizeCentered(size: CGSize) {
        self = rectByCentering(size)
    }

    public mutating func setSizeCentered(size: CGSize, alignTo edge: CGRectEdge) {
        self = rectByCentering(size, alignTo: edge)
    }

    public mutating func setSizeAligned(size: CGSize, corner e1: CGRectEdge, _ e2: CGRectEdge) {
        self = rectByAligning(size, corner: e1, e2)
    }
}

// MARK: operators

public func +(p1: CGPoint, p2: CGPoint) -> CGPoint {
    return CGPoint(x: p1.x + p2.x, y: p1.y + p2.y)
}
public func +=(inout p1: CGPoint, p2: CGPoint) {
    p1.x += p2.x
    p1.y += p2.y
}
public func -(p1: CGPoint, p2: CGPoint) -> CGPoint {
    return CGPoint(x: p1.x - p2.x, y: p1.y - p2.y)
}
public func -=(inout p1: CGPoint, p2: CGPoint) {
    p1.x -= p2.x
    p1.y -= p2.y
}

public func +(point: CGPoint, size: CGSize) -> CGPoint {
    return CGPoint(x: point.x + size.width, y: point.y + size.height)
}
public func +=(inout point: CGPoint, size: CGSize) {
    point.x += size.width
    point.y += size.height
}
public func -(point: CGPoint, size: CGSize) -> CGPoint {
    return CGPoint(x: point.x - size.width, y: point.y - size.height)
}
public func -=(inout point: CGPoint, size: CGSize) {
    point.x -= size.width
    point.y -= size.height
}

public func +(point: CGPoint, tuple: (CGFloat, CGFloat)) -> CGPoint {
    return CGPoint(x: point.x + tuple.0, y: point.y + tuple.1)
}
public func +=(inout point: CGPoint, tuple: (CGFloat, CGFloat)) {
    point.x += tuple.0
    point.y += tuple.1
}
public func -(point: CGPoint, tuple: (CGFloat, CGFloat)) -> CGPoint {
    return CGPoint(x: point.x - tuple.0, y: point.y - tuple.1)
}
public func -=(inout point: CGPoint, tuple: (CGFloat, CGFloat)) {
    point.x -= tuple.0
    point.y -= tuple.1
}
public func *(point: CGPoint, factor: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * factor, y: point.y * factor)
}
public func *=(inout point: CGPoint, factor: CGFloat) {
    point.x *= factor
    point.y *= factor
}
public func *(point: CGPoint, tuple: (CGFloat, CGFloat)) -> CGPoint {
    return CGPoint(x: point.x * tuple.0, y: point.y * tuple.1)
}
public func *=(inout point: CGPoint, tuple: (CGFloat, CGFloat)) {
    point.x *= tuple.0
    point.y *= tuple.1
}
public func /(point: CGPoint, tuple: (CGFloat, CGFloat)) -> CGPoint {
    return CGPoint(x: point.x / tuple.0, y: point.y / tuple.1)
}
public func /=(inout point: CGPoint, tuple: (CGFloat, CGFloat)) {
    point.x /= tuple.0
    point.y /= tuple.1
}
public func /(point: CGPoint, factor: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / factor, y: point.y / factor)
}
public func /=(inout point: CGPoint, factor: CGFloat) {
    point.x /= factor
    point.y /= factor
}

public func +(s1: CGSize, s2: CGSize) -> CGSize {
    return CGSize(width: s1.width + s2.width, height: s1.height + s2.height)
}
public func +=(inout s1: CGSize, s2: CGSize) {
    s1.width += s2.width
    s1.height += s2.height
}
public func -(s1: CGSize, s2: CGSize) -> CGSize {
    return CGSize(width: s1.width - s2.width, height: s1.height - s2.height)
}
public func -=(inout s1: CGSize, s2: CGSize) {
    s1.width -= s2.width
    s1.height -= s2.height
}

public func +(size: CGSize, tuple: (CGFloat, CGFloat)) -> CGSize {
    return CGSize(width: size.width + tuple.0, height: size.height + tuple.1)
}
public func +=(inout size: CGSize, tuple: (CGFloat, CGFloat)) {
    size.width += tuple.0
    size.height += tuple.1
}
public func -(size: CGSize, tuple: (CGFloat, CGFloat)) -> CGSize {
    return CGSize(width: size.width - tuple.0, height: size.height - tuple.1)
}
public func -=(inout size: CGSize, tuple: (CGFloat, CGFloat)) {
    size.width -= tuple.0
    size.height -= tuple.1
}
public func *(size: CGSize, factor: CGFloat) -> CGSize {
    return CGSize(width: size.width * factor, height: size.height * factor)
}
public func *=(inout size: CGSize, factor: CGFloat) {
    size.width *= factor
    size.height *= factor
}
public func *(size: CGSize, tuple: (CGFloat, CGFloat)) -> CGSize {
    return CGSize(width: size.width * tuple.0, height: size.height * tuple.1)
}
public func *=(inout size: CGSize, tuple: (CGFloat, CGFloat)) {
    size.width *= tuple.0
    size.height *= tuple.1
}
public func /(size: CGSize, factor: CGFloat) -> CGSize {
    return CGSize(width: size.width / factor, height: size.height / factor)
}
public func /=(inout size: CGSize, factor: CGFloat) {
    size.width /= factor
    size.height /= factor
}
public func /(size: CGSize, tuple: (CGFloat, CGFloat)) -> CGSize {
    return CGSize(width: size.width / tuple.0, height: size.height / tuple.1)
}
public func /=(inout size: CGSize, tuple: (CGFloat, CGFloat)) {
    size.width /= tuple.0
    size.height /= tuple.1
}

public func +(rect: CGRect, point: CGPoint) -> CGRect {
    return CGRect(origin: rect.origin + point, size: rect.size)
}
public func +=(inout rect: CGRect, point: CGPoint) {
    rect.origin += point
}
public func -(rect: CGRect, point: CGPoint) -> CGRect {
    return CGRect(origin: rect.origin - point, size: rect.size)
}
public func -=(inout rect: CGRect, point: CGPoint) {
    rect.origin -= point
}

public func +(rect: CGRect, size: CGSize) -> CGRect {
    return CGRect(origin: rect.origin, size: rect.size + size)
}
public func +=(inout rect: CGRect, size: CGSize) {
    rect.size += size
}
public func -(rect: CGRect, size: CGSize) -> CGRect {
    return CGRect(origin: rect.origin, size: rect.size - size)
}
public func -=(inout rect: CGRect, size: CGSize) {
    rect.size -= size
}

public func *(point: CGPoint, transform: CGAffineTransform) -> CGPoint {
    return CGPointApplyAffineTransform(point, transform)
}
public func *=(inout point: CGPoint, transform: CGAffineTransform) {
    point = CGPointApplyAffineTransform(point, transform)
}
public func *(size: CGSize, transform: CGAffineTransform) -> CGSize {
    return CGSizeApplyAffineTransform(size, transform)
}
public func *=(inout size: CGSize, transform: CGAffineTransform) {
    size = CGSizeApplyAffineTransform(size, transform)
}
public func *(rect: CGRect, transform: CGAffineTransform) -> CGRect {
    return CGRectApplyAffineTransform(rect, transform)
}
public func *=(inout rect: CGRect, transform: CGAffineTransform) {
    rect = CGRectApplyAffineTransform(rect, transform)
}

