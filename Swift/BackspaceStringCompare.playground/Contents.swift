class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var i = S.count - 1
        var j = T.count - 1
        let schar = Array(S)
        let tchar = Array(T)
        while i >= 0 || j >= 0 {
            var skipS = 0
            var skipT = 0
            while i >= 0 {
                if schar[i] == "#" {
                    skipS += 1
                    i -= 1
                } else if skipS > 0 {
                    skipS -= 1
                    i -= 1
                } else {
                    break
                }
            }
            while j >= 0 {
                if tchar[j] == "#" {
                    skipT += 1
                    j -= 1
                } else if skipT > 0 {
                    skipT -= 1
                    j -= 1
                } else {
                    break
                }
            }
            if i >= 0 && j >= 0 && schar[i] != tchar[j] {
                return false
            }
            if (i >= 0) != (j >= 0) {
                return false
            }
            i -= 1
            j -= 1
        }
        return true
    }
}

Solution().backspaceCompare("ab#c", "ad#c")
