from typing import List


# Definition for a Node.
class Node:
    def __init__(self, val=None, children=None):
        self.val = val
        self.children = children if children is not None else []


class Solution:
    def findRoot(self, tree: List['Node']) -> 'Node':
        if len(tree) == 0:
            return None
        all_children = set()
        vals = {}
        for node in tree:
            vals[node.val] = node
            for child in node.children:
                all_children.add(child.val)
        for v, n in vals.items():
            if v not in all_children:
                return n
        return None
