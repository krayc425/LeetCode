class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        for n in nums1 {
            if map[n] != nil {
                map[n]! += 1
            } else {
                map[n] = 1
            }
        }
        var result: [Int] = []
        for n in nums2 {
            if (map[n] ?? 0) > 0 {
                result.append(n)
                map[n]! -= 1
            }
        }
        return result
    }
}

Solution().intersection([1,9,8,6,3,1,1,2,4,5,2], [1,1,1,2,3,4,5,1,2])
