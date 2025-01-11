import Foundation
import SwiftUICore

final class GroupBoxPresenter: ObservableObject {
    
    let description: String = "Anıtkabir stands as a powerful symbol of the Turkish nation's respect and gratitude toward Mustafa Kemal Atatürk and the struggle for independence. Located in the heart of Ankara, it embodies pride and unity, reminding all visitors of the values and vision Atatürk inspired."
    let title: String = "Anıtkabir"
    //let backgroundImage = Image(uiImage: "groupBoxBackground")
    
    private let wireframe: GroupBoxWireframeInterface
    
    init(wireframe: GroupBoxWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
    
    
}
