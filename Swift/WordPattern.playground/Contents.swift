class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        if str == "" || pattern == "" || str.split(separator: " ").count != pattern.count {
            return false
        }
        var dict: [Character: [Int]] = [:]
        for (index, char) in pattern.enumerated() {
            if dict[char] != nil {
                dict[char]!.append(index)
            } else {
                dict[char] = [index]
            }
        }
        let strSeparated = str.split(separator: " ")
        var patternStrsToCompare: [String] = [] // 每一个dict代表的下标的字符串进行比较
        for indexes in dict.values {
            var strsToCompare: [String] = []
            for index in indexes {
                strsToCompare.append(String(strSeparated[index]))
            }
            let set = Set(strsToCompare)
            if set.count > 1 {  // 每个下标代表的都是同一个词吗
                return false
            } else {
                patternStrsToCompare.append(set.first!) // 是的话 加入最后“每个字符代表的字符串是否相同”的数组
            }
        }
        return Set(patternStrsToCompare).count == dict.keys.count
    }
}

Solution().wordPattern("abba", "dog dog dog dog")
