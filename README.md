# ColorDebugView
ColorDebugView is a simple NS/UIView which can be used to quickly get a view on the screen when roughing out layouts/animations. It is written in Swift.

**Features:**
- Works for both OS X and iOS
- Translucent by default to help debug issues with overlapping views
- Crosshairs to help with alignment
- The ‘Up’ direction is marked to debug issues with rotation/animation
- Can be rectangular or circular
- IBDesignable/Inspectable for direct use within Interface Builder
- Choose a custom color (or just use a random one)

## Installation
Drag the “ColorDebugView.swift” file into your Xcode project

## Usage via Interface Builder
Drag a custom view into your storyboard and change it’s class to “ColorDebugView”. Optionally set the color/shape in IB’s attributes inspector.  Setting the color to “default” will result in a random color.

## Programmatic Usage
Use one of the following initialization methods to create a view:

	ColorDebugView(frame: CGRect) //Creates a ColorDebugView with a random color and the given frame

	ColorDebugView(frame: CGRect, color: NS/UIColor) //Creates a ColorDebugView with the given frame/color

	ColorDebugView(point: CGPoint, side: CGFloat, color: NS/UIColor, isDot: Bool) //Creates a ColorDebugView at the given point. 
	//NOTE: The side, color, and isDot parameters are all optional.
	//By default it will create a dot at the given point with sides of size 64.0 and a random color


Then add the ColorDebugView to a view which you want it to display in

## License

Copyright (c) 2015 Jon Hull <jhull@gbis.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.