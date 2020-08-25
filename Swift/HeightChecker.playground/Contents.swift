class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        return heights.sorted().enumerated().reduce(0) { (res, curr) in
            return res + (heights[curr.offset] != curr.element ? 1 : 0)
        }
    }
}

Solution().heightChecker([1,1,4,2,1,3])
