/**
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 */

/**
 * Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var ptr1 = l1, ptr2 = l2, node = ListNode(0), ptr = node, head = node
        var hasCarry = false
        while true {
            var nextVal = (ptr1?.val ?? 0) + (ptr2?.val ?? 0) + (hasCarry ? 1 : 0)
            if nextVal >= 10 {
                nextVal -= 10
                hasCarry = true
            } else {
                hasCarry = false
            }
            ptr.next = ListNode(nextVal)
            ptr = ptr.next!
            if ptr1?.next == nil && ptr2?.next == nil {
                break
            }
            ptr1 = ptr1?.next ?? nil
            ptr2 = ptr2?.next ?? nil
        }
        if hasCarry {
            ptr.next = ListNode(1)
        }
        return head.next
    }
}

let node11 = ListNode(5)
let node12 = ListNode(6)
let node13 = ListNode(4)

let node21 = ListNode(2)
let node22 = ListNode(4)
let node23 = ListNode(3)

node11.next = node12
node12.next = node13

node21.next = node22
node22.next = node23

Solution().addTwoNumbers(node11, node21)
