class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        var dict: [Int: [Int]] = [:]
        for i in 0..<nums.count {
            dict[nums[i], default: []].append(i)
        }
        let numsSorted: [Int] = nums.sorted().reversed()
        let numsSet: [Int] = Set(numsSorted).sorted().reversed()
        var index = 0
        var res: [Int] = Array(repeating: 0, count: nums.count)
        for num in numsSet {
            while index < numsSorted.count - 1 && numsSorted[index + 1] == num {
                index += 1
            }
            for indexes in dict[num]! {
                res[indexes] = nums.count - 1 - index
            }
            index += 1
        }
        return res
    }
}

Solution().smallerNumbersThanCurrent([6,5,4,8])
