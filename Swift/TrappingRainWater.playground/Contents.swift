class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count >= 3 else {
            return 0
        }
        var leftMax: [Int] = [height.first!]
        for i in 1..<height.count {
            leftMax.append(max(leftMax.last!, height[i]))
        }
        var rightMax: [Int] = [height.last!]
        for i in (0..<height.count - 1).reversed() {
            rightMax.insert(max(rightMax.first!, height[i]), at: 0)
        }
        var res: Int = 0
        for i in 1..<height.count - 1 {
            res += max(min(leftMax[i - 1], rightMax[i + 1]) - height[i], 0)
        }
        return res
    }
}

Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1])
