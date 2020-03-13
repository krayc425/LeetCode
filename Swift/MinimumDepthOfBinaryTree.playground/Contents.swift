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
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let root = root!
        if root.left == nil && root.right == nil {
            return 1
        } else {
            let minLeft = 1 + minDepth(root.left)
            let minRight = 1 + minDepth(root.right)
            if minLeft == 1 {
                return minRight
            }
            if minRight == 1 {
                return minLeft
            } else {
                return min(minLeft, minRight)
            }
        }
    }
}

let root = TreeNode(1)
let left = TreeNode(2)
root.left = left
print(Solution().minDepth(root))
