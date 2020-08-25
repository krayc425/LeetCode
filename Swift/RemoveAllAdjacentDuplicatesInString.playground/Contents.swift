class Solution {
    func removeDuplicates(_ S: String) -> String {
        guard !S.isEmpty else {
            return ""
        }
        var stack: [Character] = []
        for char in S {
            if let last = stack.last {
                if last == char {
                    stack.removeLast()
                    continue
                }
            }
            stack.append(char)
        }
        var res = ""
        for char in stack {
            res += String(char)
        }
        return res
    }
}

Solution().removeDuplicates("abbaca")
