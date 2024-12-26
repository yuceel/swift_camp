enum PasswordError: Error {
    case empty
    case short
    case long
}

func validatePassword(_ password: String) throws -> String {
    if password.isEmpty {
        throw PasswordError.empty
    } else if password.count < 6 {
        throw PasswordError.short
    } else if password.count > 12 {
        throw PasswordError.long
    }
    return "Password is valid."
}

do {
    let password = "123"
    let validationMessage = try validatePassword(password)
    print(validationMessage)
} catch PasswordError.empty {
    print("Password cannot be empty.")
} catch PasswordError.short {
    print("Password is too short.")
} catch PasswordError.long {
    print("Password is too long.")
} catch {
    print("An error occurred.")
}
