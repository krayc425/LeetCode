import DataStructure.Node;

import java.util.*;

public class NaryTreeLevelOrderTraversal {
    public List<List<Integer>> levelOrder(Node root) {
        List<List<Integer>> result = new ArrayList<>();
        Queue<Node> queue = new LinkedList<>();
        if (root == null) {
            return result;
        } else {
            queue.add(root);
            while (!queue.isEmpty()) {
                int queueCnt = queue.size();
                int currentCnt = 0;
                List<Integer> temp = new ArrayList<>();
                while (currentCnt < queueCnt) {
                    Node first = queue.poll();
                    temp.add(first.val);
                    currentCnt++;
                    queue.addAll(first.children);
                }
                result.add(temp);
            }
        }
        return result;
    }

    public static void main(String[] args) {

    }
}
