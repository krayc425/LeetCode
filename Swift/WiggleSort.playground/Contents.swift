class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        for i in 0..<nums.count - 1 {
            if (i % 2 == 0) == (nums[i] > nums[i + 1]) {
                nums.swapAt(i, i + 1)
            }
        }
    }
}

var arr = [3,5,2,1,6,4]
Solution().wiggleSort(&arr)
