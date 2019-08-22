import DataStructure.ListNode;

public class Linked_List_Cycle {
    public boolean hasCycle(ListNode head) {
        if (head == null) {
            return false;
        } else {
            ListNode first = head;
            ListNode second = head;
            while (first != null && second != null && second.next != null) {
                first = first.next;
                second = second.next.next;
                if (first == second) {
                    return true;
                }
            }
            return false;
        }
    }
}