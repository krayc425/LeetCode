import DataStructure.TreeNode;

class LowestCommonAncestorOfBinarySearchTree {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        int min = Math.min(p.val, q.val);
        int max = Math.max(p.val, q.val);
        return process(root, min, max);
    }

    private TreeNode process(TreeNode node, int min, int max) {
        if (min <= node.val && node.val <= max) {
            return node;
        }
        if (min > node.val) {
            return process(node.right, min, max);
        }
        return process(node.left, min, max);
    }
}