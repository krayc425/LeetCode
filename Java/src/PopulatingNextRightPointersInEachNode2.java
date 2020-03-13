import DataStructure.NodeNext;

public class PopulatingNextRightPointersInEachNode2 {

    public static void main(String[] args) {

    }

    public NodeNext connect(NodeNext root) {
        if (root == null) {
            return null;
        }

        NodeNext t = root;

        while (t != null) {
            NodeNext dummy = new NodeNext();
            NodeNext current = dummy;
            while (t != null) {
                if (t.left != null) {
                    current.next = t.left;
                    current = current.next;
                }
                if (t.right != null) {
                    current.next = t.right;
                    current = current.next;
                }
                t = t.next;
            }
            t = dummy.next;
        }

        return root;
    }

}
