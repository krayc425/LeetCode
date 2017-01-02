import DataStructure.ListNode;

/**
 * Created by Kray on 2016/12/26.
 */
public class Reverse_Linked_List {

    public static void main(String[] args) {
        Reverse_Linked_List reverse_linked_list = new Reverse_Linked_List();
        ListNode node1 = new ListNode(1);
        ListNode node2 = new ListNode(2);
        ListNode node3 = new ListNode(3);
        ListNode node4 = new ListNode(4);
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        node1.print();
        reverse_linked_list.reverseList(node1).print();
    }

    public ListNode reverseList(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }
        ListNode temp = head.next;
        head.next = null;
        while(temp.next != null){
            ListNode prev = temp;
            temp = temp.next;
            prev.next = head;
            head = prev;
        }
        temp.next = head;
        head = temp;
        return head;
    }
}
