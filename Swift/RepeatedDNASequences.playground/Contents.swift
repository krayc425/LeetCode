class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 10 else {
            return []
        }
        var string: String = ""
        var index = 0
        var map: [String: Int] = [:]
        for char in s {
            string.append(char)
            if index >= 9 {
                map[string, default: 0] += 1
                string.removeFirst()
            }
            index += 1
        }
        return [String](map.filter { $0.value > 1 }.keys)
    }
}

Solution().findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT")
