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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard let first = preorder.first else {
            return nil
        }
        let root = TreeNode(first)
        let idx = inorder.firstIndex(of: first)!
        root.left = buildTree(Array(preorder[1..<idx+1]), Array(inorder[0..<idx]))
        root.right = buildTree(Array(preorder[(idx+1)...]), Array(inorder[(idx+1)...]))
        return root
    }
}
