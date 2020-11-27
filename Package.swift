// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "feather",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .executable(name: "Run", targets: ["Run"]),
        .library(name: "App", targets: ["App"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor", from: "4.34.0"),
        .package(url: "https://github.com/binarybirds/feather-core", from: "1.0.0-beta"),
        .package(url: "https://github.com/binarybirds/leaf-foundation", from: "1.0.0-beta"),
        /// drivers
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.0.0"),

//        .package(name: "redirect-module", url: "https://github.com/feather-modules/redirect", from: "1.0.0-beta"),
//        .package(name: "static-module", url: "https://github.com/feather-modules/static", from: "1.0.0-beta"),
//        .package(name: "blog-module", url: "https://github.com/feather-modules/blog", from: "1.0.0-beta"),
//        .package(name: "site-module", url: "https://github.com/feather-modules/site", from: "1.0.0-beta"),
//        .package(name: "menu-module", url: "https://github.com/feather-modules/menu", from: "1.0.0-beta"),
        .package(name: "swifty-module", url: "https://github.com/feather-modules/swifty", from: "1.0.0-beta"),
        .package(name: "markdown-module", url: "https://github.com/feather-modules/markdown", from: "1.0.0-beta"),
        .package(name: "analytics-module", url: "https://github.com/feather-modules/analytics", from: "1.0.0-beta"),
        .package(name: "sponsor-module", url: "https://github.com/feather-modules/sponsor", from: "1.0.0-beta"),
    ],
    targets: [
        .target(name: "App", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            .product(name: "LeafFoundation", package: "leaf-foundation"),
            
            /// drivers
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),

            /// modules
//            .product(name: "RedirectModule", package: "redirect-module"),
//            .product(name: "StaticModule", package: "static-module"),
//            .product(name: "BlogModule", package: "blog-module"),
//            .product(name: "SiteModule", package: "site-module"),
//            .product(name: "MenuModule", package: "menu-module"),
            .product(name: "SwiftyModule", package: "swifty-module"),
            .product(name: "MarkdownModule", package: "markdown-module"),
            .product(name: "AnalyticsModule", package: "analytics-module"),
            .product(name: "SponsorModule", package: "sponsor-module"),
            
            .product(name: "Vapor", package: "vapor"),
        ], exclude: [
            "Modules/Blog/Bundle",
            "Modules/Menu/Bundle",
            "Modules/Redirect/Bundle",
            "Modules/Site/Bundle",
            "Modules/Sponsor/Bundle",
            "Modules/Static/Bundle",
        ], swiftSettings: [
            .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
        ]),
        .target(name: "Run", dependencies: [
             .target(name: "App"),
        ]),
//        .testTarget(name: "AppTests", dependencies: [
//            .target(name: "App"),
//            .product(name: "XCTVapor", package: "vapor"),
//        ])
    ]
)
