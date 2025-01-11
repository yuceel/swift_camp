import Foundation
 
/// A singleton class for various string operations such as validation, conversion, trimming, etc.
final class StringHelper {
    /// Shared instance for global access (Singleton)
    static let shared = StringHelper()
    /// Private initializer to prevent instantiation
    private init() {}
    // MARK: - Trim
    /// Trims whitespace and newlines from both ends of the string.
    /// - Parameter string: The original string to trim.
    /// - Returns: A trimmed string.
    /// Example:
    /// ```
    /// let result = StringHelper.shared.trim("  Hello World  ")
    /// print(result) // "Hello World"
    /// ```
    func trim(_ string: String) -> String {
        return string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    // MARK: - Length
    /// Returns the length (character count) of the string.
    /// - Parameter string: The string whose length needs to be measured.
    /// - Returns: The length of the string.
    /// Example:
    /// ```
    /// let result = StringHelper.shared.length(of: "Hello")
    /// print(result) // 5
    /// ```
    func length(of string: String) -> Int {
        return string.count
    }
    // MARK: - Check for Empty or Whitespace
    /// Checks if the string is empty or contains only whitespace characters.
    /// - Parameter string: The string to check.
    /// - Returns: A boolean indicating whether the string is empty or contains only whitespace.
    /// Example:
    /// ```
    /// let result = StringHelper.shared.isEmptyOrWhitespace("  ")
    /// print(result) // true
    /// ```
    func isEmptyOrWhitespace(_ string: String) -> Bool {
        return string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    // MARK: - Capitalization
    /// Capitalizes the first letter of the string.
    /// - Parameter string: The string to capitalize.
    /// - Returns: A string with the first letter capitalized.
    /// Example:
    /// ```
    /// let result = StringHelper.shared.capitalizeFirstLetter("hello")
    /// print(result) // "Hello"
    /// ```
    func capitalizeFirstLetter(_ string: String) -> String {
        return string.prefix(1).capitalized + string.dropFirst()
    }
    /// Capitalizes the first letter of each word in the string.
    /// - Parameter string: The string whose words need to be capitalized.
    /// - Returns: A string with each word's first letter capitalized.
    /// Example:
    /// ```
    /// let result = StringHelper.shared.capitalizeWords("hello world")
    /// print(result) // "Hello World"
    /// ```
    func capitalizeWords(_ string: String) -> String {
        return string.capitalized
    }
    // MARK: - Replace Substring
    /// Replaces all occurrences of a substring with another substring.
    /// - Parameters:
    ///   - target: The substring to replace.
    ///   - replacement: The substring to replace the target with.
    ///   - string: The string to search for the target substring.
    /// - Returns: A new string with the target replaced by the replacement.
    /// Example:
    /// ```
    /// let result = StringHelper.shared.replaceOccurrences(of: "world", with: "Swift", in: "Hello world")
    /// print(result) // "Hello Swift"
    /// ```
    func replaceOccurrences(of target: String, with replacement: String, in string: String) -> String {
        return string.replacingOccurrences(of: target, with: replacement)
    }
    // MARK: - Reverse String
    /// Reverses the string.
    /// - Parameter string: The string to reverse.
    /// - Returns: The reversed string.
    /// Example:
    /// ```
    /// let result = StringHelper.shared.reverse("Hello")
    /// print(result) // "olleH"
    /// ```
    func reverse(_ string: String) -> String {
        return String(string.reversed())
    }
    // MARK: - Remove Special Characters
    /// Removes all special characters (non-alphanumeric characters) from the string.
    /// - Parameter string: The string to remove special characters from.
    /// - Returns: A string with only alphanumeric characters.
    /// Example:
    /// ```
    /// let result = StringHelper.shared.removeSpecialCharacters("Hello, World!")
    /// print(result) // "HelloWorld"
    /// ```
    func removeSpecialCharacters(_ string: String) -> String {
        let allowedCharacters = CharacterSet.alphanumerics
        return string.filter { String($0).rangeOfCharacter(from: allowedCharacters) != nil }
    }
}
