/// A structure that represents image Size
public struct Size {
  public let width: Int
  public let height: Int

  public init(width: Int, height: Int) {
    self.width = width
    self.height = height
  }
}

/// A structure that represents a point in a bitmap image
public typealias BitmapPoint = (Int, Int)

/// Bitmap representation of an image
public protocol Bitmap {
  func color(point: BitmapPoint) -> Color
  func getSize() -> Size
}
