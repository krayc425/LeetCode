from typing import List
import heapq


class Solution:

    def findKthLargest(self, nums: List[int], k: int) -> int:
        def partition(nums) -> int:
            pivot = nums[0]
            left, right = 1, 1
            while right < len(nums):
                if nums[right] >= pivot:
                    nums[left], nums[right] = nums[right], nums[left]
                    left += 1
                right += 1
            nums[0], nums[left - 1] = nums[left - 1], nums[0]
            return left - 1

        def quickselect(nums: List[int], k: int) -> int:
            if len(nums) == 1:
                return nums[0]
            idx = partition(nums)
            if idx < k - 1:
                return quickselect(nums[idx + 1:], k - idx - 1)
            elif idx > k - 1:
                return quickselect(nums[:idx], k)
            else:
                return nums[idx]

        return quickselect(nums, k)

    def findKthLargest_heap(self, nums: List[int], k: int) -> int:
        return heapq.nlargest(k, nums)[-1]
