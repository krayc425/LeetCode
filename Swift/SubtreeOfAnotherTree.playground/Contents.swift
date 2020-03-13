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
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if t == nil {
            return true
        }
        if s == nil {
            return false
        }
        if process(s, t) {
            return true
        }
        return isSubtree(s?.left, t) || isSubtree(s?.right, t)
    }
    
    func process(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        if t == nil || s == nil {
            return false
        }
        let s = s!
        let t = t!
        if s.val == t.val {
            return process(s.left, t.left) && process(s.right, t.right)
        }
        return false
    }
}
