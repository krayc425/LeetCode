public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var node1: ListNode? = nil
        var node2: ListNode? = head
        while node2 != nil {
            let temp = node2?.next
            node2?.next = node1
            node1 = node2
            node2 = temp
        }
        return node2
    }
}
