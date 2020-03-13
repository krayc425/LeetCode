import Foundation

typealias Operation = (Int, Int) -> Int

indirect enum Node {
    case value(Int)
    case op(Operation, Node, Node)
    
    func evaluate() -> Int {
        switch self {
        case .value(let value):
            return value
        case .op(let op, let left, let right):
            return op(left.evaluate(), right.evaluate())
        }
    }
}

extension Node: ExpressibleByIntegerLiteral {
    init(integerLiteral value: IntegerLiteralType) {
        self = .value(value)
    }
}

let root: Node = .op(+, 1, .op(*, 2, 3))
print(root.evaluate())
