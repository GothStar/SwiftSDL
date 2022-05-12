// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "SDL",
    products: [
        .library(
            name: "SDL",
            targets: ["SDL"]),
        .library(
            name: "SDLImage",
            targets: ["SDLImage"]),
        .executable(
            name: "SDLDemo",
            targets: ["SDLDemo"]),
        ],
    targets: [
        .target(
            name: "SDLDemo",
            dependencies: ["SDL"]),
        .target(
            name: "SDL",
            dependencies: ["CSDL2"]),
        .target(
            name: "SDLImage",
            dependencies: ["CSDL2_Image"]),
        .systemLibrary(
            name: "CSDL2",
            pkgConfig: "sdl2",
            providers: [
                .brew(["sdl2"]),
                .apt(["libsdl2-dev"])
            ]),
        .systemLibrary(
            name: "CSDL2_Image",
            pkgConfig: "sdl2_image",
            providers: [
                .brew(["sdl2_image"]),
                .apt(["libsdl2-image-dev"])
            ]),
        .testTarget(
            name: "SDLTests",
            dependencies: ["SDL"]),
        ],
    swiftLanguageVersions: [.v5]
)
