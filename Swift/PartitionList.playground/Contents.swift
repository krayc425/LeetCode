public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard head != nil else {
            return head
        }
        let smallHead: ListNode = ListNode(0)   // remove the first one
        var smallCurr: ListNode? = smallHead
        let bigHead: ListNode = ListNode(0)     // remove the first one
        var bigCurr: ListNode? = bigHead
        var curr = head
        while curr != nil {
            if curr!.val >= x {
                bigCurr!.next = curr
                bigCurr = curr
            } else {
                smallCurr!.next = curr
                smallCurr = curr
            }
            curr = curr?.next
        }
        bigCurr!.next = nil
        smallCurr!.next = bigHead.next
        return smallHead.next
    }
}
