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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return helper(0, inorder.count - 1, 0, postorder.count - 1, inorder, postorder)
    }
    
    func helper(_ inBegin: Int, _ inEnd: Int, _ postBegin: Int, _ postEnd: Int, _ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard postBegin <= postEnd else {
            return nil
        }
        let val = postorder[postEnd]
        let idx = inorder.firstIndex(of: val)!
        let root = TreeNode(val)
        root.left = helper(inBegin, idx - 1, postBegin, postBegin + idx - 1 - inBegin, inorder, postorder)
        root.right = helper(idx + 1, inEnd, postEnd - inEnd + idx, postEnd - 1, inorder, postorder)
        return root
    }
}
