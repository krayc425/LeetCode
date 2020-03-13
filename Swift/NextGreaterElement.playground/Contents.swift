class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        var stack: [Int] = []
        for num in nums2 {
            // 逐一比较是否比现在的这个小，小的话就不断弹出
            // stack里的元素一定是从底到顶降序（刚进去的最小）
            // 直到来了一个比栈顶元素大的，这是离他们最近的那个
            while let last = stack.last, last < num {
                dict[stack.removeLast()] = num
            }
            stack.append(num)
        }
        return nums1.map { dict[$0] ?? -1 }
    }
}

Solution().nextGreaterElement([4,1,2], [1,3,4,2,7])
