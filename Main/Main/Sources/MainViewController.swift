//
//  MainViewController.swift
//  Main
//
//  Created by minsone on 2020/02/07.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift
import RxRelay
import RxCocoa
import UIKit
import SwiftUI
import PureSwiftUI

public protocol MainPresentableListener: class {
    
}

final class MainViewController: UIHostingController<MainView>, MainPresentable, MainViewControllable, ViewStateListner {
    func onAppear() {
        print(#function)
    }
    

    weak var listener: MainPresentableListener?
    
    var state = BehaviorRelay<ViewState>(value: ViewState())
    @ObservedObject private var _state: ViewState

    private let disposeBag = DisposeBag()
    
    init() {
        self._state = state.value
        let conf = Configure()
        let rootView = MainView(size: conf.rootViewSize, model: __state)
        super.init(rootView: rootView)
        _state.listener = self
        self.view.backgroundColor = .black
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

private struct Configure {
    var rootViewSize: CGSize {
        let size = UIScreen.main.bounds.size
        let value = min(size.width - 20, size.height - 20)
        return CGSize(value, value)
    }
}
