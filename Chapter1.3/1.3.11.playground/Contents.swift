/*
 1.3.11 Write a program EvaluatePostfix that takes a postfix expression from standard input, evaluates it, and prints the value.
1 2 + 3 * 4 5 * 6 - -
 to
 -5
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
}

func evaluatePostfix(_ input: String) -> Int? {
    var operandStack = Stack<Int>()

    for char in input {
        if let operand = Int(String(char)) {
            operandStack.push(operand)
        } else if char.isOperator {
            let rightOperand = operandStack.pop()!
            let leftOperand = operandStack.pop()!

            switch char {
            case "+":
                operandStack.push(leftOperand + rightOperand)
            case "-":
                operandStack.push(leftOperand - rightOperand)
            case "*":
                operandStack.push(leftOperand * rightOperand)
            default:
                operandStack.push(leftOperand / rightOperand)
            }
        }
    }

    return operandStack.pop()
}

evaluatePostfix("1 2 + 3 * 4 5 * 6 - -")
