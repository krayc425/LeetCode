class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        var res: [Int] = []
        var tmp: [Int] = []
        for i in 0..<nums.count {
            while let last = tmp.last, nums[last] < nums[i] {
                tmp.removeLast()
            }
            tmp.append(i)
            if i >= k - 1 {
                if let first = tmp.first, i == k + first {
                    tmp.removeFirst()
                }
                res.append(nums[tmp.first!])
            }
        }
        return res
    }
}
