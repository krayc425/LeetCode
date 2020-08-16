class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        if isPalindrome(s) {
            return 1
        }
        return 2
    }
    
    func isPalindrome(_ s: String) -> Bool {
        return String(s.reversed()) == s
    }
}
