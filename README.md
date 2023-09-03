[![Swift](https://github.com/Tinder/CollectionBuilders/actions/workflows/swift.yml/badge.svg?event=push)](https://github.com/Tinder/CollectionBuilders/actions/workflows/swift.yml)

# Collection Builders

Swift result builders for `Array` and `Set`

## API

### `Array`

```swift
init(@Builder elements: () -> Self)
```

```swift
static func build(@Builder elements: () -> Self) -> Self
```

```swift
mutating func append(@Builder elements: () -> Self)
```

```swift
func appending(@Builder elements: () -> Self) -> Self
```

### `Set`

```swift
init(@Builder elements: () -> Self)
```

```swift
static func build(@Builder elements: () -> Self) -> Self
```

```swift
mutating func insert(@Builder elements: () -> Self)
```

```swift
func inserting(@Builder elements: () -> Self) -> Self
```

## Minimum Requirements

- iOS `13.0`
- Swift `5.8`

## Installation

**Swift Package Manager Dependency**

> Replace `<version>` with the desired minimum version.

```swift
.package(url: "https://github.com/Tinder/CollectionBuilders.git", from: "<version>")
```

## Supported Types

The `Array` and `Set` result builders may be used with any `Element` type.

## Code Examples

Examples of common use cases:

- [`Array<NSLayoutConstraint>`](#example-for-arraynslayoutconstraint)
- [`Set<AnyCancellable>`](#example-for-setanycancellable)

### Example for `Array<NSLayoutConstraint>`

```swift
import CollectionBuilders
import UIKit

let view: UIView = .init()
let subview: UIView = .init()

view.addSubview(subview)

let constraints: [NSLayoutConstraint] = .build {
    subview
        .widthAnchor
        .constraint(equalToConstant: 100)
    subview
        .heightAnchor
        .constraint(equalToConstant: 100)
    subview
        .centerXAnchor
        .constraint(equalTo: view.centerXAnchor)
    subview
        .centerYAnchor
        .constraint(equalTo: view.centerYAnchor)
}

NSLayoutConstraint.activate(constraints)
```

### Example for `Set<AnyCancellable>`

```swift
import CollectionBuilders
import Combine

var cancellables: Set<AnyCancellable> = []

cancellables.insert {
    Just("Hello World")
        .sink { _ in }
    (1...100)
        .publisher
        .sink { _ in }
    Timer
        .publish(every: 1, on: RunLoop.main, in: .common)
        .autoconnect()
        .sink { _ in }
    NotificationCenter
        .default
        .publisher(for: UIApplication.didBecomeActiveNotification)
        .sink { _ in }
}
```
