public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        // find the second half
        var slow = head
        var fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        // reverse second half
        let preMiddle: ListNode? = slow
        let preCur: ListNode? = slow?.next
        while preCur?.next != nil {
            let cur = preCur?.next
            preCur?.next = cur?.next
            cur?.next = preMiddle?.next
            preMiddle?.next = cur
        }
        // connect two halves
        var p1 = head
        var p2 = preMiddle?.next
        while p1 !== preMiddle {
            preMiddle?.next = p2?.next
            p2?.next = p1?.next
            p1?.next = p2
            p1 = p2?.next
            p2 = preMiddle?.next
        }
    }
}
