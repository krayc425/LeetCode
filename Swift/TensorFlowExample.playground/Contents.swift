import TensorFlow

let x = Tensor<Float>([[-1, -2], [3, 4]])
print(x)
print(sigmoid(x))
print(relu(x))
print(tanh(x))

let y = Tensor<Float>.init(zeros: TensorShape([1, 4]))
print(y)
