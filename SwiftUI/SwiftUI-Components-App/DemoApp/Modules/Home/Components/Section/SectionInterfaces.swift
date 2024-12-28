import Foundation

protocol SectionWireframeInterface: AnyObject {
    func goBack()
}

protocol SectionInteractorInterface: AnyObject {
    func fetchSections() -> [String]
}

protocol SectionPresenterInterface: AnyObject {
    var sections: [String] { get }
    var selectedSection: String? { get set }
    func loadSections()
    func selectSection(_ section: String)
    func goBack()
}
