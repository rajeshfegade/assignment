//
//  NetworkManager.swift
//  FiservAssignment
//
//Created by Appleon 12/04/22.
//


import Foundation

enum NetworkErrors: Error {
  case invalidURL
  case invalidResponse
  case unknownError
}

final class NetworkManager {
  static let shared = NetworkManager()
  
  private init() {
    debugPrint(Constants.networkManagerInit)
  }
  
  func sendRequest(_ url: String, completionHandler: @escaping(_ data: Data?, _ error: String?) -> Void) {
    guard let url = URL(string: url) else {
      completionHandler(nil, Constants.invalidURL)
      return
    }
    
    let urlRequest = URLRequest(url: url)
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if let data = data {
        completionHandler(data, nil)
      } else if let error = error {
        completionHandler(nil, error.localizedDescription)
      }
    }.resume()
  }
}
