class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var res: [Int] = []
        for num in nums {
            res.append(num + (res.last ?? 0))
        }
        let cnt = nums.count
        var ret = 0
        for i in 0..<cnt {
            if res[i] == k {
                ret += 1
            }
            for j in 0..<i {
                if res[i] - res[j] == k {
                    ret += 1
                }
            }
        }
        return ret
    }
    
    func subarraySum_hashmap(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var ret = 0
        var map: [Int: Int] = [0: 1]
        var sum = 0
        for num in nums {
            sum += num
            if let val = map[sum] {
                map[sum] = val + 1
            } else {
                map[sum] = 1
            }
            if let val = map[sum - k] {
                ret += val
            }
        }
        return ret
    }
}

Solution().subarraySum([1,1,1,1,1,1], 3)
Solution().subarraySum_hashmap([1,1,1,1,1,1], 3)
