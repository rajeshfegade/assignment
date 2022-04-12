//
//  MainViewController.swift
//  FiservAssignment
//
//Created by Appleon 12/04/22.
//

import UIKit

class MainViewController: UIViewController {

  var mainModel = ProductViewModel()
  
    @IBOutlet weak var productsListTableView: UITableView!
    override func viewDidLoad() {
    super.viewDidLoad()
    mainModel.fetchProductList { status, error in
      if status {
        self.successResponseHandler(status)
      } else if let error = error {
        self.failureResponseHandler(error)
      }
    }
        self.title = "Products"
  }
  
  func successResponseHandler(_ status: Bool) {
    debugPrint(status)
      DispatchQueue.main.async {
          self.productsListTableView.reloadData()
      }
  }
  
  func failureResponseHandler(_ error: String) {
    debugPrint(error)
  }
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainModel.getUserList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell {
            let productDetails = mainModel.getUserList()[indexPath.row]
            cell.configureCell(productDetails: productDetails)
            return cell
        }
        return UITableViewCell()
    }
}
