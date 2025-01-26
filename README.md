[![Swift](https://github.com/Tinder/CollectionBuilders/actions/workflows/swift.yml/badge.svg?event=push)](https://github.com/Tinder/CollectionBuilders/actions/workflows/swift.yml)
&nbsp;
[![DocC](https://github.com/Tinder/CollectionBuilders/actions/workflows/docc.yml/badge.svg?event=push)](https://github.com/Tinder/CollectionBuilders/actions/workflows/docc.yml)
&nbsp;
[![Artifactory](https://github.com/Tinder/CollectionBuilders/actions/workflows/artifactory.yml/badge.svg?event=push)](https://github.com/Tinder/CollectionBuilders/actions/workflows/artifactory.yml)

# Collection Builders

Swift Result Builders for `Array` and `Set`

## Overview

Creating or modifying arrays and sets using [result builders](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators#Result-Builders) allows for inline logic such as `if/else`, `switch`, `for` loops and availability checking. Also commas are not needed to separate elements. 

When used with [Combine](https://developer.apple.com/documentation/combine) for example, the result builder may be used to add `AnyCancellable` instances to a `Set` without calling `store(in:)` on each instance individually.

See sample code (below) for [examples of common use cases](#code-examples).

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

### Swift Package Manager

**Package Dependency**

> Replace `<version>` with the desired minimum version.

```swift
.package(url: "https://github.com/Tinder/CollectionBuilders.git", from: "<version>")
```

**Target Dependency**

```
"CollectionBuilders"
```

### Swift Package Collection

```swift
https://swiftpackageindex.com/Tinder/collection.json
```

## Supported Types

The `Array` and `Set` result builders may be used with any `Element` type.

## Code Examples

Examples of common use cases:

- [`Array<NSLayoutConstraint>`](#arraynslayoutconstraint)
- [`Set<AnyCancellable>`](#setanycancellable)

### `Array<NSLayoutConstraint>`

```swift
NSLayoutConstraint.activate(Array {
    subview.leftAnchor.constraint(equalTo: view.leftAnchor)
    subview.rightAnchor.constraint(equalTo: view.rightAnchor)
    subview.topAnchor.constraint(equalTo: view.topAnchor)
    subview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
})
```

### `Set<AnyCancellable>`

```swift
var cancellables = Set<AnyCancellable>()

cancellables.formUnion(Set {
    publisherA.sink { value in }
    publisherB.assign(to: \.keyPath, on: object)
})
```

OR

```swift
var cancellables = Set<AnyCancellable>()

cancellables.insert {
    publisherA.sink { value in }
    publisherB.assign(to: \.keyPath, on: object)
}
```

## Contributing

While interest in contributing to this project is appreciated, it has been open 
sourced solely for the purpose of sharing with the community. This means we are 
unable to accept outside contributions at this time and pull requests will not 
be reviewed or merged. To report a security concern or vulnerability, please 
submit a GitHub issue.

## License

Licensed under the [Match Group Modified 3-Clause BSD License](
https://github.com/Tinder/CollectionBuilders/blob/main/LICENSE
).
