class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        var map: [Character: Int] = [:]
        for char in tiles {
            map[char] = map[char, default: 0] + 1
        }
        var res = 0
        process(map, 0, &res)
        return res
    }
    
    func process(_ map: [Character: Int], _ length: Int, _ res: inout Int) {
        if length > 0 {
            res += 1
        }
        for (char, times) in map where times > 0 {
            var newMap = map
            newMap[char]! -= 1
            process(newMap, length + 1, &res)
        }
    }
}

Solution().numTilePossibilities("AAABBC")
