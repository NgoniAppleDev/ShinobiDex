//
//  LoadState.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 4/7/2026.
//

import Foundation

enum LoadState<Value> {
    case idle
    case loading
    case loaded(Value)
    case failed(any Error)
}

extension LoadState {
    
    var value: Value? {
        guard case .loaded(let value) = self else {
            return nil
        }
        
        return value
    }
    
    var isLoading: Bool {
        if case .loading = self {
            return true
        }
        
        return false
    }
    
    var isIdle: Bool {
        if case .idle = self {
            return true
        }
        
        return false
    }
    
    var error: (any Error)? {
        guard case .failed(let error) = self else {
            return nil
        }
        
        return error
    }
    
    var errorMessage: String? {
        guard case .failed(let error) = self else {
            return nil
        }
        
        return error.localizedDescription
    }
}
