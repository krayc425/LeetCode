class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map: [Int: Int] = [:]
        for num in arr {
            map[num] = map[num, default: 0] + 1
        }
        return map.keys.count == Set(map.values).count
    }
}
