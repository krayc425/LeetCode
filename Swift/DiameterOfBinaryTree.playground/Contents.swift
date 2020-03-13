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

struct ReturnType {
    
    var height: Int
    var maxDistance: Int
    
    init(_ h: Int, _ d: Int) {
        self.height = h
        self.maxDistance = d
    }
    
}

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        return helper(root).maxDistance
    }
    
    func helper(_ node: TreeNode?) -> ReturnType {
        guard let node = node else {
            return ReturnType(0, 0)
        }
        let left = helper(node.left)
        let right = helper(node.right)
        let height = max(left.height, right.height) + 1
        let distance = [left.maxDistance, right.maxDistance, left.height + right.height].max()!
        return ReturnType(height, distance)
    }
}
