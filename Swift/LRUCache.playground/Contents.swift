class LRUCache_TLE {
    
    var keys: [Int]
    var values: [Int]
    var count: Int

    init(_ capacity: Int) {
        self.count = capacity
        self.keys = []
        self.values = []
    }
    
    func get(_ key: Int) -> Int {
        if keys.contains(key) {
            let idx = keys.firstIndex(of: key)!
            let val = values[idx]
            keys.remove(at: idx)
            values.remove(at: idx)
            keys.append(key)
            values.append(val)
            print(keys)
            print(values)
            return val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if keys.contains(key) {
            let idx = keys.firstIndex(of: key)!
            keys.remove(at: idx)
            values.remove(at: idx)
            keys.append(key)
            values.append(value)
        } else {
            if keys.count == count {
                keys.removeFirst()
                values.removeFirst()
            }
            keys.append(key)
            values.append(value)
        }
        print(keys)
        print(values)
    }
    
}

//
//Your LRUCache object will be instantiated and called as such:
//let obj = LRUCache(2)
//obj.put(1, 1)
//obj.put(2, 2)
//obj.put(3, 3)
//let ret_1: Int = obj.get(2)
//obj.put(4, 4)
//

class ListNode {
    var key: Int
    var val: Int
    var prev: ListNode?
    var next: ListNode?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    
    var head: ListNode?
    var tail: ListNode?
    var map: [Int: ListNode] = [:]
    var capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            if node !== head {
                remove(node)
                addToHead(node)
            }
            return node.val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.val = value
            if node !== head {
                remove(node)
                addToHead(node)
            }
        } else {
            let node = ListNode(key, value)
            if map.count == capacity {
                map[tail!.key] = nil
                remove(tail!)
            }
            addToHead(node)
            map[key] = node
            if tail == nil {
                tail = node
            }
        }
    }
    
    private func remove(_ node: ListNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        if node === tail {
            tail = node.prev
        }
    }
    
    private func addToHead(_ node: ListNode) {
        node.next = head
        head?.prev = node
        head = node
    }
    
}
