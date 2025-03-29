//
//  MemoryPreviewView.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 08/07/2024.
//

import SwiftUI

struct MemoryPreviewView<Presenter: MemoryPreviewPresentationLogic>: View {
    
    // MARK: Public
    var interactor: MemoryPreviewBusinessLogic?
    @ObservedObject var presenter: Presenter
    
    var body: some View {
        ScrollView {
            VStack {
                if let image = presenter.viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height * 2/3 )
                }
                Text(presenter.viewModel.title ?? "")
                    .foregroundStyle(Color.black)
                    .font(.title)
                Text(presenter.viewModel.description ?? "")
                    .foregroundStyle(Color.black)
                    .font(.subheadline)
            }
            .onViewDidLoad {
                interactor?.viewDidLoad(request: MemoryPreview.ViewDidLoad.Request())
            }
          
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MemoryPreviewView(interactor: MemoryPreviewInteractor(presenter: nil,
                                                          worker: nil),
                      presenter: MemoryPreviewPresenter())
}

extension UINavigationController {
    func setNavigationBarColor(color: UIColor) {
        self.navigationBar.barTintColor = color
    }
}
