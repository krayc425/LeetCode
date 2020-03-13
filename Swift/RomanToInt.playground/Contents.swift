class Solution {
    func romanToInt(_ s: String) -> Int {
        var result: Int = 0
        let reservedString: [Character] = s.reversed()
        let count = reservedString.count
        for i in 0..<count {
            switch reservedString[i] {
            case "I":
                result += 1
            case "V":
                if i < count - 1 && reservedString[i + 1] == "I" {
                    result += 3
                } else {
                    result += 5
                }
            case "X":
                if i < count - 1 && reservedString[i + 1] == "I" {
                    result += 8
                } else {
                    result += 10
                }
            case "L":
                if i < count - 1 && reservedString[i + 1] == "X" {
                    result += 30
                } else {
                    result += 50
                }
            case "C":
                if i < count - 1 && reservedString[i + 1] == "X" {
                    result += 80
                } else {
                    result += 100
                }
            case "D":
                if i < count - 1 && reservedString[i + 1] == "C" {
                    result += 300
                } else {
                    result += 500
                }
            case "M":
                if i < count - 1 && reservedString[i + 1] == "C" {
                    result += 800
                } else {
                    result += 1000
                }
            default:
                break
            }
        }
        return result
    }
}

print(Solution().romanToInt("DIV"))
