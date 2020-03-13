class Solution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        let letters = licensePlate.lowercased().filter { $0.isLetter }
        var dict: [Character: Int] = [:]
        for letter in letters {
            dict[letter, default: 0] += 1
        }
        var candidate: String?
        for word in words {
            var temp = dict
            for character in word {
                if temp[character] != nil {
                    temp[character]! -= 1
                }
            }
            if temp.values.filter({ $0 > 0 }).isEmpty {
                if candidate == nil {
                    candidate = word
                } else {
                    candidate = candidate!.count <= word.count ? candidate : word
                }
            }
        }
        return candidate!
    }
}

//Solution().shortestCompletingWord("1s3 456", ["looks", "pest", "stew", "show"])
//Solution().shortestCompletingWord("1s3 PSt", ["step", "steps", "stripe", "stepple"])
Solution().shortestCompletingWord("GrC8950",
["measure","other","every","base","according","level","meeting","none","marriage","rest"])
