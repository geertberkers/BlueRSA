// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

//
//  Package.swift
//  CryptorRSA
//
//  Copyright © 2017-2020 IBM and the authors of the Kitura project. All rights reserved.
//
// 	Licensed under the Apache License, Version 2.0 (the "License");
// 	you may not use this file except in compliance with the License.
// 	You may obtain a copy of the License at
//
// 	http://www.apache.org/licenses/LICENSE-2.0
//
// 	Unless required by applicable law or agreed to in writing, software
// 	distributed under the License is distributed on an "AS IS" BASIS,
// 	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// 	See the License for the specific language governing permissions and
// 	limitations under the License.
//

import PackageDescription

var dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/Kitura/LoggerAPI.git", from: "1.9.200"),
]
var targetDependencies: [Target.Dependency] = ["LoggerAPI"]

	
#if os(Linux)
	
	dependencies.append(.package(url: "https://github.com/Kitura/OpenSSL.git", from: "2.2.200"))
	targetDependencies.append(.byName(name: "OpenSSL"))
	
#endif

let package = Package(
    name: "CryptorRSA",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CryptorRSA",
            targets: ["CryptorRSA"]
        )
    ],
	dependencies: dependencies,
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CryptorRSA",
            dependencies: targetDependencies
        ),
        .testTarget(
            name: "CryptorRSATests",
            dependencies: ["CryptorRSA"]
        )
    ]
)
