from typing import List


class Solution:
    def reversePairs(self, nums: List[int]) -> int:
        self.res = 0

        def merge(l, r: List[int]) -> List[int]:
            len_l, len_r = len(l), len(r)
            i, j = 0, 0
            while i < len_l and j < len_r:
                if l[i] <= 2 * r[j]:
                    i += 1
                else:
                    j += 1
                    # It means that all numbers in [i, len_l) are greater than 2 * r[j]
                    # Can understand like this: r[j] causes len_l - i reverse pairs
                    self.res += len_l - i
            return sorted(l + r)

        def mergesort(nums: List[int]) -> List[int]:
            if len(nums) <= 1:
                return nums
            mid = (len(nums) + 1) // 2
            left = mergesort(nums[:mid])
            right = mergesort(nums[mid:])
            return merge(left, right)

        mergesort(nums)
        return self.res
