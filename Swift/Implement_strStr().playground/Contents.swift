class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }
        if haystack.count < needle.count {
            return -1
        }
        if haystack.count == needle.count {
            return haystack == needle ? 0 : -1
        }
        var flag = true
        for i in 0..<haystack.count - needle.count + 1 {
            flag = true
            for j in 0..<needle.count {
                print(String(haystack[haystack.index(haystack.startIndex, offsetBy: i + j)]), String(needle[needle.index(needle.startIndex, offsetBy: j)]))
                if String(haystack[haystack.index(haystack.startIndex, offsetBy: i + j)]) != String(needle[needle.index(needle.startIndex, offsetBy: j)]) {
                    flag = false
                    continue
                }
            }
            if flag {
                return i
            }
        }
        return -1
    }
}


Solution().strStr("mississippi", "pi")
