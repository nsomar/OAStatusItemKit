# OAStatusItemKit

<p align="center">
<img src="http://i.imgur.com/hsN16Ya.png" width="800" align="middle"/>
<br/>
</p>

[![CI Status](http://img.shields.io/travis/oarrabi/OAStatusItemKit.svg?style=flat)](https://travis-ci.org/oarrabi/OAStatusItemKit)
[![codecov.io](https://codecov.io/github/oarrabi/OAStatusItemKit/coverage.svg?branch=master)](https://codecov.io/github/oarrabi/OAStatusItemKit?branch=master)
[![Version](https://img.shields.io/cocoapods/v/OAStatusItemKit.svg?style=flat)](http://cocoapods.org/pods/OAStatusItemKit)
[![License](https://img.shields.io/cocoapods/l/OAStatusItemKit.svg?style=flat)](http://cocoapods.org/pods/OAStatusItemKit)
[![Platform](https://img.shields.io/cocoapods/p/OAStatusItemKit.svg?style=flat)](http://cocoapods.org/pods/OAStatusItemKit)

<br/>
OAStatusItemKit allows you to easily create mac status bar apps with a swifty flavour.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

OAStatusItemKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OAStatusItemKit"
```

## Usage
First, `import OAStatusItemKit`

Then create a `StatusBarItemView`

```swift
let statusBarItem =
StatusBarItemView(brightStatusImage: NSImage(named: "Icon-bright")!,
darkStatusImage: NSImage(named: "Icon-dark")!)
```

Pass the created status bar item to a value of `StatusBarWindowStyle` enum.

```
StatusBarWindowStyle.Popup
.createPresenter(withXibName: "Panel", statusItem: statusBarItem)
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

#### StatusBarWindowStyle
[StatusBarWindowStyle](http://oarrabi.github.io/OAStatusItemKit/Classes/StatusBarWindowStyle.html) is a class responsible for displaying the status bar view.

The status ber view can be displayed in a popup, or in a window.

To display in a popup, use the following:

```swift
StatusBarWindowStyle.Popup.createPresenter(withXibName:statusItem:)
```

If however you want to display it in a window, you have two choices:

```swift
StatusBarWindowStyle.Window(StatusWindowPlacement)
StatusBarWindowStyle.WindowWithSize(StatusWindowPlacement, NSSize)
```

For example, you can do the following:

```swift
StatusBarWindowStyle.Window(.StatusBarItemCenter)
.createPresenter(withXibName: "NAME", statusItem: statusBarItem)

//or

StatusBarWindowStyle.WindowWithSize(.StatusBarItemCenter, NSSize(width: 400, height: 400))
.createPresenter(withXibName: "NAME", statusItem: statusBarItem)
```


`StatusWindowPlacement` is used to determine the placement of the window in the screen, the values are described [here](http://oarrabi.github.io/OAStatusItemKit/Enums/StatusWindowPlacement.html)

#### StatusBarViewControllerType
If your view controller implements the `StatusBarViewControllerType` protocol, then `StatusBarViewPresenter` will set its `statusViewPresenter` field.

This is useful if you want to show/hide the status bar window from inside your view controller.

## Tests
To run tests execute `make test`

## Author

Omar Abdelhafith, o.arrabi@me.com

## License

OAStatusItemKit is available under the MIT license. See the LICENSE file for more info.
