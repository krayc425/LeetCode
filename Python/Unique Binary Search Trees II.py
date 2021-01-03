from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def generateTrees(self, n: int) -> List[TreeNode]:
        def generate_subtree(start, end):
            if start > end:
                return [None, ]
            all_trees = []
            for i in range(start, end + 1):
                left_trees = generate_subtree(start, i - 1)
                right_trees = generate_subtree(i + 1, end)
                for l in left_trees:
                    for r in right_trees:
                        all_trees.append(TreeNode(i, l, r))
            return all_trees

        return generate_subtree(1, n) if n else []
