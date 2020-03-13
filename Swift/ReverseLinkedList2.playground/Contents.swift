public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var count = 0
        let fake = ListNode(0)
        fake.next = head
        var pre: ListNode? = fake
        for _ in 0..<(m - 1) {
            pre = pre?.next
        }
        var prev: ListNode? = pre?.next
        var curr: ListNode? = prev?.next
        for _ in 0..<(n - m) {
            prev?.next = curr?.next
            curr?.next = pre?.next
            pre?.next = curr
            curr = prev?.next
        }
        return fake.next
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
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
let node6 = ListNode(6)
let node7 = ListNode(7)
let node8 = ListNode(8)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7
node7.next = node8
Solution().reverseBetween(node1, 2, 5)
