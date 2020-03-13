class Node {
    
    var key: Int
    var val: Int
    var next: Node?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
    
    static func ==(_ lhs: Node, _ rhs: Node) -> Bool {
        return lhs.val == rhs.val
    }
    
}

class MyHashMap {

    var array: [Node]
    
    /** Initialize your data structure here. */
    init() {
        array = Array(repeating: Node(-1, -1), count: 1000)
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        let idx = hash(key)
        let prev = findPrev(array[idx], key)
        if let next = prev.next {
            next.val = value
        } else {
            prev.next = Node(key, value)
            print(prev.val)
            print(prev.next?.val)
        }
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        let idx = hash(key)
        let prev = findPrev(array[idx], key)
        print(prev.val)
        print(prev.next?.val)
        if let next = prev.next {
            return next.val
        } else {
            return -1
        }
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let idx = hash(key)
        if array[idx] == Node(-1, -1) {
            return
        }
        let prev = findPrev(array[idx], key)
        if let next = prev.next {
            prev.next = next.next
        }
    }
    
    private func hash(_ val: Int) -> Int {
        return abs(val.hashValue % array.count)
    }
    
    private func findPrev(_ start: Node, _ key: Int) -> Node {
        var node = start
        while let next = node.next {
            if next.key == key {
                return node
            }
            node = next
        }
        return node
    }
    
}


let obj = MyHashMap()
obj.put(2, 1)
let ret_2: Int = obj.get(2)
obj.remove(2)

