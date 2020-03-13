import DataStructure.TreeNode;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

class Codec {

    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        if (root == null) {
            return "X.";
        }
        return root.val + "." + serialize(root.left) + serialize(root.right);
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        String[] nodeVals = data.split("\\.");
        Queue<String> nodeValList = new LinkedList<>(Arrays.asList(nodeVals));
        return process(nodeValList);
    }

    private TreeNode process(Queue<String> list) {
        String nodeVal = list.poll();
        if (nodeVal == null || nodeVal.equals("X")) {
            return null;
        }
        TreeNode node = new TreeNode(Integer.parseInt(nodeVal));
        node.left = process(list);
        node.right = process(list);
        return node;
    }

}

public class SerializeAndDeserializeBinaryTree {
    public static void main(String[] args) {
        TreeNode node1 = new TreeNode(1);
        TreeNode node2 = new TreeNode(2);
        TreeNode node3 = new TreeNode(3);
        TreeNode node4 = new TreeNode(4);
        TreeNode node5 = new TreeNode(5);
        node1.left = node2;
        node1.right = node3;
        node2.left = node4;
        node2.right = node5;
        Codec codec = new Codec();
        System.out.println(codec.serialize(node1));
    }
}
