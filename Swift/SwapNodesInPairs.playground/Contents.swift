public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }

        var oldHead: ListNode? = nil
        var prev: ListNode? = ListNode(0)
        var curr: ListNode? = head!
        
        while curr != nil && curr?.next != nil {
            let temp = curr!.next
            prev?.next = temp
            curr?.next = temp?.next
            temp?.next = curr
            if oldHead == nil {
                oldHead = prev
            }
            prev = temp?.next
            curr = curr?.next
        }
        
        return oldHead?.next
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
node1.next = node2
node2.next = node3
node3.next = node4

Solution().swapPairs(node1)
