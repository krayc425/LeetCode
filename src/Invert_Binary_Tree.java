import DataStructure.TreeNode;

/**
 * Created by Kray on 2016/12/26.
 */
public class Invert_Binary_Tree {
    public TreeNode invertTree(TreeNode root) {
        if (root == null) {
            return root;
        }
        TreeNode t = root.left;
        root.left = root.right;
        root.right = t;
        if (root.left != null) {
            invertTree(root.left);
        }
        if (root.right != null) {
            invertTree(root.right);
        }
        return root;
    }
}
