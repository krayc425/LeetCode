# """
# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
# """
class NestedInteger:
    def isInteger(self) -> bool:
        """
        @return True if this NestedInteger holds a single integer, rather than a nested list.
        """
        pass

    def getInteger(self) -> int:
        """
        @return the single integer that this NestedInteger holds, if it holds a single integer
        Return None if this NestedInteger holds a nested list
        """
        pass

    def getList(self) -> [NestedInteger]:
        """
        @return the nested list that this NestedInteger holds, if it holds a nested list
        Return None if this NestedInteger holds a single integer
        """
        pass


class NestedIterator:

    def __init__(self, nestedList: [NestedInteger]):
        def flatten(nested_list):
            for nested_integer in nested_list:
                if nested_integer.isInteger():
                    self.integers.append(nested_integer.getInteger())
                else:
                    flatten(nested_integer.getList())

        self.integers = []
        self.position = -1  # Pointer to previous returned.
        flatten(nestedList)

    def next(self) -> int:
        self.position += 1
        return self.integers[self.position]

    def hasNext(self) -> bool:
        return self.position + 1 < len(self.integers)

# Your NestedIterator object will be instantiated and called as such:
# i, v = NestedIterator(nestedList), []
# while i.hasNext(): v.append(i.next())
