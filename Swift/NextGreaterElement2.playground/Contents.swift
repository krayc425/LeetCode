class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack: [Int] = []
        let count = nums.count
        guard count > 0 else {
            return []
        }
        var res: [Int] = Array(repeating: -1, count: count)
        for i in (0..<2 * count - 1).reversed() {
            // 逐一比较是否比现在的这个小，小的话就不断弹出
            // stack里的元素一定是从底到顶降序（刚进去的最小）
            // 直到来了一个比栈顶元素大的，这是离他们最近的那个
            while !stack.isEmpty && nums[stack.last!] <= nums[i % count] {
                stack.removeLast()
            }
            if let last = stack.last {
                res[i % count] = nums[last]
            }
            stack.append(i % count)
        }
        return res
    }
}

print(Solution().nextGreaterElements([100,1,11,1,120,111,123,1,-1,-100]))
