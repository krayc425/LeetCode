class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard !nums.isEmpty && nums.count > 2 else {
            return -1
        }
        let n = nums.count
        var tmp: [Int] = [0]
        for i in 1..<n {
            tmp.append(tmp.last! + nums[i - 1])
        }
        var sum = tmp.last! + nums.last!
        for i in 0..<n {
            sum -= nums[i]
            if tmp[i] == sum {
                return i
            }
        }
        return -1
    }
}

Solution().pivotIndex([-1,-1,0,0,-1,-1])
