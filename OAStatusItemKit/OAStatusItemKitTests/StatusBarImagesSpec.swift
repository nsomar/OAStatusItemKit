import Quick
import Nimble
@testable import OAStatusItemKit


class StatusBarImagesSpec: QuickSpec {
  override func spec() {
    
    describe("StatusBarImages") {
      var statusBarImages: StatusBarImages!
      
      describe("Initializing with 1 image") {
        let tintedImage = DummyImage(size: NSMakeSize(2, 2))
        let image = DummyImage(size: NSMakeSize(1, 1), tintedImage: tintedImage)
        tintedImage.tintedImage = image
        
        context("Bright Interface") {
          
          beforeEach {
            statusBarImages = StatusBarImages(image: image,
              statusBarInterface: MockStatusBarInterface(isDarkInterface: false, statusBarHeight: 100))
          }
          
          it("returns the passed image") {
            expect(statusBarImages.image) == image
          }
          
          it("returns a tinted image when highlighted") {
            statusBarImages.isHighlighted = true
            expect(statusBarImages.image) == tintedImage
          }
          
          it("returns size of the image") {
            expect(statusBarImages.imagesSize) == NSMakeSize(1, 1)
          }
          
        }
        
        context("Dark Interface") {
          
          beforeEach {
            statusBarImages = StatusBarImages(image: image,
              statusBarInterface: MockStatusBarInterface(isDarkInterface: true, statusBarHeight: 100))
          }
          
          it("returns a tinted image") {
            expect(statusBarImages.image) == tintedImage
          }
          
          it("returns the same tinted image") {
            statusBarImages.isHighlighted = true
            expect(statusBarImages.image) == tintedImage
          }
          
          it("returns size of the tinted image") {
            expect(statusBarImages.imagesSize) == NSMakeSize(2, 2)
          }
          
        }
        
      }
      
      
      describe("Initializing with 2 image") {
        
        let tintedDarkImage = DummyImage(size: NSMakeSize(2, 2))
        let darkImage = DummyImage(size: NSMakeSize(1, 1), tintedImage: tintedDarkImage)
        tintedDarkImage.tintedImage = darkImage
        
        let tintedBrightImage = DummyImage(size: NSMakeSize(20, 20))
        let brightImage = DummyImage(size: NSMakeSize(10, 10), tintedImage: tintedBrightImage)
        tintedBrightImage.tintedImage = brightImage
        
        context("Bright Interface") {
          
          beforeEach {
            statusBarImages = StatusBarImages(brightImage: brightImage, darkImage: darkImage,
              statusBarInterface: MockStatusBarInterface(isDarkInterface: false, statusBarHeight: 100))
          }
          
          it("returns the bright image") {
            expect(statusBarImages.image) == brightImage
          }
          
          it("returns the dark image instead of a tinted image") {
            statusBarImages.isHighlighted = true
            expect(statusBarImages.image) == darkImage
          }
          
          it("returns size of the image") {
            expect(statusBarImages.imagesSize) == NSMakeSize(10, 10)
          }
        }
        
        context("Dark Interface") {
          beforeEach {
            statusBarImages = StatusBarImages(brightImage: brightImage, darkImage: darkImage,
              statusBarInterface: MockStatusBarInterface(isDarkInterface: true, statusBarHeight: 100))
          }
          
          it("returns the dark image") {
            expect(statusBarImages.image) == darkImage
          }
          
          it("returns the same dark image") {
            statusBarImages.isHighlighted = true
            expect(statusBarImages.image) == darkImage
          }
          
          it("returns size of the tinted image") {
            expect(statusBarImages.imagesSize) == NSMakeSize(1, 1)
          }
          
        }
        
      }
      
    }
  }
}