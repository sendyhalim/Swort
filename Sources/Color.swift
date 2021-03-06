/// A data structure that represents pixel color of a bitmap
public struct Color {
  public typealias RGBA = (Int, Int, Int, Double)

  public let rgba: RGBA

  public init(rgba: Color.RGBA) {
    self.rgba = rgba
  }

  func grayScale() -> Double {
    let (red, green, blue, _) = rgba

    return (0.299 * Double(red)) +
      (0.587 * Double(green)) +
      (0.114 * Double(blue))
  }
}

func doubleToRGBBased(doubleValue: Double) -> Int {
  return Int(doubleValue * 255)
}

public func toRGBA(red: Double, green: Double, blue: Double, alpha: Double) -> Color.RGBA {
  return (
    doubleToRGBBased(doubleValue: red),
    doubleToRGBBased(doubleValue: green),
    doubleToRGBBased(doubleValue: blue),
    alpha
  )
}
