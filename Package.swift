// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
  name: "Swort",
  products: [
    .library(
      name: "Swort",
      targets: ["Swort"]
    )
  ],
  targets: [
    .target(
      name: "Swort",
      dependencies: [],
      path: "./Sources/"
    )
  ]
)
