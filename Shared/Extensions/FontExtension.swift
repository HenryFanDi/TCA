//
//  FontExtension.swift
//  TCA
//
//  Created by Henry Fan on 2022/6/14.
//

import SwiftUI

extension Font {
    struct LatoFonts {
        func black(size: CGFloat) -> Font {
            return Font.custom("Lato-Black", size: size)
        }
        func blackItalic(size: CGFloat) -> Font {
            return Font.custom("Lato-BlackItalic", size: size)
        }
        func bold(size: CGFloat) -> Font {
            return Font.custom("Lato-Bold", size: size)
        }
        func boldItalic(size: CGFloat) -> Font {
            return Font.custom("Lato-BoldItalic", size: size)
        }
        func italic(size: CGFloat) -> Font {
            return Font.custom("Lato-Italic", size: size)
        }
        func light(size: CGFloat) -> Font {
            return Font.custom("Lato-Light", size: size)
        }
        func lightItalic(size: CGFloat) -> Font {
            return Font.custom("Lato-LightItalic", size: size)
        }
        func regular(size: CGFloat) -> Font {
            return Font.custom("Lato-Regular", size: size)
        }
        func thin(size: CGFloat) -> Font {
            return Font.custom("Lato-Thin", size: size)
        }
        func thinItalic(size: CGFloat) -> Font {
            return Font.custom("Lato-ThinItalic", size: size)
        }
    }
    static let Lato = LatoFonts()
}
