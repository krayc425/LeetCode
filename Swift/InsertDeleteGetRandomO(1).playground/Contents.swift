class RandomizedSet {
    
    var list: [Int]
    var map: [Int: Int]

    /** Initialize your data structure here. */
    init() {
        list = []
        map = [:]
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if map.keys.contains(val) {
            return false
        }
        map[val] = list.count
        list.append(val)
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if !map.keys.contains(val) {
            return false
        }
        let indexOfVal = map[val]!
        let lastVal = list.last!
        map[lastVal] = indexOfVal
        map[val] = nil
        list[indexOfVal] = list.last!
        list.removeLast()
        return true
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return list.randomElement()!
    }
    
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
