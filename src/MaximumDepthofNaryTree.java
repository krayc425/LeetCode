import DataStructure.Node;

public class MaximumDepthofNaryTree {
    private int result = 0;

    public int maxDepth(Node root) {
        if (root == null) {
            return result;
        }
        process(root, 1);
        return result;
    }

    private void process(Node root, int depth) {
        if (root == null) {
            return;
        }
        result = Math.max(result, depth);
        for (Node node : root.children) {
            process(node, depth + 1);
        }
    }
}
