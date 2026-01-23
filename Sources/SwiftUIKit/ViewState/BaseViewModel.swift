//
//  BaseViewModel.swift
//  SwiftUIKit
//
//  Created by Manh Nguyen on 1/22/26.
//

import SwiftUI

@MainActor
open class BaseViewModel<Content> : ViewModelProtocol {
    
    @Published public var state: ViewState<Content> = .idle

    public func setLoading() {
        state = .loading
    }

    public func setLoaded(_ content: Content) {
        state = .loaded(content)
    }

    public func setError(_ error: Error) {
        state = .failed(error)
    }
    
}
