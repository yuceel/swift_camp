// Define an enum to represent password validation errors.
enum PasswordError: Error {
    case empty
    case short
    case long
}

// Function to validate the password.
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
    // Define a sample password to validate.
    let password = "123"
    // Try to validate the password and get the validation message.
    let validationMessage = try validatePassword(password)
    // If the password is valid, print the validation message.
    print(validationMessage)
} catch PasswordError.empty {
    print("Password cannot be empty.")
} catch PasswordError.short {
    print("Password is too short.")
} catch PasswordError.long {
    print("Password is too long.")
} catch {
    // For any other errors, print this message.
    print("An error occurred.")
}
