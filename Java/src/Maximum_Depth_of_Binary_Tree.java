import DataStructure.TreeNode;

/**
 * Created by Kray on 2016/12/30.
 */
public class Maximum_Depth_of_Binary_Tree {

    public static void main(String[] args) {
        Maximum_Depth_of_Binary_Tree maximum_depth_of_binary_tree = new Maximum_Depth_of_Binary_Tree();


        TreeNode t1 = new TreeNode(1);
        TreeNode t2 = new TreeNode(2);
        TreeNode t3 = new TreeNode(3);
        TreeNode t4 = new TreeNode(4);
        TreeNode t5 = new TreeNode(5);
        t1.left = t2;
        t1.right = t3;
        t2.left = t4;
        t4.right = t5;


        System.out.println(maximum_depth_of_binary_tree.maxDepth(t1));
    }

    public int maxDepth(TreeNode root) {
        if (root == null) {
            return 0;
        } else {
            return 1 + max(maxDepth(root.left), maxDepth(root.right));
        }
    }

    private int max(int i, int j) {
        return i >= j ? i : j;
    }
}
