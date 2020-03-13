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

class BSTIterator {

    var arr: [Int]
    var index = 0
    
    init(_ root: TreeNode?) {
        arr = []
        inOrder(root)
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        return arr.removeFirst()
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !arr.isEmpty
    }
    
    private func inOrder(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        inOrder(node.left)
        arr.append(node.val)
        inOrder(node.right)
    }
    
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
