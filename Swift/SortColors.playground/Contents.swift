class Solution {
    func sortColors(_ nums: inout [Int]) {
        guard !nums.isEmpty else {
            return
        }
        var head = 0
        var tail = nums.count - 1
        for i in 0..<nums.count {
            while nums[i] == 2 && i < tail {
                nums.swapAt(i, tail)
                tail -= 1
            }
            while nums[i] == 0 && head < i {
                nums.swapAt(i, head)
                head += 1
            }
        }
    }
}

var arr = [0,1,2,1,1,1,0,0,0,2,2,0,1,0,2]
Solution().sortColors(&arr)
