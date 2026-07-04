//
//  APIError.swift
//  ShinobiDex
//
//  Created by Ngoni Katsidzira  on 3/7/2026.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingFailed(Error)
    case network(Error)
}

struct ErrorPresentation: Sendable {
    let title: String
    let message: String
    let systemImage: String
}

extension APIError {
    
    var presentation: ErrorPresentation {
        switch self {
            
        case .invalidURL:
            return .init(
                title: "Invalid URL",
                message: "The request couldn't be created.",
                systemImage: "link.icloud"
            )
            
        case .network(let error):
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet:
                    return .init(
                        title: "No Internet Connection",
                        message: "You're currently not connected to the internet.",
                        systemImage: "wifi.exclamationmark"
                    )
                case .timedOut:
                    return .init(
                        title: "Timed Out",
                        message: "The request took too long to complete. Please try again.",
                        systemImage: "clock.badge.exclamationmark"
                    )
                case .networkConnectionLost:
                    return .init(
                        title: "Network Connection Lost",
                        message: "The connection was interrupted. Please try again.",
                        systemImage: "wifi.slash"
                    )
                case .cannotFindHost:
                    return .init(
                        title: "Server Unavailable",
                        message: "The server couldn't be reached.",
                        systemImage: "network.slash"
                    )
                case .cannotConnectToHost:
                    return .init(
                        title: "Unable to reach Server",
                        message: "Cannot connect to online service right now.",
                        systemImage: "network.slash"
                    )
                default:
                    return .init(
                        title: "Network Issue",
                        message: "Please check your internet connection.",
                        systemImage: "network"
                    )
                }
            } else {
                return .init(
                    title: "Network Issue",
                    message: "Please check your internet connection.",
                    systemImage: "network"
                )
            }
            
        case .invalidResponse:
            return .init(
                title: "Invalid Response",
                message: "The server returned an unexpected response.",
                systemImage: "arrow.trianglehead.2.clockwise.rotate.90.circle"
            )
            
        case .invalidStatusCode(let code):
            switch code {
            case 401:
                return .init(
                    title: "Not Authorized",
                    message: "You are not authorized.",
                    systemImage: "lock.icloud.fill"
                )
                
            case 404:
                return .init(
                    title: "Not Found",
                    message: "The requested resource couldn't be found.",
                    systemImage: "exclamationmark.magnifyingglass"
                )
                
            case 429:
                return .init(
                    title: "Too many requests",
                    message: "Too many requests. Please try again shortly.",
                    systemImage: "hand.raised.fill"
                )
                
            case 500...599:
                return .init(
                    title: "Server Error",
                    message: "The server encountered an error. Please try again later.",
                    systemImage: "exclamationmark.transmission"
                )
                
            default:
                return .init(
                    title: "Request Failed",
                    message: "The request couldn't be completed.",
                    systemImage: "network"
                )
            }
            
        case .decodingFailed:
            return .init(
                title: "Unexpected Response",
                message: "We couldn't process the server response.",
                systemImage: "square.and.line.vertical.and.square.filled"
            )
        }
    }
}

extension APIError {
    var errorDescription: String? {
        presentation.message
    }
}
