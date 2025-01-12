import Foundation
import UIKit
enum ValidatorType {
    case username
    case password
    case email
    case search
    case phoneNumber
    case url
    case numeric
    case nonEmpty
    case name
    case surname
    case custom((String) -> String?)
}

struct ValidatorHelper {
    
    private let validatorType: ValidatorType
    
    init(type: ValidatorType) {
        self.validatorType = type
    }
    
    func validate(_ value: String) -> String? {
        let trimmedValue = StringHelper.shared.convertTurkishCharacters(
            StringHelper.shared.trim(value)
        )
        switch validatorType {
        case .username:
            return validateUsername(trimmedValue)
        case .password:
            return validatePassword(trimmedValue)
        case .email:
            return validateEmail(trimmedValue)
        case .search:
            return validateSearch(trimmedValue)
        case .phoneNumber:
            return validatePhoneNumber(trimmedValue)
        case .url:
            return validateURL(trimmedValue)
        case .numeric:
            return validateNumeric(trimmedValue)
        case .nonEmpty:
            return validateNonEmpty(trimmedValue)
        case .name:
            return validateName(trimmedValue)
        case .surname:
            return validateSurname(trimmedValue)
        case .custom(let customValidator):
            return customValidator(trimmedValue)
        }
    }
    
    // MARK: - Validation Methods
    
    private func validateUsername(_ value: String) -> String? {
        if value.isEmpty {
            return "Username cannot be empty."
        }
        if value.count < 3 {
            return "Username must be at least 3 characters long."
        }
        if value.count > 20 {
            return "Username cannot exceed 20 characters."
        }
        let usernameRegex = "^[a-zA-Z0-9_]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        if !predicate.evaluate(with: value) {
            return "Username can only contain letters, numbers, and underscores. Spaces are not allowed."
        }
        return nil
    }
    
    private func validatePassword(_ value: String) -> String? {
        if value.isEmpty {
            return "Password cannot be empty."
        }
        // Şifre kriterleri ve mesajları
        let passwordCriteria: [(NSPredicate, String)] = [
            (NSPredicate(format: "SELF MATCHES %@", ".{8,}"), "Password must be at least 8 characters long."),
            (NSPredicate(format: "SELF MATCHES %@", ".{0,64}"), "Password cannot exceed 64 characters."),
            (NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*"), "Password must contain at least one uppercase letter (A-Z)."),
            (NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*"), "Password must contain at least one lowercase letter (a-z)."),
            (NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*"), "Password must contain at least one number (0-9)."),
            (NSPredicate(format: "SELF MATCHES %@", ".*[!@#$%^&*(),.?\":{}|<>]+.*"), "Password must contain at least one special character (!@#$%^&*).")
        ]
        // Her kriteri kontrol et
        for (predicate, errorMessage) in passwordCriteria {
            if !predicate.evaluate(with: value) {
                return errorMessage
            }
        }
        // Boşluk kontrolü ayrı yapılır
        if value.contains(" ") {
            return "Password cannot contain spaces."
        }
        return nil
    }
    
    private func validateEmail(_ value: String) -> String? {
        if value.isEmpty {
            return "Email cannot be empty."
        }
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !predicate.evaluate(with: value) {
            return "Invalid email format. Example: user@example.com"
        }
        return nil
    }
    
    private func validateName(_ value: String) -> String? {
        if value.isEmpty {
            return "Name cannot be empty."
        }
        if value.count < 2 {
            return "Name must be at least 2 characters long."
        }
        if value.count > 50 {
            return "Name cannot exceed 50 characters."
        }
        let nameRegex = "^[a-zA-Z ]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        if !predicate.evaluate(with: value) {
            return "Name can only contain letters and spaces."
        }
        return nil
    }
    
    private func validateSurname(_ value: String) -> String? {
        if value.isEmpty {
            return "Surname cannot be empty."
        }
        if value.count < 2 {
            return "Surname must be at least 2 characters long."
        }
        if value.count > 50 {
            return "Surname cannot exceed 50 characters."
        }
        let surnameRegex = "^[a-zA-Z ]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", surnameRegex)
        if !predicate.evaluate(with: value) {
            return "Surname can only contain letters and spaces."
        }
        return nil
    }
    
    private func validateSearch(_ value: String) -> String? {
        if value.isEmpty {
            return "Search input cannot be empty."
        }
        if value.count < 2 {
            return "Search input must be at least 2 characters."
        }
        if value.count > 50 {
            return "Search input cannot exceed 50 characters."
        }
        if value.contains(where: { !$0.isLetter && !$0.isNumber && !$0.isWhitespace }) {
            return "Search input can only contain letters, numbers, and spaces."
        }
        return nil
    }
    
    private func validatePhoneNumber(_ value: String) -> String? {
        if value.isEmpty {
            return "Phone number cannot be empty."
        }
        let phoneRegex = "^\\+?[1-9]\\d{1,14}$" // E.164 format
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if !predicate.evaluate(with: value) {
            return "Invalid phone number format. Use international format (e.g., +123456789)."
        }
        if value.count < 8 {
            return "Phone number is too short. It must have at least 8 digits."
        }
        if value.count > 15 {
            return "Phone number is too long. It cannot exceed 15 digits."
        }
        return nil
    }
    
    private func validateURL(_ value: String) -> String? {
        if value.isEmpty {
            return "URL cannot be empty."
        }
        guard let url = URL(string: value), UIApplication.shared.canOpenURL(url) else {
            return "Invalid URL format. Example: https://www.example.com"
        }
        return nil
    }
    
    private func validateNumeric(_ value: String) -> String? {
        if value.isEmpty {
            return "Value cannot be empty."
        }
        let numericRegex = "^\\d+(\\.\\d+)?$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", numericRegex)
        if !predicate.evaluate(with: value) {
            return "Value must be numeric. Example: 123 or 123.45"
        }
        return nil
    }
    
    private func validateNonEmpty(_ value: String) -> String? {
        if value.isEmpty {
            return "This field cannot be empty."
        }
        return nil
    }
}
