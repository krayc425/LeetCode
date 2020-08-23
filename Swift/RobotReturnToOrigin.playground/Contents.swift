class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var dict: [Character: Int] = [:]
        for char in moves {
            dict[char, default: 0] += 1
        }
        return (dict["U"] ?? 0) == (dict["D"] ?? 0) && (dict["L"] ?? 0) == (dict["R"] ?? 0)
    }
}
