class Solution:
    def calculate(self, s: str) -> int:
        stack = []
        last_op = "+"
        curr = 0
        for c in s + "+":
            if c.isspace():
                continue
            elif c.isnumeric():
                curr *= 10
                curr += int(c)
            else:
                if last_op == "+":
                    stack.append(curr)
                elif last_op == "-":
                    stack.append(-curr)
                elif last_op == "*":
                    stack.append(stack.pop() * curr)
                elif last_op == "/":
                    last = stack.pop()
                    if last > 0:
                        stack.append(last // curr)
                    else:
                        stack.append(-(-last // curr))
                curr = 0
                last_op = c
        res = 0
        for num in stack:
            res += num
        return res
