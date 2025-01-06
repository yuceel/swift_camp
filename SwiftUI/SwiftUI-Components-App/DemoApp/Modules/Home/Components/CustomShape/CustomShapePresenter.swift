class CustomShapePresenter: MyCustomShapePresenterProtocol {
    var view: MyCustomShapeViewProtocol?

    init(view: MyCustomShapeViewProtocol?) {
        self.view = view
    }

    func viewDidLoad() {
        view?.displayShape()
    }

    func goBack() {
        view?.goBack()
    }
}
