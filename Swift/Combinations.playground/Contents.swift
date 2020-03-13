class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var nums: [Int] = Array(1...n)
        var temp: [Int] = []
        var result: [[Int]] = []
        process(&nums, &temp, &result, k)
        return result
    }
    
    func process(_ nums: inout [Int], _ temp: inout [Int], _ result: inout [[Int]], _ k: Int) {
        if k == 0 {
            result.append(temp)
            return
        }
        for i in 0..<nums.count {
            if let last = temp.last, nums[i] < last {
                continue
            }
            temp.append(nums[i])
            nums.remove(at: i)
            process(&nums, &temp, &result, k - 1)
            nums.insert(temp.removeLast(), at: i)
        }
    }
}

Solution().combine(5, 2)
