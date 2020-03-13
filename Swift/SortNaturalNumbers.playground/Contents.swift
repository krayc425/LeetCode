func sortNaturalNumbers(_ array: inout [Int]) {
    for i in 0..<array.count {
        while array[i] != i + 1 {
            let temp = array[i]
            array[i] = array[temp - 1]
            array[temp - 1] = temp
        }
    }
}

var array: [Int] = [8,11,3,5,1,2,6,12,10,9,14,4,13,7,15]
sortNaturalNumbers(&array)
