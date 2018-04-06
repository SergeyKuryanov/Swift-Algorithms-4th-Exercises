/*
 1.3.4 Write a stack client Parentheses that reads in a text stream from standard input and uses a stack to determine whether its parentheses are properly balanced.
 For example, your program should print true for [()]{}{[()()]()} and false for [(]).
 */

class Stack<T> {
    private var array = Array<T?>()
    var count: Int {
        return array.count
    }

    func pop() -> T? {
        return array.removeLast()
    }

    func push(_ value: T) {
        array.append(value)
    }
}

func isBalanced(_ input: String) -> Bool {
    let parenthesisStack = Stack<Character>()

    for character in input {
        if character.isLeftParenthesis {
            parenthesisStack.push(character)
        } else {
            if parenthesisStack.count == 0 { return false }

            if !character.isMatchLeftParenthesis(parenthesisStack.pop()) { return false }
        }
    }

    return parenthesisStack.count == 0
}

extension Character {
    var isLeftParenthesis: Bool {
        let leftParenthesis = Set("{[(")
        return leftParenthesis.contains(self)
    }

    func isMatchLeftParenthesis(_ leftParentesis: Character?) -> Bool {
        switch leftParentesis {
        case "{":
            return self == "}"
        case "[":
            return self == "]"
        case "(":
            return self == ")"
        default:
            return false
        }
    }
}

isBalanced("[()]{}{[()()]()}")
isBalanced("[(])")

