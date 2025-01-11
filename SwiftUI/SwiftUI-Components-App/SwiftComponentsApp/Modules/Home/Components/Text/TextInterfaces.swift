import Foundation

protocol TextWireframeInterface: AnyObject {
    func goBack()
}

protocol TextInteractorInterface: AnyObject {
    func fetchText() -> String
}

protocol TextPresenterInterface: AnyObject {
    var displayedText: String { get }
    func loadText()
    func goBack()
}
