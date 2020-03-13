public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeKLists_tle(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }
        let head = ListNode(0)
        var curr: ListNode? = head
        var myList = lists
        while true {
            var temp: [(val: Int, node: ListNode)] = []
            var newMyList: [ListNode?] = []
            for list in myList where list != nil {
                temp.append((list!.val, list!))
            }
            if temp.isEmpty {
                break
            }
            temp.sort { (t1, t2) -> Bool in
                t1.val < t2.val
            }
            curr?.next = temp.first!.node
            for list in myList {
                if list === temp.first!.node {
                    newMyList.append(list?.next)
                } else {
                    newMyList.append(list)
                }
            }
            myList = newMyList
            curr = curr?.next
            print("-----")
        }
        
        curr = head
        while curr != nil {
            print(curr!.val, terminator: " -> ")
            curr = curr?.next
        }
        
        return head.next
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var values = [Int]()
        for list in lists {
            var head = list
            while head != nil {
                values.append(head!.val)
                head = head?.next
            }
        }
        values.sort()
        let fakeHead = ListNode(0)
        var head = fakeHead
        for val in values {
            head.next = ListNode(val)
            head = head.next!
        }
        return fakeHead.next
    }
}

let node1_1 = ListNode(1)
let node1_2 = ListNode(4)
let node1_3 = ListNode(5)
node1_1.next = node1_2
node1_2.next = node1_3

let node2_1 = ListNode(1)
let node2_2 = ListNode(3)
let node2_3 = ListNode(4)
node2_1.next = node2_2
node2_2.next = node2_3

let node3_1 = ListNode(2)
let node3_2 = ListNode(6)
let node3_3 = ListNode(9)
node3_1.next = node3_2
node3_2.next = node3_3

Solution().mergeKLists([node1_1, node2_1, node3_1])
