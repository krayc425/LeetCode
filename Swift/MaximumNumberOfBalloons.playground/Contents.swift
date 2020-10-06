class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        let balloon = "balon"
        var dict: [Character: Int] = ["b": 0,"a": 0, "l": 0, "o": 0, "n": 0]
        for char in text {
            if balloon.contains(char) {
                dict[char]! += 1
            }
        }
        var res = Int.max
        for (k, v) in dict {
            if "lo".contains(k) {
                res = min(res, v / 2)
            } else {
                res = min(res, v)
            }
        }
        return res
    }
}

Solution().maxNumberOfBalloons("loonbalxballpoon")
