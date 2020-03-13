class Solution {
    
    var nums: [Int] = []

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var temp: [Int] = []
        var currNums = nums
        while temp.count < nums.count {
            let idx = Int.random(in: 0..<currNums.count)
            let num = currNums[idx]
            temp.append(num)
            currNums.remove(at: idx)
        }
        return temp
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
