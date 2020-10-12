class Solution {
    func pyramidTransition(_ bottom: String, _ allowed: [String]) -> Bool {
        var dict: [String: [Character]] = [:]
        for allow in allowed {
            dict[String(allow.prefix(2)), default: []].append(allow.last!)
        }
        var curr = ""
        var prev = bottom
        return dfs(&curr, &prev, 0, dict)
    }
    
    func dfs(_ curr: inout String, _ prev: inout String, _ index: Int, _ dict: [String: [Character]]) -> Bool {
        if prev.count == 1 {
            return true
        }
        if index == prev.count - 1 {
            var new = ""
            return dfs(&new, &curr, 0, dict)
        } else {
            if let candidates = dict[String(Array(prev)[index..<index + 2])] {
                for candidate in candidates {
                    curr.append(candidate)
                    if dfs(&curr, &prev, index + 1, dict) {
                        return true
                    }
                    curr.removeLast()
                }
            }
            return false
        }
    }
}
