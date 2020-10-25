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
    
    func rob(_ root: TreeNode?) -> Int {
        let res = helper(root)
        return max(res.noRob, res.rob)
    }
    
    func helper(_ root: TreeNode?) -> (noRob: Int, rob: Int) {
        guard let root = root else {
            return (0, 0)
        }
        let left = helper(root.left)
        let right = helper(root.right)
        let noRob = max(left.noRob, left.rob) + max(right.noRob, right.rob)
        let rob = left.noRob + right.noRob + root.val
        return (noRob, rob)
    }

}
