class Solution {
    let alphabet: [Character] = Array("qwertyuiopasdfghjklzxcvbnm")
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else {
            return 0
        }
        var dict = Set(wordList)
        var beginSet = Set<String>()
        var visitedSet = Set<String>()
        var count = 1
        var found = false
        beginSet.insert(beginWord)
        // 把每个词都加到
        while !found && !beginSet.isEmpty {
            var nextSet = Set<String>()
            found = helper(beginSet, endWord, dict, &visitedSet, &nextSet)
            beginSet = nextSet
            count += 1
        }
        return found ? count : 0
    }
    
    func helper(_ beginSet: Set<String>, _ endWord: String, _ dict: Set<String>,
                _ visitedSet: inout Set<String>, _ nextSet: inout Set<String>) -> Bool {
        // 对每个beginSet里的词
        for word in beginSet {
            // 逐一替换word里每个位置的字母
            for i in 0..<word.count {
                var chars: [Character] = Array(word)
                for j in 0..<alphabet.count {
                    chars[i] = alphabet[j]
                    let newWord = String(chars)
                    // 是一个合法的词
                    if dict.contains(newWord) {
                        if newWord == endWord {
                            return true
                        }
                        // 如果已经判断过了，就不要再判断了，会增加路径长度
                        if !visitedSet.contains(newWord) {
                            nextSet.insert(newWord)
                            visitedSet.insert(newWord)
                        }
                    }
                }
            }
        }
        return false
    }
}
