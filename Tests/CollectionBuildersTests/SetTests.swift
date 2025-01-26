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

import Combine

final class SetTests: XCTestCase {

    func testExpressionBuild() {

        func givenSet() -> Set<String> {
            Set {
                ["element1"]
                "element2"
                ["element3"]
            }
        }

        expect(givenSet()) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testExpressionBuildOptional() {

        func givenSet(with argument: String?) -> Set<String> {
            Set {
                ["element1"]
                argument
                ["element3"]
            }
        }

        expect(givenSet(with: "element2")) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenSet(with: nil)) == [
            "element1",
            "element3"
        ]
    }

    func testExpressionIf() {

        func givenSet(with argument: Bool) -> Set<String> {
            Set {
                ["element1"]
                if argument {
                    "element2"
                }
                ["element3"]
            }
        }

        expect(givenSet(with: true)) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenSet(with: false)) == [
            "element1",
            "element3"
        ]
    }

    func testExpressionIfElse() {

        func givenSet(with argument: Bool) -> Set<String> {
            Set {
                ["element1"]
                if argument {
                    "element2 - true"
                } else {
                    "element2 - false"
                }
                ["element3"]
            }
        }

        expect(givenSet(with: true)) == [
            "element1",
            "element2 - true",
            "element3"
        ]

        expect(givenSet(with: false)) == [
            "element1",
            "element2 - false",
            "element3"
        ]
    }

    func testExpressionSwitch() {

        func givenSet(with argument: Bool) -> Set<String> {
            Set {
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

        expect(givenSet(with: true)) == [
            "element1",
            "element2 - true",
            "element3"
        ]

        expect(givenSet(with: false)) == [
            "element1",
            "element2 - false",
            "element3"
        ]
    }

    func testExpressionForIn() {

        func givenSet(with argument: Int) -> Set<String> {
            Set {
                for i in 1...argument { // swiftlint:disable:this identifier_name
                    "element\(i)"
                }
            }
        }

        expect(givenSet(with: 3)) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testExpressionAvailability() {

        func givenSet(with argument: Bool) -> Set<String> {
            if argument {
                return Set {
                    ["element1"]
                    if #available(iOS 10.0, *) {
                        "element2"
                    }
                    ["element3"]
                }
            }
            return Set {
                ["element1"]
                if #available(iOS 10000.0, *) {
                    "element2"
                }
                ["element3"]
            }
        }

        expect(givenSet(with: true)) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenSet(with: false)) == [
            "element1",
            "element3"
        ]
    }

    func testBuild() {

        func givenSet() -> Set<String> {
            Set {
                ["element1"]
                ["element2"]
                ["element3"]
            }
        }

        expect(givenSet()) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testBuildOptional() {

        // swiftlint:disable:next discouraged_optional_collection
        func givenSet(with argument: Set<String>?) -> Set<String> {
            Set {
                ["element1"]
                argument
                ["element3"]
            }
        }

        expect(givenSet(with: ["element2"])) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenSet(with: nil)) == [
            "element1",
            "element3"
        ]
    }

    func testIf() {

        func givenSet(with argument: Bool) -> Set<String> {
            Set {
                ["element1"]
                if argument {
                    ["element2"]
                }
                ["element3"]
            }
        }

        expect(givenSet(with: true)) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenSet(with: false)) == [
            "element1",
            "element3"
        ]
    }

    func testIfElse() {

        func givenSet(with argument: Bool) -> Set<String> {
            Set {
                ["element1"]
                if argument {
                    ["element2 - true"]
                } else {
                    ["element2 - false"]
                }
                ["element3"]
            }
        }

        expect(givenSet(with: true)) == [
            "element1",
            "element2 - true",
            "element3"
        ]

        expect(givenSet(with: false)) == [
            "element1",
            "element2 - false",
            "element3"
        ]
    }

    func testSwitch() {

        func givenSet(with argument: Bool) -> Set<String> {
            Set {
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

        expect(givenSet(with: true)) == [
            "element1",
            "element2 - true",
            "element3"
        ]

        expect(givenSet(with: false)) == [
            "element1",
            "element2 - false",
            "element3"
        ]
    }

    func testForIn() {

        func givenSet(with argument: Int) -> Set<String> {
            Set {
                for i in 1...argument { // swiftlint:disable:this identifier_name
                    ["element\(i)"]
                }
            }
        }

        expect(givenSet(with: 3)) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testAvailability() {

        func givenSet(with argument: Bool) -> Set<String> {
            if argument {
                return Set {
                    ["element1"]
                    if #available(iOS 10.0, *) {
                        ["element2"]
                    }
                    ["element3"]
                }
            }
            return Set {
                ["element1"]
                if #available(iOS 10000.0, *) {
                    ["element2"]
                }
                ["element3"]
            }
        }

        expect(givenSet(with: true)) == [
            "element1",
            "element2",
            "element3"
        ]

        expect(givenSet(with: false)) == [
            "element1",
            "element3"
        ]
    }

    func testBuildMethod() {
        expect(Set<String>.build {
            "element1"
            "element2"
            "element3"
        }) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testInsertMethod() {
        var elements: Set<String> = ["element1"]
        elements.insert {
            "element2"
            "element3"
        }
        expect(elements) == [
            "element1",
            "element2",
            "element3"
        ]
    }

    func testInsertinMethod() {
        expect(Set(["element1"]).inserting {
            "element2"
            "element3"
        }) == [
            "element1",
            "element2",
            "element3"
        ]
    }
}
