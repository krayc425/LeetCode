class Solution {
    func shortestWordDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var indexes1: [Int] = []
        var indexes2: [Int] = []
        for i in 0..<words.count {
            let word = words[i]
            if word1 == word {
                indexes1.append(i)
            }
            if word2 == word {
                indexes2.append(i)
            }
        }
        var res = Int.max
        for i in indexes1 {
            for j in indexes2 {
                if i != j {
                    res = min(res, abs(i - j))
                }
            }
        }
        return res
    }
}
