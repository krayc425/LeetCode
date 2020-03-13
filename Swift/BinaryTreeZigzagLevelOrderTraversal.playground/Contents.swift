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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if (root == nil) {
            return []
        }
        var result: [[Int]] = []
        var queue: [TreeNode] = [root!]
        var isLtoR = true
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
            result.append(isLtoR ? temp : temp.reversed())
            isLtoR.toggle()
        }
        return result
    }
}
