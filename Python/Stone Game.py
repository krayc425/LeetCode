from typing import List


class Solution:
    def stoneGame(self, piles: List[int]) -> bool:
        def dp(i, j: int) -> int:
            if i > j:
                return 0
            if (j - i) % 2 == 1:
                # Alex
                return max(piles[i] + dp(i + 1, j), dp(i, j - 1) + piles[j])
            else:
                # Lee
                return min(-piles[i] + dp(i + 1, j), dp(i, j - 1) - piles[j])

        return dp(0, len(piles) - 1) > 0
