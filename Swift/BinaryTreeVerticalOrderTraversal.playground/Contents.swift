public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        // The root's position (very middle) is column 0, and on left: negative, right: positive
        var queue: [(TreeNode?, Int)] = [(root, 0)]
        var columnNodeMap: [Int: [TreeNode]] = [:]
        while !queue.isEmpty {
            let (node, column) = queue.removeFirst()
            if let node = node {
                columnNodeMap[column, default: []].append(node)
                queue.append((node.left, column - 1))
                queue.append((node.right, column + 1))
            }
        }
        let sortedKeys = columnNodeMap.keys.sorted()
        var res: [[Int]] = []
        for key in sortedKeys {
            res.append(columnNodeMap[key]!.map { $0.val })
        }
        return res
    }
}
