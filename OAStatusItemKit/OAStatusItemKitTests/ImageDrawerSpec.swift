import Quick
import Nimble

@testable import OAStatusItemKit

class ImageDrawerSpec: QuickSpec {
    override func spec() {

      it("Draws the image in the rect") {
        let dummy = DummyImage(size: NSMakeSize(2.0, 2.0))
        
        ImageDrawer.draw(image: dummy, inRect: NSMakeRect(0.0, 0.0, 10.0, 10.0))
        
        expect(dummy.drawPoint) == NSMakePoint(4.0, 4.0)
      }
    }
}
