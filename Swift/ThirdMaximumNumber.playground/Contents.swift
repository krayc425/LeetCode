class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var result: [Int] = [Int.min, Int.min, Int.min, Int.min]
        for i in 0..<nums.count {
            let num = nums[i]
            if result.contains(num) {
                continue
            }
            var idx = 1
            result[0] = num
            while idx <= 3 {
                if num > result[idx] {
                    result.swapAt(idx - 1, idx)
                }
                idx += 1
            }
        }
        if result[1] == Int.min {
            return result.max()!
        } else {
            return result[1]
        }
    }
}

Solution().thirdMax([2,2,3,1])
