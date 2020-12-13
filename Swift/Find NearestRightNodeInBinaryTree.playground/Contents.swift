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
    func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        var seen = false
        var queue: [TreeNode] = [root]
        while !queue.isEmpty {
            if seen {
                break
            }
            let count = queue.count
            for _ in 0..<count {
                let first = queue.removeFirst()
                if first === u {
                    seen = true
                } else if seen {
                    return first
                }
                if let left = first.left {
                    queue.append(left)
                }
                if let right = first.right {
                    queue.append(right)
                }
            }
        }
        return nil
    }
}
