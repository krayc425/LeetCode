class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for num in nums {
            dict[num] = dict[num, default: 0] + 1
        }
        var arr: [(Int, Int)] = []
        for (k, v) in dict {
            arr.append((k, v))
        }
        arr.sort { $0.1 > $1.1 }
        var res: [Int] = []
        for i in 0..<k {
            res.append(arr[i].0)
        }
        return res
    }
}

Solution().topKFrequent([4,1,-1,2,-1,2,3], 2)
