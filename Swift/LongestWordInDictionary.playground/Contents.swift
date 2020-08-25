class Solution {
    func longestWord(_ words: [String]) -> String {
        guard !words.isEmpty else {
            return ""
        }
        let wordSet = Set(words)
        var res = ""
        for word in words {
            if word.count > res.count || (word.count == res.count && word < res) {
                var allPrefixesIncluded = true
                for i in 1..<word.count {
                    if !wordSet.contains(String(word.prefix(i))) {
                        allPrefixesIncluded = false
                        break
                    }
                }
                if allPrefixesIncluded {
                    res = word
                }
            }
        }
        return res
    }
}

Solution().longestWord(["a", "banana", "app", "appl", "ap", "apply", "apple"])
Solution().longestWord(["m","mo","moc","moch","mocha","l","la","lat","latt","latte","c","ca","cat"])
