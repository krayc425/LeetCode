class Solution {
    func frequencySort(_ s: String) -> String {
        var dict: [Character: Int] = [:]
        for char in Array(s) {
            dict[char, default: 0] += 1
        }
        let sorted = dict.sorted { (d1, d2) -> Bool in
            d1.value > d2.value
        }
        var res = ""
        for (key, val) in sorted {
            res += String(repeating: key, count: val)
        }
        return res
    }
}

Solution().frequencySort("Aabb")
