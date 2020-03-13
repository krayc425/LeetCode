class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var map: [Character: Int] = [:]
        for (_, char) in s.enumerated() {
            if map[char] != nil {
                map[char]! += 1
            } else {
                map[char] = 1
            }
        }
        for (_, char) in t.enumerated() {
            if map[char] != nil {
                map[char]! -= 1
                if map[char]! == 0 {
                    map[char] = nil
                }
            } else {
                return char
            }
        }
        return Character("")
    }
}
