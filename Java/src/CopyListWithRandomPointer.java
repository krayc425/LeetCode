import DataStructure.RandomNode;

import java.util.HashMap;

public class CopyListWithRandomPointer {
    public RandomNode copyRandomList(RandomNode head) {
        RandomNode dummyHead = new RandomNode(0, null, null);
        RandomNode curr = dummyHead;
        RandomNode temp = head;
        HashMap<RandomNode, RandomNode> map = new HashMap<>();
        while (temp != null) {
            if (!map.containsKey(temp)) {
                map.put(temp, new RandomNode(temp.val, null, null));
            }
            curr.next = map.get(temp);
            curr = curr.next;
            temp = temp.next;
        }
        dummyHead = dummyHead.next;
        curr = dummyHead;
        temp = head;
        while (temp != null) {
            curr.random = map.get(temp.random);
            temp = temp.next;
            curr = curr.next;
        }
        return dummyHead;
    }
}
