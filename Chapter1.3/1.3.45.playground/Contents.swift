func generability(_ commands: String) -> Bool {
    var stackCount = 0

    for command in commands {
        if command == "-" {
            stackCount -= 1
        } else {
            stackCount += 1
        }

        if stackCount < 0 { return false }
    }

    return true
}

generability("12345--6-7-8")
generability("123----567")
