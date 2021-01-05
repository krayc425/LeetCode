from typing import List


class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        curr1 = m - 1
        curr2 = n - 1
        curr = m + n - 1
        while curr1 >= 0 and curr2 >= 0:
            if nums1[curr1] > nums2[curr2]:
                nums1[curr] = nums1[curr1]
                curr1 -= 1
            else:
                nums1[curr] = nums2[curr2]
                curr2 -= 1
            curr -= 1
        nums1[:curr2 + 1] = nums2[:curr2 + 1]
