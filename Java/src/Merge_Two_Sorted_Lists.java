import DataStructure.ListNode;

/**
 * Created by Kray on 2017/3/16.
 */
public class Merge_Two_Sorted_Lists {

    public static void main(String[] args) {
        Merge_Two_Sorted_Lists merge_two_sorted_lists = new Merge_Two_Sorted_Lists();
        ListNode node1 = new ListNode(1);
        ListNode node2 = new ListNode(3);
        ListNode node3 = new ListNode(5);
//        ListNode node4 = new ListNode(7);
        node1.next = node2;
        node2.next = node3;
//        node3.next = node4;
        node1.print();

        ListNode node5 = new ListNode(0);
//        ListNode node6 = new ListNode(3);
//        ListNode node7 = new ListNode(4);
//        ListNode node8 = new ListNode(5);
//        node5.next = node6;
//        node6.next = node7;
//        node7.next = node8;
        node5.print();

        System.out.println();

        merge_two_sorted_lists.mergeTwoLists(node1, node5).print();
    }

    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        if (l1 == null) {
            return l2;
        }
        if (l2 == null) {
            return l1;
        }

        if (l1.next == null || l2.next != null) {
            ListNode listNode = new ListNode(l1.val < l2.val ? l1.val : l2.val);
            listNode.next = new ListNode(l1.val < l2.val ? l2.val : l1.val);
            return listNode;
        }

        ListNode node = new ListNode(0);
        ListNode head = node;
        ListNode head1 = l1;
        ListNode head2 = l2;

        while (head1 != null && head2 != null) {
            node.next = new ListNode(compareInt(head1.val, head2.val));
            node = node.next;
            if (node.val == head1.val) {
                head1 = head1.next;
            } else {
                head2 = head2.next;
            }
        }
        if (head1 == null) {
            node.next = head2;
        }
        if (head2 == null) {
            node.next = head1;
        }
        return head.next;
    }

    private int compareInt(int i, int j) {
        return i <= j ? i : j;
    }

}
