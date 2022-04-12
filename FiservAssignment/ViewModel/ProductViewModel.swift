//
//  ProductViewModel.swift
//  FiservAssignment
//
//  Created by Sanjay Raskar on 12/04/22.
//

import Foundation

class ProductViewModel {
  // MARK: - Variables
  private var productList = [ProductListModel]()
  
  func fetchProductList(_ completionHandler: @escaping(_ status: Bool, _ error: String?) -> Void) {
    NetworkManager.shared.sendRequest(Constants.mockURL) {[weak self] data, error in
      if let data = data {
        debugPrint(data)
        do {
          if let productList = try self?.parseJsonResponse(data) {
            self?.productList = productList
          }
          completionHandler(true, nil)
        } catch {
          completionHandler(false, error.localizedDescription)
        }
      } else if let error = error {
        debugPrint(error)
        completionHandler(false, error)
      }
    }
  }
  
  func parseJsonResponse(_ data: Data) throws -> [ProductListModel] {
    var userList = [ProductListModel]()
    do {
      userList = try JSONDecoder().decode([ProductListModel].self, from: data)
      debugPrint(userList)
    } catch {
      debugPrint(error.localizedDescription)
      throw NetworkErrors.invalidResponse
    }
    return userList
  }
  
  func getUserList() -> [ProductListModel] {
    return productList
  }
}
