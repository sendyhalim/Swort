import Quick
import Nimble

@testable import Swort

class AsciiArtSpec: QuickSpec {
  override func spec() {
    describe("calculateAsciiArtSize(blockSize:actualSize)") {
      context("when actualSize is divisible by blockSize") {
        it("should calculate correctly") {
          let blockSize = Size(width: 3, height: 3)
          let actualSize = Size(width: 30, height: 60)
          let size = calculateAsciiArtSize(blockSize: blockSize, actualSize: actualSize)

          expect(size.width) == 10
          expect(size.height) == 20
        }
      }

      context("when actualSize is not divisible by blockSize") {
        it("should shrink correctly") {
          let blockSize = Size(width: 3, height: 3)
          let actualSize = Size(width: 31, height: 67)
          let size = calculateAsciiArtSize(blockSize: blockSize, actualSize: actualSize)

          expect(size.width) == 11
          expect(size.height) == 23
        }
     }
    }
  }
}
