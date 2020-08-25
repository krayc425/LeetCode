public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        } else if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        }
        var l1: ListNode? = l1
        var l2: ListNode? = l2
        var stack1: [Int] = []
        var stack2: [Int] = []
        while l1 != nil {
            stack1.append(l1!.val)
            l1 = l1?.next
        }
        while l2 != nil {
            stack2.append(l2!.val)
            l2 = l2?.next
        }
        var temp: ListNode? = nil
        var carry = 0
        while let last1 = stack1.last, let last2 = stack2.last {
            var val = last1 + last2 + carry
            if val >= 10 {
                carry = 1
                val -= 10
            } else {
                carry = 0
            }
            let node = ListNode(val, temp)
            temp = node
            stack1.removeLast()
            stack2.removeLast()
        }
        if stack1.isEmpty {
            while let last2 = stack2.last {
                var val = last2 + carry
                if val >= 10 {
                    carry = 1
                    val -= 10
                } else {
                    carry = 0
                }
                let node = ListNode(val, temp)
                temp = node
                stack2.removeLast()
            }
        } else if stack2.isEmpty {
            while let last1 = stack1.last {
                var val = last1 + carry
                if val >= 10 {
                    carry = 1
                    val -= 10
                } else {
                    carry = 0
                }
                let node = ListNode(val, temp)
                temp = node
                stack1.removeLast()
            }
        }
        if carry == 1 {
            let node = ListNode(1, temp)
            temp = node
        }
        return temp
    }
}

let head1_4 = ListNode(3)
let head1_3 = ListNode(4, head1_4)
let head1_2 = ListNode(2, head1_3)
let head1_1 = ListNode(7, head1_2)
let head2_3 = ListNode(4)
let head2_2 = ListNode(6, head2_3)
let head2_1 = ListNode(5, head2_2)
Solution().addTwoNumbers(head1_1, head2_1)
