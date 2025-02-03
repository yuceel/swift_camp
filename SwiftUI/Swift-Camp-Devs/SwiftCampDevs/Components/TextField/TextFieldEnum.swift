import SwiftUI

enum TextFieldType: Equatable {
    case username
    case password
    case email
    case search
    case phoneNumber
    case url
    case numeric
    case nonEmpty
    case fullName
    case custom(placeholder: String, keyboardType: UIKeyboardType)
 
    var placeholder: String {
        switch self {
        case .username: return "Enter your username"
        case .password: return "Enter your password"
        case .email: return "Enter your email"
        case .search: return "Search"
        case .phoneNumber: return "Enter your phone number"
        case .url: return "Enter your url"
        case .numeric: return "Enter numeric value"
        case .nonEmpty: return "Enter something (non empty)"
        case .fullName: return "Enter your full name"
        case .custom(let placeholder, _): return placeholder
        }
    }
 
    var keyboardType: UIKeyboardType {
        switch self {
        case .username, .search: return .default
        case .password: return .asciiCapable
        case .email: return .emailAddress
        case .phoneNumber: return .phonePad
        case .url: return .URL
        case .numeric: return .numberPad
        case .nonEmpty, .fullName: return .default
        case .custom(_, let keyboardType): return keyboardType
        }
    }
 
    var validate: ((String) -> String?) {
        switch self {
        case .username:
            return { ValidatorHelper(type: .username).validate($0) }
        case .password:
            return { ValidatorHelper(type: .password).validate($0) }
        case .email:
            return { ValidatorHelper(type: .email).validate($0) }
        case .search:
            return { ValidatorHelper(type: .search).validate($0) }
        case .phoneNumber:
            return { ValidatorHelper(type: .phoneNumber).validate($0) }
        case .url:
            return { ValidatorHelper(type: .url).validate($0) }
        case .numeric:
            return { ValidatorHelper(type: .numeric).validate($0) }
        case .nonEmpty:
            return { ValidatorHelper(type: .nonEmpty).validate($0)}
        case .fullName:
            return {ValidatorHelper(type: .fullName).validate($0)}
        case .custom(_, _):
            return { $0.isEmpty ? "Field cannot be empty" : nil }
        }
    }
    
    // Minimum Length Variables
    var minLength: Int? {
        switch self {
        case .username:
            return 3
        case .password:
            return 8
        case .email:
            return 5
        case .search:
            return 2
        case .phoneNumber:
            return 7
        case .url:
            return 5
        case .numeric:
            return 1
        case .nonEmpty:
            return 1
        case .fullName:
            return 2
        case .custom(placeholder: _, keyboardType: _):
            return nil
        }
    }
    
    // Maximum Length Variables
    var maxLength: Int? {
        switch self {
        case .username:
            return 20
        case .password:
            return 64
        case .email:
            return 254
        case .search:
            return nil
        case .phoneNumber:
            return 15
        case .url:
            return 2000
        case .numeric:
            return nil
        case .nonEmpty:
            return 500
        case .fullName:
            return 80
        case .custom(placeholder: _, keyboardType: _):
            return nil
        }
    }
    
    
    // Display Names
    var displayName: String {
        switch self{
        case.username:
            return "Username"
        case .password:
            return "Password"
        case .email:
            return "Email"
        case .search:
            return "Search"
        case .phoneNumber:
            return "Phone Number"
        case .url:
            return "URL"
        case .numeric:
            return "Numeric"
        case .nonEmpty:
            return "Non Empty"
        case .fullName:
            return "Full Name"
        case .custom(_, _):
            return "Custom"
        }
    }
}
