package DataStructure;

/**
 * Created by Kray on 2016/12/26.
 */

public class ListNode {
    public int val;
    public ListNode next;

    public ListNode(int x) {
        val = x;
    }

    public void print() {
        ListNode node = this;
        while (node != null) {
            System.out.print(node.val + (node.next == null ? "" : " -> "));
            node = node.next;
        }
        System.out.println();
    }
}