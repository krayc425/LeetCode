class DoubleListNode:

    def __init__(self, key, val: int):
        self.key = key
        self.val = val
        self.prev = None
        self.next = None


class LRUCache:

    def __init__(self, capacity: int):
        self.head = None
        self.tail = None
        self.map = {}
        self.capacity = capacity

    def get(self, key: int) -> int:
        if key in self.map:
            node = self.map[key]
            if node is not self.head:
                self.remove_node(node)
                self.add_to_head(node)
            return node.val
        else:
            return -1

    def put(self, key: int, value: int) -> None:
        if key in self.map:
            node = self.map[key]
            if node is not self.head:
                self.remove_node(node)
                self.add_to_head(node)
            node.val = value
        else:
            if len(self.map) == self.capacity:
                del self.map[self.tail.key]
                self.remove_node(self.tail)
            node = DoubleListNode(key=key, val=value)
            self.add_to_head(node)
            self.map[key] = node
            if self.tail is None:
                self.tail = node

    def remove_node(self, node: DoubleListNode):
        if node.prev:
            node.prev.next = node.next
        if node.next:
            node.next.prev = node.prev
        if node is self.tail:
            self.tail = node.prev

    def add_to_head(self, node: DoubleListNode):
        if self.head is None:
            self.head = node
        else:
            node.next = self.head
            self.head.prev = node
            self.head = node

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)
