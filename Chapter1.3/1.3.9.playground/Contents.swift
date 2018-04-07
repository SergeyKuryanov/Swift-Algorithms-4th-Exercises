/*
 1.3.9 Write a program that takes from standard input an expression without left pa- rentheses and prints the equivalent infix expression with the parentheses inserted. For example, given the input:
     1 + 2 ) * 3 - 4 ) * 5 - 6 ) ) )
 your program should print
     ( ( 1 + 2 ) * ( ( 3 - 4 ) * ( 5 - 6 ) )
 */

struct Stack<T> {
    private var array = Array<T>()
    var count: Int {
        return array.count
    }

    mutating func pop() -> T? {
        return array.removeLast()
    }

    mutating func push(_ value: T) {
        array.append(value)
    }

    func peek() -> T? {
        return array.last
    }
}

extension Character {
    var isOperand: Bool {
        let digitsSet = Set("1234567890")
        return digitsSet.contains(self)
    }

    var isOperator: Bool {
        let operatorsSet = Set("+-*/")
        return operatorsSet.contains(self)
    }

    var isRightParenthesis: Bool {
        return self == ")"
    }
}

func balance(_ input: String) -> String? {
    var operatorStack = Stack<Character>()
    var operandStack = Stack<String>()

    for char in input {
        if char.isOperand {
            operandStack.push(String(char))
        } else if char.isOperator {
            operatorStack.push(char)
        } else if char.isRightParenthesis {
            let rightOperand = operandStack.pop()!
            let leftOperand = operandStack.pop()!
            let `operator` = operatorStack.pop()!

            operandStack.push("( \(leftOperand) \(`operator`) \(rightOperand) )")
        }
    }

    return operandStack.pop()
}



balance("1 + 2 ) * 3 - 4 ) * 5 - 6 ) ) )")
