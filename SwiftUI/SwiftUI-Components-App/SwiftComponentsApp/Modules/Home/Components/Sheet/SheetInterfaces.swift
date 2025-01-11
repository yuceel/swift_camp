protocol SheetViewProtocol: AnyObject {
    func updateView(with data: String)
}

protocol SheetPresenterProtocol: AnyObject {
    func loadData()
    func showBottomSheet()
    func goBack() // Yeni eklenen geri navigasyon metodu
}

protocol SheetWireframeProtocol: AnyObject {
    func navigateToNextScreen()
    func presentBottomSheet()
    func navigateBack() // Yeni eklenen geri navigasyon metodu
}
