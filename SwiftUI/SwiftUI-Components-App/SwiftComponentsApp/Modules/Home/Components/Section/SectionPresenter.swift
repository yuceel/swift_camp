import Foundation

final class SectionPresenter: SectionPresenterInterface, ObservableObject {
    
    // MARK: - Properties
    private let wireframe: SectionWireframeInterface
    private let interactor: SectionInteractorInterface
    
    @Published var sections: [String] = []
    @Published var selectedSection: String? = nil
    
    // MARK: - Initialization
    init(wireframe: SectionWireframeInterface, interactor: SectionInteractorInterface) {
        self.wireframe = wireframe
        self.interactor = interactor
        loadSections()
    }
    
    // MARK: - SectionPresenterInterface Methods
    func loadSections() {
        sections = interactor.fetchSections()
    }
    
    func selectSection(_ section: String) {
        selectedSection = section
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
