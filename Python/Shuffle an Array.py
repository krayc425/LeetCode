from typing import List
import random


class Solution:

    def __init__(self, nums: List[int]):
        self.array = nums[:]
        self.original = nums[:]

    def reset(self) -> List[int]:
        """
        Resets the array to its original configuration and return it.
        """
        self.array = self.original[:]
        return self.original

    def shuffle(self) -> List[int]:
        """
        Returns a random shuffling of the array.
        """
        for i in range(len(self.array)):
            idx = random.randrange(i, len(self.array))
            self.array[idx], self.array[i] = self.array[i], self.array[idx]
        return self.array

# Your Solution object will be instantiated and called as such:
# obj = Solution(nums)
# param_1 = obj.reset()
# param_2 = obj.shuffle()
