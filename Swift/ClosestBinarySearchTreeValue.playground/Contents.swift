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
    
    var res: Int = 0
    var minDiff: Double = Double(Int.max)
    
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        process(root, target)
        return res
    }
    
    func process(_ node: TreeNode?, _ target: Double) {
        guard let node = node else {
            return
        }
        let valInt = node.val
        let val: Double = Double(valInt)
        let currDiff = abs(target - val)
        if currDiff < minDiff {
            minDiff = currDiff
            res = valInt
        }
        process(node.left, target)
        process(node.right, target)
    }
    
}
