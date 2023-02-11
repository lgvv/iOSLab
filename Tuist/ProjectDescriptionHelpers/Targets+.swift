import ProjectDescription

extension Target {

    public static func appTarget(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: "com.curation.\(name)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
            infoPlist: .file(path: "SupportingFiles/\(name)-Info.plist"),
//            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            entitlements: .none,
            dependencies: dependencies
        )
    }

    public static func staticLibrary(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "com.curation.\(name)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: dependencies
        )
    }

    public static func staticLibraryTarget(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "com.curation.\(name)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
            infoPlist: .default,
            sources: ["../\(name)/Sources/**"],
            dependencies: dependencies
        )
    }

    public static func unitTests(
        name: String
    ) -> Target {
        Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.curation.\(name)Tests",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)]
        )
    }

    public static func frameworkTarget(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: .framework,
            bundleId: "com.curation.\(name)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: dependencies
        )
    }
}
