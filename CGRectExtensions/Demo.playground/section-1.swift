// This playground requires Xcode 6.1.
// Make sure to compile the CGRectExtensionsOSX target first.

import Foundation
import CGRectExtensions

let rect = CGRect(1, 2, 100, 200) // shorter constructor

let minY = rect.minY // shortcut properties

let topCenter = rect.topCenter // OS-dependent coordinate system

let oppositeOrigin = rect.origin + rect.size // adding

let corneredRect = rect.with(x: 0, y: 0) // modified copy

let nextPageRect = rect.rectByOffsetting(dx: 100) // offsetting

let paddedRect = rect.rectByInsetting(top: 66, left: 10, right: 10) // insetting

let quarterSize = rect.size * 0.5 // scaling sizes
let corner = rect.rectByAligning(quarterSize, corner: .MinXEdge, .MinYEdge) // aligning sizes

let halfWidthSize = rect.size * (0.5, 1) // scaling sizes
let centeredRect = rect.rectByCentering(halfWidthSize) // centering sizes

// mutating functions

import Cocoa

let view = NSView()
view.frame.size = CGSize(width: 100, height: 200)

view.frame.bottomLeft = CGPoint(x: 1, y: 2)

view.frame.offset(25, 25)

view.frame.inset(top: 66, left: 10, right: 10)

view.frame.setSizeCentered(CGSize(50, 50))

view.frame.setSizeCentered(CGSize(50, 50), alignTo: .MinXEdge)

view.frame.setSizeAligned(CGSize(50, 50), corner: .MinXEdge, .MinYEdge)
