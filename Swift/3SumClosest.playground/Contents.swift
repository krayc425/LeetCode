class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        var result = Int.max
        let newNums = nums.sorted()
        let targets = newNums.map { $0 - target }
        for i in 0..<newNums.count - 2 {
            var j = i + 1
            var k = newNums.count - 1
            while j < k {
                let sum = newNums[i] + newNums[j] + targets[k]
                if sum > 0 {
                    if targets[k - 1] != targets[k] {
                        k -= 1
                    } else {
                        while k > j && targets[k - 1] == targets[k] {
                            k -= 1
                        }
                    }
                } else if sum < 0 {
                    if newNums[j + 1] != newNums[j] {
                        j += 1
                    } else {
                        while j < k && newNums[j + 1] == newNums[j] {
                            j += 1
                        }
                    }
                } else {
                    return target
                }
                if abs(sum) < abs(result) {
                    result = sum
                }
            }
        }
        return result + target
    }
}

Solution().threeSumClosest([0,1,2], 3)
