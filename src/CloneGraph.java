import DataStructure.Node;
import java.util.*;

public class CloneGraph {

    // old nodes - new nodes
    private Map<Node, Node> map = new HashMap<>();

    public Node cloneGraph(Node node) {
        if (node == null) {
            return null;
        }
        Node newNode = new Node(node.val, new ArrayList<Node>());
        map.put(node, newNode);
        for (Node n : node.children) {
            if (map.containsKey(n)) {
                newNode.children.add(map.get(n));
            } else {
                newNode.children.add(cloneGraph(n));
            }
        }
        return newNode;
    }

}