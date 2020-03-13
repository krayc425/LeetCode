class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var s = m + n - 1
        var p1 = m - 1
        var p2 = n - 1
        if n == 0 {
            return
        }
        if m == 0 {
            for i in 0...p2 {
                nums1[i] = nums2[i]
            }
            return
        }
        while p1 >= 0 && p2 >= 0 {
            if nums1[p1] > nums2[p2] {
                nums1[s] = nums1[p1]
                p1 -= 1
            } else {
                nums1[s] = nums2[p2]
                p2 -= 1
            }
            s -= 1
        }
        if p2 >= 0 {
            for i in 0...s {
                nums1[i] = nums2[i]
            }
        }
    }
}

var arr = [2,0]
Solution().merge(&arr, 1, [1], 1)
print(arr)
