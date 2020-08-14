class Solution {
    func isRobotBounded(_ instructions: String) -> Bool {
        var position = (0, 0)
        var direction = 0
        let moveDelta = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        for char in instructions {
            switch char {
            case "G":
                addTuple(&position, moveDelta[direction])
            case "L":
                direction = (direction + 3) % 4
            case "R":
                direction = (direction + 1) % 4
            default:
                fatalError("Invalid instruction")
            }
        }
        return position == (0, 0) || direction != 0
    }
    
    func addTuple(_ op1: inout (Int, Int), _ op2: (Int, Int)) {
        op1.0 += op2.0
        op1.1 += op2.1
    }
}

Solution().isRobotBounded("GGLLGLGRGLLGLG")
