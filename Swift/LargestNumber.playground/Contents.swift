class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        guard !nums.isEmpty else {
            return ""
        }
        var strs = nums.map { String($0) }
        strs.sort { (s1, s2) -> Bool in
            return s1 + s2 > s2 + s1
        }
        return Int(strs[0]) == 0 ? "0" : strs.joined()
    }
}
