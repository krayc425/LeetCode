let array = [1, 4, 4, 19, 0, 5]

func maximumDifference(in arr: [Int]) -> Int {
    var maxDiff = arr[1] - arr[0]
    var minLeft = arr[0]
    for i in (2..<arr.count) {
        if arr[i - 1] < minLeft {
            minLeft = arr[i - 1]
        }
        if arr[i] - minLeft > maxDiff {
            maxDiff = arr[i] - minLeft
        }
    }
    return maxDiff
}

maximumDifference(in: array)
