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
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var maxSum = Int.min
        var queue: [TreeNode] = [root]
        var maxLevel = 1
        var level = 1
        while !queue.isEmpty {
            let count = queue.count
            var sum = 0
            for _ in 0..<count {
                let node = queue.removeFirst()
                sum += node.val
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            if sum > maxSum {
                maxSum = sum
                maxLevel = level
            }
            level += 1
        }
        return maxLevel
    }
}
