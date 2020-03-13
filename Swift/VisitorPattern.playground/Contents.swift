import Foundation

protocol Visitor {
    func visit(element: MyElement)
    // Or you can write both
    //     func visit(element: ElementA)
    // and
    //     func visit(element: ElementB)
    func visit(element: UniqueElement)
}

class VisitorOne: Visitor {
    func visit(element: MyElement) {
        element.printInfo()
    }
    func visit(element: UniqueElement) {
        print("I am visiting a unique element.")
    }
}

class VisitorTwo: Visitor {
    func visit(element: MyElement) {
        print("Who is this? This is \(element.elementName).")
    }
    func visit(element: UniqueElement) {
        print("I am visiting a unique element, too.")
    }
}

class MyElement {
    var elementName: String = ""
    func accept(visitor: Visitor) {
        visitor.visit(element: self)
    }
    func printInfo() {
        print(elementName, terminator: ".\n")
    }
}

class ElementA: MyElement {
    override var elementName: String {
        get {
            return "ElementA"
        }
        set {
            super.elementName = newValue
        }
    }
}

class ElementB: MyElement {
    override var elementName: String {
        get {
            return "ElementB"
        }
        set {
            super.elementName = newValue
        }
    }
}

extension Array where Element: MyElement {
    func accept(visitor: Visitor) {
        self.forEach { $0.accept(visitor: visitor) }
    }
}

//  UniqueElement doesn't inherit from MyElement
class UniqueElement {
    func accept(visitor: Visitor) {
        visitor.visit(element: self)
    }
}

print("-------------Begin!-------------")

let elementA = ElementA()
let elementB = ElementB()
let uniqueElement = UniqueElement()

print("------------Visitor1------------")

let visitor1 = VisitorOne()
elementA.accept(visitor: visitor1)
elementB.accept(visitor: visitor1)
uniqueElement.accept(visitor: visitor1)

print("------------Visitor2------------")

let visitor2 = VisitorTwo()
elementA.accept(visitor: visitor2)
elementB.accept(visitor: visitor2)
uniqueElement.accept(visitor: visitor2)

print("---------MyElementArray---------")

let elementArray = [ElementA(), ElementB()]
elementArray.accept(visitor: visitor1)
elementArray.accept(visitor: visitor2)
