class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var temp: [Int] = []
        guard !nums.isEmpty else {
            return []
        }
        var nums = nums.sorted()
        for i in 0...nums.count {
            temp = []
            process(&result, &temp, &nums, 0, i)
        }
        return result
    }
    
    func process(_ result: inout [[Int]], _ temp: inout [Int], _ nums: inout [Int], _ start: Int, _ n: Int) {
        if temp.count == n {
            result.append(temp)
            return
        }
        if start == nums.count {
            return
        }
        for i in start..<nums.count {
            if i == start || nums[i] != nums[i - 1] {
                temp.append(nums[i])
                process(&result, &temp, &nums, i + 1, n)
                temp.removeLast()
            }
        }
    }
}
