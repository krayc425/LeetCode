
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil || head!.next == nil {
            return true
        }
        var first = head
        var second = head
        while second != nil {
            first = first?.next
            second = second?.next?.next
        }
        var temp: [Int] = []
        while first != nil {
            temp.append(first!.val)
            first = first!.next
        }
        second = head
        while !temp.isEmpty {
            if second!.val != temp.removeLast() {
                return false
            }
            second = second!.next
        }
        return true
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(2)
let node4 = ListNode(3)
//let node5 = ListNode(1)
node1.next = node2
node2.next = node3
node3.next = node4
//node4.next = node5

Solution().isPalindrome(node1)

// 或者找到中点以后，将后半段反转，再比较
