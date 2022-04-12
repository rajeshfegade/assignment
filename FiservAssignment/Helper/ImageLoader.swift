//
//  ImageLoader.swift
//  FiservAssignment
//
//Created by Appleon 12/04/22.
//

import Foundation
import UIKit

var cache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImage(_ from: URL) {
        
        if let image = cache.object(forKey: from.lastPathComponent as NSString) {
            DispatchQueue.main.async {
                self.image = image
            }
            return
        }
        let request = URLRequest(url: from)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
                cache.setObject(UIImage(data: data)!, forKey: from.lastPathComponent as NSString)
            }
        }.resume()
    }
}
