public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
    
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var first: ListNode? = head
        var second: ListNode? = head
        while second?.next != nil {
            first = first?.next
            second = second?.next?.next
        }
        return first
    }
}

//let node6 = ListNode(6)
let node5 = ListNode(5)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)
let node = Solution().middleNode(node1)
print(node?.val)
