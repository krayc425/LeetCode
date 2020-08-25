class WordDistance {
    
    var dict: [String: [Int]] = [:]

    init(_ words: [String]) {
        for i in 0..<words.count {
            let word = words[i]
            dict[word, default: []].append(i)
        }
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        let idx1 = dict[word1]!.sorted()
        let idx2 = dict[word2]!.sorted()
        var res = Int.max
        var i = 0
        var j = 0
        while i < idx1.count && j < idx2.count {
            res = min(res, abs(idx1[i] - idx2[j]))
            if idx1[i] < idx2[j] {
                i += 1
            } else {
                j += 1
            }
        }
        return res
    }

}

/**
 * Your WordDistance object will be instantiated and called as such:
 * let obj = WordDistance(words)
 * let ret_1: Int = obj.shortest(word1, word2)
 */
