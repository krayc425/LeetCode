class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var result = 0
        // g: children
        // s: cookies
        guard !g.isEmpty && !s.isEmpty else {
            return result
        }
        var g = g.sorted()
        var s = s.sorted()
        var gi = 0
        var si = 0
        while gi < g.count && si < s.count {
            if g[gi] <= s[si] {
                result += 1
                gi += 1
            }
            si += 1
        }
        return result
    }
}

Solution().findContentChildren([1,5,5,7,9], [0,2,4,6,8,10])
