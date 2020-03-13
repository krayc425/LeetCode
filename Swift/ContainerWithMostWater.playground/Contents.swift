class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var result = Int.min
        var start = 0
        var end = height.count - 1
        while start < end {
            result = max(result, min(height[start], height[end]) * (end - start))
            if height[start] < height[end] {
                start += 1
            } else {
                end -= 1
            }
        }
        return result
    }
}

Solution().maxArea([3,2,1,3])
