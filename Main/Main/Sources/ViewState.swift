//
//  ViewState.swift
//  Main
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation

protocol ViewStateListner: class {
    func onAppear()
}

public class ViewState: ObservableObject {
    @Published var date: String = "Hello world"
    
    weak var listener: ViewStateListner?
    
    func onAppear() {
        listener?.onAppear()
    }
}