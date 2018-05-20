import Foundation

/// Utility function to calculate sum of the given numbers.
func sum(_ numbers: Array<Double>) -> Double {
  return numbers.reduce(0, (+))
}

/// Utility function to calculate average of the given numbers.
func average(_ numbers: Array<Double>) -> Double {
  return sum(numbers) / Double(numbers.count)
}

/// Calculate ascii art size
func calculateAsciiArtSize(blockSize: Size, actualSize: Size) -> Size {
  return Size(
    width: Int(ceil(Double(actualSize.width) / Double(blockSize.width))),
    height: Int(ceil(Double(actualSize.height) / Double(blockSize.height)))
  )
}

/// Convert grayscale to character
func grayScaleToCharacter(grayScale: Double, characters: Array<String>) -> String {
  let index = Int(grayScale / 255.0 * Double(characters.count - 1))

  return characters[index]
}

/// Generate a character to represent block pixels located at the given cursor
func guessCharacter(cursor: BitmapPoint, block: Size, image: Bitmap, characters: Array<String>) -> String {
  let (cursorX, cursorY) = cursor
  let maxX = min((cursorX + block.width), Int(image.getSize().width))
  let maxY = min((cursorY + block.height), Int(image.getSize().height))

  let xs = Array(cursorX ..< maxX)
  let ys = Array(cursorY ..< maxY)

  let grayScales: Array<Double> = xs.flatMap { x in
    return ys.map { y in
      return image.color(point: (x, y)).grayScale()
    }
  }

  return grayScaleToCharacter(grayScale: average(grayScales), characters: characters)
}

/// Calculate block size of the given image size.
public func calculateBlockSize(size: Size) -> Size {
  return Size(
    width: Int(round(Double(size.width) / 200)),
    height: Int(round(Double(size.height) / 100))
  )
}

public let defaultAsciiArtCharacters: Array<String> = Array<String>([
  "$", "@", "B", "%", "h", "k", "b", "d", "p", "q", "w", "m",
  "O", "0", "Q", "C", "Y", "X", "c", "x", "r", "j", "f", "t",
  "/", "\\", "|", "(", ")", "1", "{", "}", "[", "]", "-", "+", ";", ",", "\"", "^", "`",
  "\'", ",", ",", ".", ".", " ", " ", " ", " ", " ", " "
  ].reversed())

/// Generate an ASCII art string where each character will represent
/// 1 block with size `blockSize`.
public func createAsciiArt(
  blockSize: Size,
  image: Bitmap,
  characters: Array<String> = defaultAsciiArtCharacters
) -> String {
  let size = calculateAsciiArtSize(blockSize: blockSize, actualSize: image.getSize())
  let xs = Array(0 ..< Int(size.width))
  let ys = Array(0 ..< Int(size.height))

  return ys.reduce("") { acc, y in
    let next = xs.reduce(acc) { acc, x in
      let cursor = (x * Int(blockSize.width), y * Int(blockSize.height))

      return acc + guessCharacter(cursor: cursor, block: blockSize, image: image, characters: characters)
    }

    retrn next + "\n"
  }
}
