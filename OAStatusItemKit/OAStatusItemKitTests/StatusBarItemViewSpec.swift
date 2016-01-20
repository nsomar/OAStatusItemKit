import Quick
import Nimble

@testable import OAStatusItemKit


class StatusBarItemViewSpec: QuickSpec {
  override func spec() {
    
    it("gets initialized with two images") {
      
      let brightImage = NSImage()
      let darkImage = NSImage()
      let statusView = StatusBarItemView(brightStatusImage: brightImage, darkStatusImage: darkImage)
      
      expect(statusView.statusBarImages.brightImage) == brightImage
      expect(statusView.statusBarImages.darkImage) == darkImage
    }
    
    it("gets initialized with single image") {
      
      let image = NSImage()
      let statusView = StatusBarItemView(statusImage: image)
      
      expect(statusView.statusBarImages.brightImage) == image
      expect(statusView.statusBarImages.darkImage).to(beNil())
    }
    
    it("creates a view with correct height and width") {
      let interface = MockStatusBarInterface(isDarkInterface: true, statusBarHeight: 22.0)
      let image = NSImage(size: NSMakeSize(10.0, 10.0))
      
      let statusView =
      StatusBarItemView(statusBarImages: StatusBarImages(image: image), statusBarInterface: interface)
      
      expect(statusView.frame) == NSMakeRect(0.0, 0.0, 18.0, 22.0)
    }
    
    it("updates the frame width") {
      let statusView = StatusBarItemView(statusBarImages: StatusBarImages(image: NSImage()))
      
      statusView.itemWidth = 200.0
      expect(statusView.frame) == NSMakeRect(0.0, 0.0, 200.0, 22.0)
    }
    
    it("handles clicks") {
      let statusView = StatusBarItemView(statusBarImages: StatusBarImages(image: NSImage()))
      
      var clicked = false
      statusView.clickHandler = { highlighted in
        clicked = true
      }

      expect(clicked) == false
      
      statusView.mouseDown(NSEvent())
      expect(clicked) == true
    }
    
    it("becomes highlighted when clicked") {
      let statusView = StatusBarItemView(statusBarImages: StatusBarImages(image: NSImage()))
      
      expect(statusView.isHighlighted) == false
      expect(statusView.statusBarImages.isHighlighted) == false
      
      statusView.mouseDown(NSEvent())
      
      expect(statusView.isHighlighted) == true
      expect(statusView.statusBarImages.isHighlighted) == true
    }
    
    it("returns the rect in a window") {
      let statusView = StatusBarItemView(statusBarImages: StatusBarImages(image: NSImage()))
      let window =
      NSWindow(contentRect: NSMakeRect(0.0, 0.0, 500.0, 500.0),
        styleMask: 1, backing: NSBackingStoreType.Buffered, `defer`: false)

      window.contentView?.addSubview(statusView)
      statusView.frame = NSMakeRect(10.0, 10.0, 100, 100)
      
      expect(statusView.statusBarRect.size) == NSMakeSize(100, 22.0)
      expect(statusView.statusBarRect.origin.x)  == 0
      expect(Double(statusView.statusBarRect.origin.y)) ≈ (45.0, 5.0)
    }
    
  }
}
