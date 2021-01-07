from typing import List


class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        m, n = len(nums1), len(nums2)
        max_iter = (m + n) // 2 + 1
        curr_iter = 0
        curr1, curr2 = 0, 0
        arr = []
        while curr_iter < max_iter:
            if curr1 >= m:
                arr.append(nums2[curr2])
                curr2 += 1
            elif curr2 >= n:
                arr.append(nums1[curr1])
                curr1 += 1
            elif nums1[curr1] < nums2[curr2]:
                arr.append(nums1[curr1])
                curr1 += 1
            else:
                arr.append(nums2[curr2])
                curr2 += 1
            curr_iter += 1
        return arr[-1] if (m + n) % 2 == 1 else (arr[-1] + arr[-2]) / 2.0
