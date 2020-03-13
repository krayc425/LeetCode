class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k > 0 else {
            return
        }
        var newK = k
        while newK > nums.count {
            newK -= nums.count
        }
        let count = nums.count
        nums.append(contentsOf: nums)
        nums.removeFirst(count - newK)
        nums.removeLast(newK)
    }
    
    func rotate2(_ nums: inout [Int], _ k: Int) {
        var newK = k
        while newK >= nums.count {
            newK -= nums.count
        }
        if newK == 0 {
            return
        }
        nums[0..<nums.count-newK].reverse()
        nums[(nums.count-newK)...].reverse()
        nums.reverse()
    }
}

var array = [1,2,3,4,5,6,7]
var array2 = [1,2,3,4,5,6,7]
Solution().rotate(&array, 3)
Solution().rotate2(&array2, 3)
