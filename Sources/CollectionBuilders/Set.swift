//
//  All Contributions by Match Group
//
//  Copyright © 2025 Tinder (Match Group, LLC)
//
//  Licensed under the Match Group Modified 3-Clause BSD License.
//  See https://github.com/Tinder/CollectionBuilders/blob/main/LICENSE for license information.
//

extension Set {

    @resultBuilder
    public enum Builder {

        // swiftlint:disable:next nesting
        public typealias Expression = Element

        // swiftlint:disable:next nesting
        public typealias Component = Set<Element>

        // swiftlint:disable:next nesting
        public typealias FinalResult = Set<Element>

        public static func buildExpression(_ expression: Expression?) -> Component {
            guard let expression: Expression
            else { return [] }
            return [expression]
        }

        public static func buildExpression(_ component: Component?) -> Component {
            guard let component: Component
            else { return [] }
            return component
        }

        public static func buildBlock(_ components: Component...) -> Component {
            components.reduce(into: Set()) { $0.formUnion($1) }
        }

        public static func buildOptional(_ component: Component?) -> Component {
            component ?? []
        }

        public static func buildEither(first component: Component) -> Component {
            component
        }

        public static func buildEither(second component: Component) -> Component {
            component
        }

        public static func buildArray(_ components: [Component]) -> Component {
            components.reduce(into: Set()) { $0.formUnion($1) }
        }

        public static func buildLimitedAvailability(_ component: Component) -> Component {
            component
        }

        public static func buildFinalResult(_ component: Component) -> FinalResult {
            component
        }
    }

    public init(@Builder elements: () -> Self) {
        self = elements()
    }

    public static func build(@Builder elements: () -> Self) -> Self {
        elements()
    }

    public mutating func insert(@Builder elements: () -> Self) {
        formUnion(elements())
    }

    public func inserting(@Builder elements: () -> Self) -> Self {
        union(elements())
    }
}
