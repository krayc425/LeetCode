class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict: [Character: Int] = [:]
        for char in order {
            dict[char] = dict.count
        }
        for i in 0..<words.count - 1 {
            let word1 = Array(words[i])
            let word2 = Array(words[i + 1])
            var decided = false
            for j in 0..<min(word1.count, word2.count) {
                if dict[word1[j]]! < dict[word2[j]]! {
                    decided = true
                    break
                } else if dict[word1[j]]! == dict[word2[j]]! {
                    continue
                } else {
                    return false
                }
            }
            if !decided && word1.count > word2.count {
                return false
            }
        }
        return true
    }
}

Solution().isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")
Solution().isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")
Solution().isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")
Solution().isAlienSorted(["kuvp","q"], "ngxlkthsjuoqcpavbfdermiywz")
