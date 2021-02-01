from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def verticalTraversal(self, root: TreeNode) -> List[List[int]]:
        nodes = []

        def traverse(node: TreeNode, row, col: int):
            if not node:
                return
            nodes.append((col, row, node.val))
            traverse(node.left, row + 1, col - 1)
            traverse(node.right, row + 1, col + 1)

        traverse(root, 0, 0)

        nodes.sort()
        res = []
        curr_column_index = nodes[0][0]
        curr_column = []
        for column, row, value in nodes:
            if column == curr_column_index:
                curr_column.append(value)
            else:
                res.append(curr_column)
                curr_column_index = column
                curr_column = [value]
        res.append(curr_column)
        return res
