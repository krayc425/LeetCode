class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        let words = paragraph.lowercased().split { !$0.isLetter }.filter { !banned.contains(String($0)) }
        var res = ""
        var max = Int.min
        var times: [String: Int] = [:]
        for word in words.map({ String($0) }) {
            times[word] = times[word, default: 0] + 1
            if times[word]! > max {
                max = times[word]!
                res = word
            }
        }
        return res
    }
}
