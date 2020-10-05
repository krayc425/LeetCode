class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var leftTemp: [Int] = Array(repeating: 0, count: dominoes.count)
        var rightTemp: [Int] = Array(repeating: 0, count: dominoes.count)
        let array = Array(dominoes)
        var cnt = 0
        for i in 0..<array.count {
            if array[i] == "R" {
                leftTemp[i] = 1
                cnt = 1
            } else if array[i] == "." {
                if cnt >= 1 {
                    cnt += 1
                    leftTemp[i] = cnt
                }
            } else {
                if cnt > 0 {
                    leftTemp[i] = cnt + 1
                }
                cnt = 0
            }
        }
        cnt = 0
        for i in stride(from: array.count - 1, to: -1, by: -1) {
            if array[i] == "L" {
                rightTemp[i] = 1
                cnt = 1
            } else if array[i] == "." {
                if cnt >= 1 {
                    cnt += 1
                    rightTemp[i] = cnt
                }
            } else {
                if cnt > 0 {
                    rightTemp[i] = cnt + 1
                }
                cnt = 0
            }
        }
        var res = ""
        for i in 0..<dominoes.count {
            if leftTemp[i] < rightTemp[i] {
                if leftTemp[i] == 0 {
                    res += "L"
                } else {
                    res += "R"
                }
            } else if leftTemp[i] > rightTemp[i] {
                if rightTemp[i] == 0 {
                    res += "R"
                } else {
                    res += "L"
                }
            } else {
                res += "."
            }
        }
        return res
    }
}

Solution().pushDominoes(".L.R...LR..L..")
Solution().pushDominoes("RR.L")
