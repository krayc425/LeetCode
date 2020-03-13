public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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
    func findMiddleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        while slow?.next != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return TreeNode(head.val)
        }
        guard let midNode = findMiddleNode(head) else {
            return nil
        }
        let root: TreeNode = TreeNode(midNode.val)
        var p = head
        while (p?.next !== midNode) {
            p = p?.next
        }
        p?.next = nil
        root.left = sortedListToBST(head)
        root.right = sortedListToBST(midNode.next)
        return root
    }
}
