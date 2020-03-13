import DataStructure.TreeNode;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kray on 2017/1/15.
 */
public class Binary_Tree_Paths {

    public static void main(String[] args) {
        TreeNode t1 = new TreeNode(1);
        TreeNode t2 = new TreeNode(2);
        TreeNode t3 = new TreeNode(3);
        TreeNode t4 = new TreeNode(4);
        TreeNode t5 = new TreeNode(5);
        t1.left = t2;
        t1.right = t3;
//        t2.left = t4;
        t2.right = t5;
        Binary_Tree_Paths paths = new Binary_Tree_Paths();
        ArrayList<String> strings = (ArrayList<String>) paths.binaryTreePaths(t1);
        for (String s : strings) {
            System.out.println(s);
        }
    }

    public List<String> binaryTreePaths(TreeNode root) {
        ArrayList<String> strings = new ArrayList<>();
        if (root == null) {
            return strings;
        } else if (root.left == null && root.right == null) {
            strings.add(root.val + "");
        } else {
            if (root.left != null) {
                for (String s : binaryTreePaths(root.left)) {
                    strings.add(root.val + "->" + s);
                }
            }
            if (root.right != null) {
                for (String s : binaryTreePaths(root.right)) {
                    strings.add(root.val + "->" + s);
                }
            }
        }
        return strings;
    }

}
