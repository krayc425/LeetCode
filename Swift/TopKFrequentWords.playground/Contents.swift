class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        guard !words.isEmpty && k > 0 else {
            return []
        }
        var arr: [String] = []
        var dict: [String: Int] = [:]
        for word in words {
            dict[word, default: 0] += 1
        }
        var tmp: [(String, Int)] = []
        for (k, v) in dict {
            tmp.append((k, v))
        }
        tmp.sort { (t1, t2) -> Bool in
            t1.1 == t2.1 ? t1.0 < t2.0 : t1.1 > t2.1
        }
        for i in 0..<tmp.count {
            let t = tmp[i]
            if arr.count < k {
                arr.append(t.0)
            } else {
                break
            }
        }
        return arr
    }
}

Solution().topKFrequent(["i", "love", "leetcode", "i", "love", "coding"], 1)
