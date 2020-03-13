class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var map: [Character: Int] = [:]
        for char in s {
            map[char] = 0
        }
        for char in t {
            map[char, default: 0] += 1
        }
        
        var start = 0
        var end = 0
        var minLength = Int.max
        var minStart = 0
        var missingCount = t.count
        let s = Array(s)
        
        while end < s.count {
            let char = s[end]
            if let val = map[char], val > 0 {
                missingCount -= 1
            }
            map[char]! -= 1     // 用掉一个字母，减去1
            // 全部找到的一个子String
            while missingCount == 0 {
                if end - start + 1 < minLength {
                    minLength = end - start + 1
                    minStart = start
                }
                let head = s[start]
                if let val = map[head], val >= 0 {      // 收缩的那个字母是T里的字母，需要将missing+1
                    missingCount += 1
                }
                map[head]! += 1
                start += 1
            }
            end += 1
        }
        
        return minLength == Int.max ? "" : String(s[minStart..<minStart + minLength])
    }
}
