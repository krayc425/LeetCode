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
    
    var min1 = Int.max
    var min2 = Int.max
        
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        process(root)
        return (min2 == Int.max || min1 == min2) ? -1 : min2
    }
    
    func process(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        let val = node.val
        if val < min1 {
            min2 = min1
            min1 = val
        } else if val < min2 && val > min1 {
            min2 = val
        }

        process(node.left)
        process(node.right)
    }
    
}
