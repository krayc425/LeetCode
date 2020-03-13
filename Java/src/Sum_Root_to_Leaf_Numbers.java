import DataStructure.TreeNode;

/**
 * Created by Kray on 2016/12/26.
 */
public class Sum_Root_to_Leaf_Numbers {

    public static void main(String[] args) {
        TreeNode t1 = new TreeNode(1);
        TreeNode t2 = new TreeNode(2);
        TreeNode t3 = new TreeNode(3);
        TreeNode t4 = new TreeNode(4);
        TreeNode t5 = new TreeNode(5);
        t1.left = t2;
        t1.right = t3;
        t2.left = t4;
        t2.right = t5;
        Sum_Root_to_Leaf_Numbers sum_root_to_leaf_numbers = new Sum_Root_to_Leaf_Numbers();
        System.out.println(sum_root_to_leaf_numbers.sumNumbers(t1));
        System.out.println(sum_root_to_leaf_numbers.sumNumbers(t2));
        System.out.println(sum_root_to_leaf_numbers.sumNumbers(t3));
        System.out.println(sum_root_to_leaf_numbers.sumNumbers(t4));
        System.out.println(sum_root_to_leaf_numbers.sumNumbers(t5));
    }

    public int sumNumbers(TreeNode root) {
        return sumNumbersWithUpperValue(root, 0);
    }

    public int sumNumbersWithUpperValue(TreeNode root, int i) {
        if (root == null) {
            return 0;
        }
        if (root.left == null && root.right == null) {
            return root.val + i * 10;   //i 是每次上一层遗留下来的值, i * 10 以后和这层的根节点作相加
        }
        return sumNumbersWithUpperValue(root.left, root.val + i * 10) + sumNumbersWithUpperValue(root.right, root.val + i * 10);
    }
}
