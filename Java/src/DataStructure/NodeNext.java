package DataStructure;

public class NodeNext {
    public int val;
    public NodeNext left;
    public NodeNext right;
    public NodeNext next;

    public NodeNext() {
    }

    public NodeNext(int _val, NodeNext _left, NodeNext _right, NodeNext _next) {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
}
