public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        let oddHead: ListNode = ListNode()
        let evenHead: ListNode = ListNode()
        var count = 1
        var curr = head
        var oddCurr: ListNode? = oddHead
        var evenCurr: ListNode? = evenHead
        while curr != nil {
            if count % 2 == 1 {
                oddCurr?.next = curr
                curr = curr?.next
                oddCurr = oddCurr?.next
                oddCurr?.next = nil
            } else {
                evenCurr?.next = curr
                curr = curr?.next
                evenCurr = evenCurr?.next
                evenCurr?.next = nil
            }
            count += 1
        }
        oddCurr?.next = evenHead.next
        return oddHead.next
    }
}
