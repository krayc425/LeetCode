class RandomizedCollection {

    var list: [Int]
    var map: [Int: Set<Int>]

    /** Initialize your data structure here. */
    init() {
        list = []
        map = [:]
    }
    
    /** Inserts a value to the collection. Returns true if the collection did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        map[val, default: Set<Int>()].insert(list.count)
        list.append(val)
        return map[val]!.count == 1
    }
    
    /** Removes a value from the collection. Returns true if the collection contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if !map.keys.contains(val) {
            return false
        }
        let indexOfVal = map[val]!.removeFirst()
        if map[val]!.isEmpty {
            map[val] = nil
        }
        let last = list.removeLast()
        let lastIdx = list.count
        // 删掉的不是最后一个元素
        if lastIdx != indexOfVal {
            list[indexOfVal] = last
            map[last]!.remove(lastIdx)
            map[last]!.insert(indexOfVal)
        }
        return true
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return list.randomElement()!
    }
    
}


let obj = RandomizedCollection()
let ret_1: Bool = obj.insert(1)
let ret_2: Bool = obj.insert(1)
