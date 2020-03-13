class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
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
            if map[n] != nil {
                map[n]! -= 1
                result.append(n)
                if map[n]! == 0 {
                    map[n] = nil
                }
            }
        }
        return result
    }
}
