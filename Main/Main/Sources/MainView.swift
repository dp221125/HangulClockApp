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
    @State var isVisibleSettingButton: Bool = false
    
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
            .onTapGesture {
                withAnimation(.easeInOut) {
                    self.isVisibleSettingButton.toggle()
                }
            }
            .frame(size.width-30, size.height-30)
            leftTopLine
            rightBottomLine
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
                .opacity(isVisibleSettingButton ? 1 : 0)
            
        }
    }
    
    private var leftTopLine: some View {
        VStack() {
            Spacer()
            Path { path in
                let width = min(size.width, size.height)
                let spacing: CGFloat = 7
                let len = width / 5 / 2
                path.addLines([
                    CGPoint(x: 0, y: 0),
                    CGPoint(x: 0, y: len),
                    CGPoint(x: spacing, y: len),
                    CGPoint(x: spacing, y: spacing),
                    CGPoint(x: len, y: spacing),
                    CGPoint(x: len, y: 0),
                    CGPoint(x: 0, y: 0)
                ])
            }
            .fillColor(Color.white)
            .frame(size)
            Spacer()
        }
    }
    
    private var rightBottomLine: some View {
        VStack() {
            Spacer()
            Path { path in
                let width = min(size.width, size.height)
                let spacing: CGFloat = 7
                let len = width / 5 / 2
                path.addLines([
                    CGPoint(x: width, y: width),
                    CGPoint(x: width, y: width-len),
                    CGPoint(x: width-spacing, y: width-len),
                    CGPoint(x: width-spacing, y: width-spacing),
                    CGPoint(x: width-len, y: width-spacing),
                    CGPoint(x: width-len, y: width),
                    CGPoint(x: width, y: width),
                ])
            }
            .fillColor(Color.white)
            .frame(size)
            Spacer()
        }
    }
}
