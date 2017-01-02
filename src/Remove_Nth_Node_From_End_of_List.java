import DataStructure.ListNode;

/**
 * Created by Kray on 2016/12/29.
 */
public class Remove_Nth_Node_From_End_of_List {

    public static void main(String[] args) {
        ListNode node1 = new ListNode(1);
        ListNode node2 = new ListNode(2);
        ListNode node3 = new ListNode(3);
        ListNode node4 = new ListNode(4);
        ListNode node5 = new ListNode(3);
        ListNode node6 = new ListNode(2);
        ListNode node7 = new ListNode(1);
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node5;
        node5.next = node6;
        node6.next = node7;
        node1.print();

        Remove_Nth_Node_From_End_of_List remove_nth_node_from_end_of_list = new Remove_Nth_Node_From_End_of_List();
        remove_nth_node_from_end_of_list.removeNthFromEnd(node1, 3).print();
    }

    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode temp = new ListNode(0);
        temp.next = head;
        ListNode prev = temp;
        temp = temp.next;

        while (n > 0) {
            temp = temp.next;
            n--;
        }

        ListNode deleteNode = head;
        while(temp != null){
            temp = temp.next;
            prev = prev.next;
            deleteNode = deleteNode.next;
        }

        if (deleteNode == head) {
            head = head.next;
        } else if (deleteNode.next == null) {
            prev.next = null;
        } else {
            prev.next = prev.next.next;
        }

        return head;
    }
}
