class Solution:
    def concatenatedBinary(self, n: int) -> int:
        concatenation = ""
        for i in range(1, n + 1):
            concatenation += bin(i)[2:]  # to remove "0b" in binary representation
        return int(concatenation, 2) % (10 ** 9 + 7)
