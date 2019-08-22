import DataStructure.ListNode;

public class Intersection_of_Two_Linked_Lists {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        int lenA = 0;
        int lenB = 0;
        if (headA == null || headB == null) {
            return null;
        }
        ListNode nodeA = headA;
        ListNode nodeB = headB;
        while (nodeA != null) {
            nodeA = nodeA.next;
            lenA++;
        }
        while (nodeB != null) {
            nodeB = nodeB.next;
            lenB++;
        }
        nodeA = headA;
        nodeB = headB;
        int diff = Math.abs(lenA - lenB);
        if (lenA > lenB) {
            while (diff > 0) {
                nodeA = nodeA.next;
                diff--;
            }
        } else {
            while (diff > 0) {
                nodeB = nodeB.next;
                diff--;
            }
        }
        while (nodeA != null && nodeB != null) {
            if (nodeA == nodeB) {
                return nodeA;
            } else {
                nodeA = nodeA.next;
                nodeB = nodeB.next;
            }
        }
        return null;
    }
}
