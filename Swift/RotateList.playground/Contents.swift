public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k <= 0 || head == nil {
            return head
        }
        var length = 0
        var node = head
        var tail: ListNode? = nil
        while node != nil {
            if node?.next == nil {
                tail = node
            }
            node = node?.next
            length += 1
        }
        let interval = k % length
        if interval == 0 {
            return head
        }
        var prev: ListNode? = nil
        node = head
        tail?.next = head
        for _ in 0..<(length - interval) {
            prev = node
            node = node?.next
        }
        var newHead = node
        prev?.next = nil
        return newHead
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

var newHead = Solution().rotateRight(node1, 1)
while newHead != nil {
    print(newHead?.val)
    newHead = newHead?.next
}
