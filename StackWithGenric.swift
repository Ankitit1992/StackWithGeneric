import UIKit


// Integer Stack
struct IntStack {
    
    var list: [Int] = []
    
    var count: Int {
        return list.count
    }
    
    mutating func push(_ item: Int) {
        list.append(item)
    }
    
    mutating func pop() -> Int {
        return list.removeLast()
    }
    
}

var stack = IntStack()
stack.push(10)
stack.push(120)
stack.push(110)
stack.pop()
print(stack.list)


struct Stack<T> {
    var list: [T] = []
    var count: Int {
        return list.count
    }
    
    mutating func push(_ item: T) {
        list.append(item)
    }
    
    mutating func pop() -> T {
        return list.removeLast()
    }
}

var stack1 = Stack<Int>()
stack1.push(100)
stack1.push(120)
stack1.push(110)
stack1.push(130)
stack1.pop()
print(stack1.list)

// Stack with Protocol Confirm
protocol Container {
    associatedtype Item
    mutating func push(_ value: Item)
    mutating func pop() -> Item?
    var count: Int {get}
    subscript(_ index: Int) -> Item {get}
}

struct ContainerStack: Container {
    
    
    typealias Item = Int
    private var elementList: [Int] = []
    var count: Int {
        return elementList.count
    }
    
    mutating func push(_ value: Int) {
        elementList.append(value)
    }
    
    mutating func pop() -> Int? {
        if !elementList.isEmpty {
            return elementList.removeLast()
        } else {
            return nil
        }
    }
    
    subscript(index: Int) -> Int {
        return elementList[index]
    }
}

var stack03 = ContainerStack()
stack03.push(140)
stack03.push(180)
stack03.push(150)
stack03.push(190)
stack03.pop()
print(stack03[0])


// Stack with generic and protocol confirmation

struct ContainerGenStack<T>: Container {
    
    typealias Item = T
    private var elementList: [T] = []
    var count: Int {
        return elementList.count
    }
    
    mutating func push(_ value: T) {
        elementList.append(value)
    }
    
    mutating func pop() -> T? {
        if !elementList.isEmpty {
            return elementList.removeLast()
        } else {
            return nil
        }
    }
    
    subscript(index: Int) -> T {
        return elementList[index]
    }
}


var stack04 = ContainerGenStack<String>()
stack04.push("H")
stack04.push("B")
stack04.push("K")
stack04.push("L")
stack04.pop()
print(stack04[0])


// Stack Algorithem
func allMatchesStack<T: Container, U: Container>(_ stack: T, _ stack2: U) -> Bool where T.Item == U.Item , T.Item: Equatable, U.Item: Equatable  {
    
    if stack.count != stack2.count {
        return false
    }
    
    for index in 0..<stack.count - 1 {
        if stack[index] != stack2[index] {
            return false
        }
    }
    
    return true
}

func mergeStack<C1: Container, C2: Container>(_ s1: inout C1,
                                              _ s2: inout C2) -> some Container where C1.Item == C2.Item {
    
    var newContainer = ContainerGenStack<C1.Item>()
    while let value = s1.pop() {
        newContainer.push(value)
    }
    
    while  let value = s2.pop() {
        newContainer.push(value)
    }
    
    return newContainer
}

var stack05 = ContainerGenStack<String>()
stack05.push("H")
stack05.push("J")
stack05.push("O")
stack05.push("P")
stack05.pop()
print(stack05[0])

print(allMatchesStack(stack04, stack05))
var stack11 = mergeStack(&stack04, &stack05)


while let value = stack11.pop() {
  print(value, terminator: " ")
}
