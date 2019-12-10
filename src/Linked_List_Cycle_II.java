import DataStructure.ListNode;

public class Linked_List_Cycle_II {
    public ListNode detectCycle(ListNode head) {
        if (head == null) {
            return null;
        } else {
            ListNode first = head;
            ListNode second = head;
            while (first != null && second != null && second.next != null) {
                first = first.next;
                second = second.next.next;
                if (first == second) {
                    first = head;
                    while (first != second) {
                        first = first.next;
                        second = second.next;
                    }
                    return first;
                }
            }
            return null;
        }
    }
}
