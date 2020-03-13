class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var cand: Int = 0
        var time: Int = 0
        for i in 0..<nums.count {
            if time == 0 {
                cand = nums[i]
                time = 1
            } else {
                if nums[i] == cand {
                    time += 1
                } else {
                    time -= 1
                }
            }
        }
        time = 0
        for i in 0..<nums.count {
            if nums[i] == cand {
                time += 1
            }
        }
        if time > Int(nums.count / 2) {
            return cand
        } else {
            return 0
        }
    }
}

Solution().majorityElement([1,1,1,1,2,2,1,2,2,1,1,2,1])
