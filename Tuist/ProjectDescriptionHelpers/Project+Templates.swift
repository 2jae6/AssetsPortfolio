import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String,
                           platform: Platform,
                           dependencies: [TargetDependency]
    ) -> Project {
        var targets = makeAppTargets(name: name,
                                     platform: platform,
                                     dependencies: dependencies
        )
      return Project(name: name,
                     organizationName: "tuist.io",
                     packages: [
                      .remote(url: "https://github.com/CombineCommunity/CombineCocoa.git",
                              requirement: .exact("0.4.1"))
                     ],
                     targets: targets
      )
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, platform: Platform) -> [Target] {
      let sources = Target(name: name,
                           platform: platform,
                           product: .framework,
                           bundleId: "io.tuist.\(name)",
                           infoPlist: .default,
                           sources: ["Targets/\(name)/Sources/**.swift"],
                           resources: [],
                           dependencies: [
                            .package(product: "https://github.com/CombineCommunity/CombineCocoa.git")
                           ], coreDataModels: [
                            .init(Path.relativeToRoot("Targets/AssetsPortfolio/Resources/AssetsCoreData.xcdatamodeld"))
                           ]
      )
        return [
          sources
        ]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

//        let testTarget = Target(
//            name: "\(name)Tests",
//            platform: platform,
//            product: .unitTests,
//            bundleId: "io.tuist.\(name)Tests",
//            infoPlist: .default,
//            sources: ["Targets/\(name)/Tests/**"],
//            dependencies: [
//                .target(name: "\(name)")
//        ])
        return [
          mainTarget
//          , testTarget
        ]
    }
}
