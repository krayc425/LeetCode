class Solution {
    func reformat(_ s: String) -> String {
        var digits: [Character] = []
        var letters: [Character] = []
        for char in s {
            if char.isNumber {
                digits.append(char)
            } else {
                letters.append(char)
            }
        }
        guard abs(digits.count - letters.count) <= 1 else {
            return ""
        }
        var res: [Character] = []
        switch digits.count - letters.count {
        case 0:
            for i in 0..<digits.count {
                res.append(digits[i])
                res.append(letters[i])
            }
        case -1:
            res.append(letters.removeFirst())
            for i in 0..<digits.count {
                res.append(digits[i])
                res.append(letters[i])
            }
        case 1:
            res.append(digits.removeFirst())
            for i in 0..<digits.count {
                res.append(letters[i])
                res.append(digits[i])
            }
        default:
            break
        }
        return String(res)
    }
}

Solution().reformat("covid2019")
