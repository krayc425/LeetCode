class Solution {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var index1 = -1
        var index2 = -1
        var res = Int.max
        for i in 0..<words.count {
            if words[i] == word1 {
                index1 = i
            } else if words[i] == word2 {
                index2 = i
            }
            if index1 != -1 && index2 != -1 {
                res = min(res, abs(index2 - index1))
            }
        }
        return res
    }
}
