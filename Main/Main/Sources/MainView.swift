//
//  MainView.swift
//  Main
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import SwiftUI
import PureSwiftUI
import PureSwiftUITools

public struct MainView {
    private let size: CGSize
    @ObservedObject var model: ViewState
    
    public init(size: CGSize, model: ObservedObject<ViewState>) {
        self.size = size
        self._model = model
    }
}

extension MainView: View {
    public var body: some View {
        ZStack {
            GridView(model.gridTexts.count, spacing: 8) { column, row in
                LargeTitleText("\(self.model.gridTexts[row][column])", .white, .bold)
                    .opacity(self.model.gridMarks[row][column] ? 1 : 0.4)
                    .animation(.easeInOut(duration: 0.5))
                    .greedyFrame()
            }
            .frame(size.width, size.height)
            
            settingButton
        }
        .onAppear(perform: model.onAppear)
    }
    
    private var settingButton: some View {
        VStack(alignment: .trailing) {
            Spacer()
            HStack {
                Spacer()
            }
            Image(systemName: "gear")
                .foregroundColor(.white)
                .font(Font.system(.title).bold())
                .padding(.trailing, 20)
                .onTapGesture(perform: model.tapSettings)
        }
        
    }
}
