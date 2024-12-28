import SwiftUI

struct ContextMenuView: View {
    @ObservedObject var presenter: ContextMenuPresenter
    
    var body: some View {
        VStack(spacing: 20) {
            //Go back button
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
                    Text("Long press on the image to see options")
                        .font(.headline)
                        .padding()

                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                        .contextMenu {
                            Button(action: {
                                presenter.selectedAction = "Added to Favorites"
                            }) {
                                Label("Add to Favorites", systemImage: "heart.fill")
                            }

                            Button(action: {
                                presenter.selectedAction = "Shared"
                            }) {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }

                            Button(action: {
                                presenter.selectedAction = "Deleted"
                            }) {
                                Label("Delete", systemImage: "trash")
                                    .foregroundColor(.red)
                            }
                        }

            Text("Selected Action: \(presenter.selectedAction)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
            Spacer()
                }
                .padding()
            }
        }
