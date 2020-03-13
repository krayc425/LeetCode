class Solution {
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else {
            return []
        }
        let newNums = nums.sorted().reversed()
        var dict: [Int: String] = [:]
        var i = 0
        for num in newNums {
            if i == 0 {
                dict[num] = "Gold Medal"
            } else if i == 1 {
                dict[num] = "Silver Medal"
            } else if i == 2 {
                dict[num] = "Bronze Medal"
            } else {
                dict[num] = String(i + 1)
            }
            i += 1
        }
        return nums.map { dict[$0] ?? "0" }
    }
}

Solution().findRelativeRanks([1,5,4,2,3])
