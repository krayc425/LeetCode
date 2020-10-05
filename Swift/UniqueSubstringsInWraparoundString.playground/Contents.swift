class Solution {
    func findSubstringInWraproundString(_ p: String) -> Int {
        let s = "abcdefghijklmnopqrstuvwxyz"
        var dict: [Character: Int] = [:]
        for char in s {
            dict[char] = dict.count + 1
        }
        let arr = Array(p)
        var len = 0
        var dp: [Int] = Array(repeating: 0, count: 26)
        for i in 0..<arr.count {
            if i == 0 {
                len = 1
            } else {
                if dict[arr[i]]! == dict[arr[i - 1]]! + 1 || dict[arr[i]] == dict[arr[i - 1]]! - 25 {
                    len += 1
                } else {
                    len = 1
                }
            }
            dp[dict[arr[i]]! - 1] = max(dp[dict[arr[i]]! - 1], len)
        }
        return dp.reduce(0, +)
    }
}



Solution().findSubstringInWraproundString("zaba")
Solution().findSubstringInWraproundString("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijk")
