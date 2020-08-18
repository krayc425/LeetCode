class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count1 = nums1.count
        let count2 = nums2.count
        let maxIter = (count1 + count2) / 2 + 1
        var currIter = 0
        var curr1 = 0
        var curr2 = 0
        var arr: [Int] = []
        while currIter < maxIter {
            if curr1 >= count1 {
                arr.append(nums2[curr2])
                curr2 += 1
            } else if curr2 >= count2 {
                arr.append(nums1[curr1])
                curr1 += 1
            } else if nums1[curr1] < nums2[curr2] {
                arr.append(nums1[curr1])
                curr1 += 1
            } else {
                arr.append(nums2[curr2])
                curr2 += 1
            }
            currIter += 1
        }
        if (count1 + count2) % 2 == 0 {
            return Double((arr[arr.count - 1] + arr[arr.count - 2])) / 2
        } else {
            return Double(arr.last!)
        }
    }
}

Solution().findMedianSortedArrays([1], [3,4])
