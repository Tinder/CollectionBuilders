//
//  All Contributions by Match Group
//
//  Copyright © 2025 Tinder (Match Group, LLC)
//
//  Licensed under the Match Group Modified 3-Clause BSD License.
//  See https://github.com/Tinder/CollectionBuilders/blob/main/LICENSE for license information.
//

import CollectionBuilders
import Nimble
import XCTest

final class ArrayTests: XCTestCase {

    func testExpressionBuild() {

        func givenArray() -> [String] {
            Array {
                ["element1"]
                "element2"
                ["element3"]
            }
        }

        expect(givenArray()) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testExpressionBuildOptional() {

        func givenArray(with argument: String?) -> [String] {
            Array {
                ["element1"]
                argument
                ["element3"]
            }
        }

        expect(givenArray(with: "element2")) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenArray(with: nil)) == [
            "element1",
            "element3"
        ]
    }

    func testExpressionIf() {

        func givenArray(with argument: Bool) -> [String] {
            Array {
                ["element1"]
                if argument {
                    "element2"
                }
                ["element3"]
            }
        }

        expect(givenArray(with: true)) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenArray(with: false)) == [
            "element1",
            "element3"
        ]
    }

    func testExpressionIfElse() {

        func givenArray(with argument: Bool) -> [String] {
            Array {
                ["element1"]
                if argument {
                    "element2 - true"
                } else {
                    "element2 - false"
                }
                ["element3"]
            }
        }

        expect(givenArray(with: true)) == [
            "element1",
            "element2 - true",
            "element3"
        ]

        expect(givenArray(with: false)) == [
            "element1",
            "element2 - false",
            "element3"
        ]
    }

    func testExpressionSwitch() {

        func givenArray(with argument: Bool) -> [String] {
            Array {
                ["element1"]
                switch argument {
                case true:
                    "element2 - true"
                case false:
                    "element2 - false"
                }
                ["element3"]
            }
        }

        expect(givenArray(with: true)) == [
            "element1",
            "element2 - true",
            "element3"
        ]

        expect(givenArray(with: false)) == [
            "element1",
            "element2 - false",
            "element3"
        ]
    }

    func testExpressionForIn() {

        func givenArray(with argument: Int) -> [String] {
            Array {
                for i in 1...argument { // swiftlint:disable:this identifier_name
                    "element\(i)"
                }
            }
        }

        expect(givenArray(with: 3)) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testExpressionAvailability() {

        func givenArray(with argument: Bool) -> [String] {
            if argument {
                return Array {
                    ["element1"]
                    if #available(iOS 10.0, *) {
                        "element2"
                    }
                    ["element3"]
                }
            }
            return Array {
                ["element1"]
                if #available(iOS 10000.0, *) {
                    "element2"
                }
                ["element3"]
            }
        }

        expect(givenArray(with: true)) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenArray(with: false)) == [
            "element1",
            "element3"
        ]
    }

    func testBuild() {

        func givenArray() -> [String] {
            Array {
                ["element1"]
                ["element2"]
                ["element3"]
            }
        }

        expect(givenArray()) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testBuildOptional() {

        // swiftlint:disable:next discouraged_optional_collection
        func givenArray(with argument: [String]?) -> [String] {
            Array {
                ["element1"]
                argument
                ["element3"]
            }
        }

        expect(givenArray(with: ["element2"])) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenArray(with: nil)) == [
            "element1",
            "element3"
        ]
    }

    func testIf() {

        func givenArray(with argument: Bool) -> [String] {
            Array {
                ["element1"]
                if argument {
                    ["element2"]
                }
                ["element3"]
            }
        }

        expect(givenArray(with: true)) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenArray(with: false)) == [
            "element1",
            "element3"
        ]
    }

    func testIfElse() {

        func givenArray(with argument: Bool) -> [String] {
            Array {
                ["element1"]
                if argument {
                    ["element2 - true"]
                } else {
                    ["element2 - false"]
                }
                ["element3"]
            }
        }

        expect(givenArray(with: true)) == [
            "element1",
            "element2 - true",
            "element3"
        ]

        expect(givenArray(with: false)) == [
            "element1",
            "element2 - false",
            "element3"
        ]
    }

    func testSwitch() {

        func givenArray(with argument: Bool) -> [String] {
            Array {
                ["element1"]
                switch argument {
                case true:
                    ["element2 - true"]
                case false:
                    ["element2 - false"]
                }
                ["element3"]
            }
        }

        expect(givenArray(with: true)) == [
            "element1",
            "element2 - true",
            "element3"
        ]

        expect(givenArray(with: false)) == [
            "element1",
            "element2 - false",
            "element3"
        ]
    }

    func testForIn() {

        func givenArray(with argument: Int) -> [String] {
            Array {
                for i in 1...argument { // swiftlint:disable:this identifier_name
                    ["element\(i)"]
                }
            }
        }

        expect(givenArray(with: 3)) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testAvailability() {

        func givenArray(with argument: Bool) -> [String] {
            if argument {
                return Array {
                    ["element1"]
                    if #available(iOS 10.0, *) {
                        ["element2"]
                    }
                    ["element3"]
                }
            }
            return Array {
                ["element1"]
                if #available(iOS 10000.0, *) {
                    ["element2"]
                }
                ["element3"]
            }
        }

        expect(givenArray(with: true)) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenArray(with: false)) == [
            "element1",
            "element3"
        ]
    }

    func testBuildMethod() {
        expect([String].build {
            "element1"
            "element2"
            "element3"
        }) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testAppendMethod() {
        var elements: [String] = ["element1"]
        elements.append {
            "element2"
            "element3"
        }
        expect(elements) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testAppendingMethod() {
        expect(["element1"].appending {
            "element2"
            "element3"
        }) == [
            "element1",
            "element2",
            "element3"
        ]
    }
}
