class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var flag = false
        var min = Int.max
        var minIdx = -1
        for i in (1..<nums.count).reversed() {
            if nums[i - 1] < nums[i] {
                for j in i..<nums.count {
                    if nums[j] > nums[i - 1] && nums[j] < min {
                        min = nums[j]
                        minIdx = j
                    }
                }
                nums.swapAt(minIdx, i - 1)
                nums[i...].sort()
                flag = true
                break
            }
        }
        if !flag {
            nums.sort()
        }
    }
}

var arr = [1,5,1]
Solution().nextPermutation(&arr)
