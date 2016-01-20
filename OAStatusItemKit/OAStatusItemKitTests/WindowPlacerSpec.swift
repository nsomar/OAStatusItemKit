import Quick
import Nimble

@testable import OAStatusItemKit

class WindowPlacerSpec: QuickSpec {
  override func spec() {
    
    let window = DummyWindow(frame: NSRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0))
    let screen = DummyScreen(frame: NSRect(x: 0.0, y: 0.0, width: 500.0, height: 500.0))
    
    
    describe("Screen bottom") {
      
      it("returns the left bottom coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenBottomLeft)
        
        expect(rect) == NSRect(x: 12, y: 12, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenBottomLeft
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 12, y: 12, width: 200.0, height: 200.0)
      }
      
      it("returns the center bottom coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenBottomCenter)
        
        expect(rect) == NSRect(x: 150, y: 12, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenBottomCenter
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 150, y: 12, width: 200.0, height: 200.0)
      }
      
      it("returns the right bottom coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenBottomRight)
        
        expect(rect) == NSRect(x: 288, y: 12, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenBottomRight
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 288, y: 12, width: 200.0, height: 200.0)
      }
      
    }
    
    describe("Screen top") {
      
      it("returns the left top coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenTopLeft)
        
        expect(rect) == NSRect(x: 12, y: 278, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenTopLeft
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 12, y: 278, width: 200.0, height: 200.0)
      }
      
      it("returns the center top coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenTopCenter)
        
        expect(rect) == NSRect(x: 150, y: 278, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenTopCenter
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 150, y: 278, width: 200.0, height: 200.0)
      }
      
      it("returns the right top coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenTopRight)
        
        expect(rect) == NSRect(x: 288, y: 278, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenTopRight
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 288, y: 278, width: 200.0, height: 200.0)
      }
      
    }
    
    
    describe("Screen middle") {
      
      it("returns the left middle coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenMiddleLeft)
        
        expect(rect) == NSRect(x: 12, y: 139, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenMiddleLeft
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 12, y: 139, width: 200.0, height: 200.0)
      }
      
      it("returns the center middle coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenMiddleCenter)
        
        expect(rect) == NSRect(x: 150, y: 139, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenMiddleCenter
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 150, y: 139, width: 200.0, height: 200.0)
        
      }
      
      it("returns the right middle coordinates") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = ScreenWindowPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen,
            placement: .ScreenMiddleRight)
        
        expect(rect) == NSRect(x: 288, y: 139, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .ScreenMiddleRight
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 288, y: 139, width: 200.0, height: 200.0)
      }
      
    }
    
    
    describe("Status bar item relative") {
      
      it("places the window on the center of the status bar item view") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = StatusBarItemCenterPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            placement: .StatusBarItemCenter)
        
        expect(rect) == NSRect(x: 171, y: 278, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .StatusBarItemCenter
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 171, y: 278, width: 200.0, height: 200.0)
      }
      
      
      it("places the window on the right of the status bar item view") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = StatusBarItemCenterPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            placement: .StatusBarItemRight)
        
        expect(rect) == NSRect(x: 248, y: 278, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .StatusBarItemRight
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 248, y: 278, width: 200.0, height: 200.0)
      }
      
      
      it("places the window on the left of the status bar item view") {
        
        let statusItemRect = NSRect(x: 260.0, y: 478.0, width: 22.0, height: 22.0)
        let rect = StatusBarItemCenterPlacer()
          .rect(forWindow: window, withSize: nil,
            statusBarItemRect: statusItemRect,
            placement: .StatusBarItemLeft)
        
        expect(rect) == NSRect(x: 94.0, y: 278, width: 200.0, height: 200.0)
        
        expect(StatusWindowPlacement
          .StatusBarItemLeft
          .rect(forWindow: window,
            withSize: nil,
            statusBarItemRect: statusItemRect,
            inScreen: screen)) == NSRect(x: 94.0, y: 278, width: 200.0, height: 200.0)
      }
      
    }
    
    it("places the window inside the screen") {
      
      let statusItemRect = NSRect(x: 450.0, y: 478.0, width: 22.0, height: 22.0)
     
      expect(StatusWindowPlacement
        .StatusBarItemRight
        .rect(forWindow: window,
          withSize: nil,
          statusBarItemRect: statusItemRect,
          inScreen: screen)) == NSRect(x: 288.0, y: 278.0, width: 200.0, height: 200.0)
    }
    
  }
  
}
