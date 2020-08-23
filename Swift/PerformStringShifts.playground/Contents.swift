class Solution {
    func stringShift(_ s: String, _ shift: [[Int]]) -> String {
        guard !s.isEmpty else {
            return ""
        }
        guard !shift.isEmpty else {
            return s
        }
        var netShift = 0
        for pair in shift {
            if pair[0] == 0 {
                netShift -= pair[1]
            } else {
                netShift += pair[1]
            }
        }
        if netShift == 0 {
            return s
        }
        let sCount = s.count
        let doubleStringArray = Array(s + s)
        netShift %= sCount
        if netShift > 0 {
            return String(doubleStringArray[(sCount - netShift)..<(2 * sCount - netShift)])
        } else {
            return String(doubleStringArray[abs(netShift)..<(sCount + abs(netShift))])
        }
    }
}

Solution().stringShift("wpdhhcj", [[0,7],[1,7],[1,0],[1,3],[0,3],[0,6],[1,2]])
Solution().stringShift("abcdefg", [[1,1],[1,1],[0,2],[1,3]])
