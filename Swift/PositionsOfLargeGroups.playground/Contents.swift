class Solution {
    func largeGroupPositions(_ S: String) -> [[Int]] {
        guard !S.isEmpty else {
            return []
        }
        var res: [[Int]] = []
        var leftIdx = 0
        var rightIdx = 1
        let charArray = Array(S)
        var currChar: Character = charArray.first!
        while rightIdx < charArray.count {
            if charArray[rightIdx] != currChar {
                if rightIdx - leftIdx >= 3 {
                    res.append([leftIdx, rightIdx - 1])
                }
                currChar = charArray[rightIdx]
                leftIdx = rightIdx
            }
            rightIdx += 1
        }
        if rightIdx - leftIdx >= 3 {
            res.append([leftIdx, rightIdx - 1])
        }
        return res
    }
}

Solution().largeGroupPositions("abc")
Solution().largeGroupPositions("aaa")
Solution().largeGroupPositions("abbxxxxzzy")
Solution().largeGroupPositions("abcdddeeeeaabbbcd")
