class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty else {
            return []
        }
        var result: [[Int]] = []
        var nums = nums
        for i in 0...nums.count {
            var temp: [Int] = []
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
            temp.append(nums[i])
            process(&result, &temp, &nums, i + 1, n)
            temp.removeLast()
        }
    }
}

Solution().subsets([1,5,9])
