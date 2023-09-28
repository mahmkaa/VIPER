//
//  ImageViewerViewController.swift
//  Super easy dev
//
//  Created by Павел Петров on 28.09.2023
//

import UIKit

protocol ImageViewerViewProtocol: AnyObject {
    func showImage(image: UIImage?)
}

class ImageViewerViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    // MARK: - Public
    var presenter: ImageViewerPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidloaded()
        initialize()
    }
}

// MARK: - Private functions
private extension ImageViewerViewController {
    func initialize() {
    }
}

// MARK: - ImageViewerViewProtocol
extension ImageViewerViewController: ImageViewerViewProtocol {
    func showImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}
