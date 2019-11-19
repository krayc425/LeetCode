import DataStructure.NodeNext;

public class PopulatingNextRightPointersInEachNode {

    public static void main(String[] args) {

    }

    public NodeNext connect(NodeNext root) {
        if (root == null) {
            return null;
        }
        NodeNext prev = root;
        NodeNext curr;
        while (prev != null) {
            curr = prev;
            while (curr != null) {
                if (curr.left != null) {
                    curr.left.next = curr.right;
                }
                if (curr.next != null) {
                    if (curr.right != null) {
                        curr.right.next = curr.next.left;
                    }
                }
                curr = curr.next;
            }
            prev = prev.left;
        }
        return root;
    }

}
