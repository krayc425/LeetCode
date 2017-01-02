import DataStructure.ListNode;

/**
 * Created by Kray on 2016/12/29.
 */
public class Remove_Linked_List_Elements {

    public static void main(String[] args) {
        ListNode node1 = new ListNode(1);
        ListNode node2 = new ListNode(2);
//        ListNode node3 = new ListNode(3);
//        ListNode node4 = new ListNode(3);
//        ListNode node5 = new ListNode(3);
//        ListNode node6 = new ListNode(2);
//        ListNode node7 = new ListNode(1);
        node1.next = node2;
//        node2.next = node3;
//        node3.next = node4;
//        node4.next = node5;
//        node5.next = node6;
//        node6.next = node7;
        node1.print();
        System.out.println("--------------");
        Remove_Linked_List_Elements remove_linked_list_elements = new Remove_Linked_List_Elements();
        remove_linked_list_elements.removeElements(node1, 2).print();
    }

    public ListNode removeElements(ListNode head, int val) {
        ListNode temp = new ListNode(0);
        temp.next = head;
        ListNode prev = temp;
        temp = temp.next;
        while (temp != null) {
            if (temp.val == val) {
                if (temp == head) {
                    head = head.next;
                    temp = temp.next;
                    prev = prev.next;
                } else if (temp.next == null) {
                    prev.next = null;
                    temp = null;
                } else {
                    prev.next = prev.next.next;
                    temp = temp.next;
                }
            } else {
                temp = temp.next;
                prev = prev.next;
            }
        }
        return head;
    }
}
