class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result: Set<[Int]> = Set()
        var idxes: [Int] = Array(0..<nums.count)
        for permutation in permute(idxes) {
            result.insert(permutation.map { nums[$0] })
        }
        return Array(result)
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count == 1 {
            return [nums]
        } else {
            var temp: [[Int]] = []
            for i in 0..<nums.count {
                for result in permute(nums.filter { $0 != nums[i] }) {
                    temp.append([nums[i]] + result)
                }
            }
            return temp
        }
    }
    
    /****BackTrack****/
    
    func permuteUniqueBacktrack(_ nums: [Int]) -> [[Int]] {
        var numbers = nums.sorted()
        var temp = [Int]()
        var result = [[Int]]()
        permuteUniqueHelper(&numbers, &result, &temp)
        return result
    }
    
    func permuteUniqueHelper(_ nums: inout [Int], _ result: inout [[Int]] , _ temp: inout [Int]) {
        if nums.isEmpty {   // 已经把所有的数都排列过了的一种情况
            result.append(temp)
        }
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            temp.append(nums[i])
            nums.remove(at: i)
            permuteUniqueHelper(&nums, &result, &temp)
            nums.insert(temp.removeLast(), at: i)
        }
    }
}

Solution().permuteUnique([1,1,2])
