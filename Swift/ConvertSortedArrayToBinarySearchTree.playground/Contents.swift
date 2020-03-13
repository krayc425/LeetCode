
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        } else if nums.count == 1 {
            return TreeNode(nums[0])
        } else {
            let idx = Int(nums.count / 2)
            let root = TreeNode(nums[idx])
            root.left = sortedArrayToBST(Array(nums[0..<idx]))
            root.right = sortedArrayToBST(Array(nums[(idx + 1)...]))
            return root
        }
    }
}

if let node = Solution().sortedArrayToBST([-10,-3,0,5,9]) {
    print(node.val)
}
