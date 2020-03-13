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
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        var cur = head
        while let next = cur!.next {
            if next.val == cur!.val {
                cur!.next = next.next
            } else {
                cur = cur!.next
            }
            if cur == nil {
                break
            }
        }
        return head
    }
}

let node1 = ListNode(1)
let node2 = ListNode(1)
let node3 = ListNode(2)
let node4 = ListNode(3)
let node5 = ListNode(3)
//let node6 = ListNode(6)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
//node5.next = node6
Solution().deleteDuplicates(node1)

