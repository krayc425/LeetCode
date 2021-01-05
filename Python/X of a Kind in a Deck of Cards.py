from typing import List
from functools import reduce
from collections import Counter
import math


class Solution:
    def hasGroupsSizeX(self, deck: List[int]) -> bool:
        return reduce(math.gcd, Counter(deck).values()) > 1
