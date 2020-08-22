class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        guard !arr1.isEmpty else {
            return []
        }
        guard !arr2.isEmpty else {
            return arr1.sorted()
        }
        var dict: [Int: Int] = [:]
        var remaining: [Int] = []
        for num in arr1 {
            if arr2.contains(num) {
                dict[num, default: 0] += 1
            } else {
                remaining.append(num)
            }
        }
        var res: [Int] = []
        for num in arr2 {
            res.append(contentsOf: Array(repeating: num, count: dict[num]!))
        }
        res.append(contentsOf: remaining.sorted())
        return res
    }
}

Solution().relativeSortArray([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6])
