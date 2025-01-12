import SwiftUI

enum TextFieldType: Equatable {
    case username
    case password
    case email
    case search
    case custom(placeholder: String, keyboardType: UIKeyboardType)
 
    var placeholder: String {
        switch self {
        case .username: return "Enter your username"
        case .password: return "Enter your password"
        case .email: return "Enter your email"
        case .search: return "Search"
        case .custom(let placeholder, _): return placeholder
        }
    }
 
    var keyboardType: UIKeyboardType {
        switch self {
        case .username, .password, .search: return .default
        case .email: return .emailAddress
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
        case .custom(_, _):
            return { $0.isEmpty ? "Field cannot be empty" : nil }
        }
    }
}
