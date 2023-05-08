# swift5.8-typechecker-regression

This repo demonstrates a type checker regression in the Swift 5.8 compiler which was not there in the Swift 5.7 compiler.

Swift project issue: https://github.com/apple/swift/issues/65765

In the `SwiftTypeCheckerRegression.swift` file, in the `Combined` struct there is an explanation:

```swift
  /// in the `body` below, successive chaining of
  /// `.onChange` increase compile time exponentially
  /// with Xcode 14.3 / Swift 5.8, whereas with
  /// Xcode 14.2 / Swift 5.7 any length of chain compiles
  /// very quicky.
  ///
  /// 9 chains: 3 seconds
  /// 10 chains: 6 seconds
  /// 11 chains: 12 seconds
  /// 12 chains: 30 seconds
```

The demo repo happens to use the [Swift Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture) as a dependency as that is how I discovered the issue, and it enabled me to make an easily reproducible demo. However, I doubt very much that the issue is related to TCA, and I'm sure it could be reproduced in other ways.
