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
    typealias ResultType = (isBalanced: Bool, height: Int)
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        return judge(root).isBalanced
    }
    
    func judge(_ node: TreeNode?) -> ResultType {
        if node == nil {
            return ResultType(true, 0)
        } else {
            let leftResult = judge(node?.left)
            let rightResult = judge(node?.right)
            let height: Int = max(leftResult.height, rightResult.height) + 1
            let balanced: Bool = leftResult.isBalanced && rightResult.isBalanced && abs(leftResult.height - rightResult.height) <= 1
            return ResultType(balanced, height)
        }
    }
}
