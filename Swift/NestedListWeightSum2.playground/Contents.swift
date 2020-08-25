class Solution {
    
    var maxDepth: Int = 0
    var depthDict: [Int: [Int]] = [:]
    
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        process(nestedList, 1)
        return getSum()
    }
    
    func process(_ nestedList: [NestedInteger], _ depth: Int) {
        maxDepth = max(maxDepth, depth)
        for list in nestedList {
            if list.isInteger() {
                depthDict[depth, default: []].append(list.getInteger())
            } else {
                process(list.getList(), depth + 1)
            }
        }
    }
    
    func getSum() -> Int {
        var sum = 0
        for d in 1...maxDepth {
            if let dict = depthDict[d] {
                for num in dict {
                    sum += num * (maxDepth - (d - 1))
                }
            }
        }
        return sum
    }
    
}
