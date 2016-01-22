# OAStatusItemKit

[![CI Status](http://img.shields.io/travis/oarrabi/OAStatusItemKit.svg?style=flat)](https://travis-ci.org/oarrabi/OAStatusItemKit)
[![Version](https://img.shields.io/cocoapods/v/OAStatusItemKit.svg?style=flat)](http://cocoapods.org/pods/OAStatusItemKit)
[![License](https://img.shields.io/cocoapods/l/OAStatusItemKit.svg?style=flat)](http://cocoapods.org/pods/OAStatusItemKit)
[![Platform](https://img.shields.io/cocoapods/p/OAStatusItemKit.svg?style=flat)](http://cocoapods.org/pods/OAStatusItemKit)
[![codecov.io](https://codecov.io/github/oarrabi/OAStatusItemKit/coverage.svg?branch=master)](https://codecov.io/github/oarrabi/OAStatusItemKit?branch=master)

      
OAStatusItemKit allows you to easily create mac status bar apps with swifty flavour.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

OAStatusItemKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OAStatusItemKit"
```

## Usage
First, `import OAStatusItemKit`

Then create a `StatusBarItemView` and a `StatusBarWindowController`

```swift
let statusBarItem =
StatusBarItemView(brightStatusImage: NSImage(named: "Icon-bright")!,
darkStatusImage: NSImage(named: "Icon-dark")!)

let statusBarWindow =
StatusBarWindowController(xibName: "xib name", statusItem: statusBarItem)
```

Finally, you need to make your app a mac agent app. to do so open Info.plist. Add a new key "Application is agent (UIElement)" and set it's value to YES.

![image](http://i.imgur.com/DwY0Ffj.png)

Thats it, enjoy.

## Documentation
Bellow is a quick and dirty introduction, check the full documentation [here](http://oarrabi.github.io/OAStatusItemKit/)

#### StatusBarItemView
[StatusBarItemView](http://oarrabi.github.io/OAStatusItemKit/Classes/StatusBarItemView.html) is the class responsible for representing a status bar view.

Example usage:

```swift
let statusItem = StatusBarItemView(brightStatusImage: BrightImage,
darkStatusImage: DarkImage)

let statusItem = StatusBarItemView(statusImage: AnyImage)
```

To change the width of the view, use `itemWidth`

```swift
statusItem.itemWidth = 200
```

#### StatusBarWindowController
[StatusBarWindowController](http://oarrabi.github.io/OAStatusItemKit/Classes/StatusBarWindowController.html) is a class responsible for displaying and placing a view on screen.

It can be created with a xib or a view.

```swift
let controller = StatusBarWindowController(xibName:statusItem:)
let controller = StatusBarWindowController(view:statusItem:)
```

The displayed panel will take the size of the view passed, if you want to specify a different size, then set it using `windowSize`

```
controller.windowSize = NSSize...
```

`windowPlacement` property is used to determine the placement of the window in the screen, the values are described [here](http://oarrabi.github.io/OAStatusItemKit/Enums/StatusWindowPlacement.html)

## Tests
To run tests execute `make test`

## Author

Omar Abdelhafith, o.arrabi@me.com

## License

OAStatusItemKit is available under the MIT license. See the LICENSE file for more info.
