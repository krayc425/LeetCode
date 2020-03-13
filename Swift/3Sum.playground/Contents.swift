class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        let nums = nums.sorted()
        var result: Set<[Int]> = Set()
        for i in 0..<nums.count - 2 {
            var j = i + 1
            var k = nums.count - 1
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum > 0 {
                    if nums[k - 1] != nums[k] {
                        k -= 1
                    } else {
                        while k > j && nums[k - 1] == nums[k] {
                            k -= 1
                        }
                    }
                } else if sum <= 0 {
                    if sum == 0 {
                        result.insert([nums[i], nums[j], nums[k]].sorted())
                    }
                    if nums[j + 1] != nums[j] {
                        j += 1
                    } else {
                        while j < k && nums[j + 1] == nums[j] {
                            j += 1
                        }
                    }
                }
            }
        }
        return Array(result)
    }
}

Solution().threeSum([-1, 0, 1, 2, -1, -4])
