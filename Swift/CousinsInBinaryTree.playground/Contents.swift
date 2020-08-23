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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        let findNodeX = traverse(nil, root, 0, x)
        let findNodeY = traverse(nil, root, 0, y)
        return findNodeX.0 == findNodeY.0 && findNodeX.1?.val != findNodeY.1?.val
    }
    
    func traverse(_ parent: TreeNode?, _ node: TreeNode?, _ depth: Int, _ val: Int) -> (Int, TreeNode?) {
        guard let node = node else {
            return (Int.max, nil)
        }
        if node.val == val {
            return (depth, parent)
        }
        let left = traverse(node, node.left, depth + 1, val)
        let right = traverse(node, node.right, depth + 1, val)
        return left.0 != Int.max ? left : right
    }
}

func findNodeAndDepth(_ parent: TreeNode?, _ cur: TreeNode?, _ x: Int, _ depth: Int) -> (Int, TreeNode?) {
    if cur == nil { return (Int.max, nil) }
    if cur!.val == x { return (depth, parent) }
    let left = findNodeAndDepth(cur, cur?.left, x, depth+1)
    let right = findNodeAndDepth(cur, cur?.right, x, depth+1)
    return left.0 != Int.max ? left : right
}
