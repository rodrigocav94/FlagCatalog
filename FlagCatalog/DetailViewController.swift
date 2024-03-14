//
//  DetailViewController.swift
//  FlagCatalog
//
//  Created by Rodrigo Cavalcanti on 14/03/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var country: Country?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupFlag()
    }
    
    func setupNavBar() {
        navigationItem.largeTitleDisplayMode = .never
        title = country?.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(shareTapped)
        )
    }
    
    func setupFlag() {
        guard let country else { return }
        let image = UIImage(named: country.alpha2.lowercased())
        imageView.image = image
    }

    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let activityItems =  [image, country?.name as Any]

        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
