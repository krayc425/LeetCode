class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var res = 0
        var stack: [Int] = [-1]   // monotomous increasing stack
        for (idx, height) in heights.enumerated() {
            while let last = stack.last, last != -1, heights[last] >= height {
                res = max(res, heights[stack.removeLast()] * (idx - stack.last! - 1))
            }
            stack.append(idx)
        }
        while let last = stack.last, last != -1 {
            res = max(res, heights[stack.removeLast()] * (heights.count - stack.last! - 1))
        }
        return res
    }
}
