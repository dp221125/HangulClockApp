//
//  SettingsInteractor.swift
//  Settings
//
//  Created by minsone on 2020/02/09.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift

public protocol SettingsRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

public protocol SettingsPresentable: Presentable {
    var listener: SettingsPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

public protocol SettingsListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func finishSettings()
}

final class SettingsInteractor: PresentableInteractor<SettingsPresentable>, SettingsInteractable, SettingsPresentableListener {
    weak var router: SettingsRouting?
    weak var listener: SettingsListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SettingsPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func finishSettings() {
        listener?.finishSettings()
    }
}
