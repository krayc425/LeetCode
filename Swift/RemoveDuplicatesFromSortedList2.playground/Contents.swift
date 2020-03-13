public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return head
        }
        let fakeHead = ListNode(0)
        fakeHead.next = head
        var prev: ListNode? = fakeHead
        var curr: ListNode? = head
        while curr != nil {
            var hasDuplicated = false
            while curr?.next != nil && curr!.next?.val == curr!.val {
                hasDuplicated = true
                curr = curr?.next
            }
            prev?.next = hasDuplicated ? curr?.next : curr
            if !hasDuplicated {
                prev = prev?.next
            }
            curr = curr?.next
        }
        printNode(fakeHead.next)
        return fakeHead.next
    }
    
    func printNode(_ node: ListNode?) {
        var str = ""
        var node = node
        while node != nil {
            str += String(node!.val)
            if node?.next != nil {
                str += " -> "
            }
            node = node?.next
        }
        print(str)
    }
}

let node1 = ListNode(1)
//let node2 = ListNode(2)
//let node3 = ListNode(2)
//let node4 = ListNode(2)
//let node5 = ListNode(5)
//let node6 = ListNode(5)
//let node7 = ListNode(7)
//let node8 = ListNode(8)
//node1.next = node2
//node2.next = node3
//node3.next = node4
//node4.next = node5
//node5.next = node6
//node6.next = node7
//node7.next = node8
Solution().deleteDuplicates(node1)
