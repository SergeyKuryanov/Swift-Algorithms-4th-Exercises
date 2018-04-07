/*
 Write a filter InfixToPostfix that converts an arithmetic expression from infix to postfix.
1 + 2 * 3 + 4
 to
 1 2 3 * + 4 +
 */

class Stack<T> {
    private var array = Array<T>()
    var count: Int {
        return array.count
    }

    func pop() -> T? {
        guard count > 0 else { return nil }
        return array.removeLast()
    }

    func push(_ value: T) {
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

    var isLeftParenthesis: Bool {
        return self == "("
    }

    var isRightParenthesis: Bool {
        return self == ")"
    }

    var precendenceIndex: Int {
        switch self {
        case "*":
            fallthrough
        case "/":
            return 1
        default:
            return 0
        }
    }
}

func infixToPostfix(_ input: String) -> String {
    let operatorStack = Stack<Character>()
    var output = ""

    for char in input {
        if char.isOperand {
            output += " \(char)"
        } else if char.isLeftParenthesis {
            operatorStack.push(char)
        } else if char.isRightParenthesis {
            while let `operator` = operatorStack.pop(), !`operator`.isLeftParenthesis {
                output += " \(`operator`)"
            }
        } else if char.isOperator {
            while let `operator` = operatorStack.peek(),
                !`operator`.isLeftParenthesis,
                char.precendenceIndex <= `operator`.precendenceIndex {
                output += " \(operatorStack.pop()!)"
            }

            operatorStack.push(char)
        }
    }

    while let `operator` = operatorStack.pop() {
        output += " \(`operator`)"
    }

    return output
}

infixToPostfix("(1 + 2) * 3 - (4 * 5 - 6)")
infixToPostfix("(((1 + 2) * 3) - ((4 - 5) * (6 + 7)))")
infixToPostfix("1 + 2 * 3 + 4")
