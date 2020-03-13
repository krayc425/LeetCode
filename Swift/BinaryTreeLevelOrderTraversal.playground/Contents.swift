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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var result: [[Int]] = []
        var queue: [TreeNode] = [root]
        while !queue.isEmpty {
            var temp: [Int] = []
            let size = queue.count
            for _ in 0..<size {
                let node = queue.removeFirst()
                temp.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(temp)
        }
        return result
    }
}
