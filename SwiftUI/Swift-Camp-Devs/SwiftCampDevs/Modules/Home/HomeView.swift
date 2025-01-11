import Foundation
import SwiftUI
 
struct HomeView: View {
 
    @ObservedObject var presenter: HomePresenter
    var body: some View {
      Text("Welcome to your new app.")
    }
}
