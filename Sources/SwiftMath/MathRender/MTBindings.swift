//
//  MTBindings.swift
//  SwiftMath
//
//  Created by Andrew Zheng (github.com/aheze) on 6/30/24.
//  Copyright © 2024 Andrew Zheng. All rights reserved.
//

import SwiftMath
import SwiftUI

#if os(macOS)

public struct MathView: NSViewRepresentable {
    public var equation: String
    public var fontSize: CGFloat

    public init(_ equation: String, fontSize: CGFloat = 24) {
        self.equation = equation
        self.fontSize = fontSize
    }

    public func makeNSView(context: Context) -> MTMathUILabel {
        let view = MTMathUILabel()
        return view
    }

    public func updateNSView(_ view: MTMathUILabel, context: Context) {
        view.latex = equation
        view.fontSize = fontSize
        view.font = MTFontManager().termesFont(withSize: fontSize)
    }
}
#else
public struct MathView: UIViewRepresentable {
    public var equation: String
    public var fontSize: CGFloat

    public init(_ equation: String, fontSize: CGFloat = 24) {
        self.equation = equation
        self.fontSize = fontSize
    }

    public func makeUIView(context: Context) -> MTMathUILabel {
        let view = MTMathUILabel()
        return view
    }

    public func updateUIView(_ uiView: MTMathUILabel, context: Context) {
        uiView.latex = equation
        uiView.fontSize = fontSize
        uiView.font = MTFontManager().termesFont(withSize: fontSize)
    }
}

#endif
