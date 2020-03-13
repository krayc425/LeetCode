public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var queue: [(TreeNode, Int)] = [(root, 0)]
        var res: [Int] = []
        while !queue.isEmpty {
            let pair = queue.removeFirst()
            let node = pair.0
            let level = pair.1
            if res.count <= level {
                res.append(Int.min)
            }
            res[level] = max(res[level], node.val)
            if let left = node.left {
                queue.append((left, level + 1))
            }
            if let right = node.right {
                queue.append((right, level + 1))
            }
        }
        return res
    }
}
