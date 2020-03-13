
// This is the interface that allows for creating nested lists.
// You should not implement it, or speculate about its implementation
class NestedInteger {
    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool

    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int

    // Set this NestedInteger to hold a single integer.
    public func setInteger(value: Int)

    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger)

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger]
}

class NestedIterator {
    
    var values: [Int] = []
    var index: Int = 0

    init(_ nestedList: [NestedInteger]) {
        nestedList.forEach { process($0) }
    }
    
    func next() -> Int {
        let val = values[index]
        index += 1
        return val
    }
    
    func hasNext() -> Bool {
        return index < values.count
    }
    
    func process(_ nestedInteger: NestedInteger) {
        if nestedInteger.isInteger() {
            values.append(nestedInteger.getInteger())
        } else {
            nestedInteger.getList().forEach { process($0) }
        }
    }
    
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
