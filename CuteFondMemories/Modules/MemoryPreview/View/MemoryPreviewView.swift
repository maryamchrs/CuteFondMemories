//
//  MemoryPreviewView.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 08/07/2024.
//

import SwiftUI

struct MemoryPreviewView<Presenter: MemoryPreviewPresentationLogic>: View {
    
    // MARK: Public
    var interactor: MemoryPreviewBusinessLogic?
    @ObservedObject var presenter: Presenter
    
    var body: some View {
        ScrollView {
            Text("Test")
        }
    }
}

#Preview {
    MemoryPreviewView(interactor: MemoryPreviewInteractor(), presenter: MemoryPreviewPresenter())
}
