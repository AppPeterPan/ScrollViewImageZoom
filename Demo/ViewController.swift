//
//  ViewController.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateZoomSizeFor(size: view.bounds.size)
    }

    func updateZoomSizeFor(size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale, heightScale)
        if scale < 1 {
            scrollView.minimumZoomScale = scale
            scrollView.zoomScale = scale
        }
        let maxScale = max(widthScale, heightScale)
        if maxScale > 1 {
            scrollView.maximumZoomScale = maxScale
        }
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let inset = (scrollView.bounds.height - imageView.frame.height) / 2
        scrollView.contentInset = .init(top: max(inset, 0), left: 0, bottom: 0, right: 0)
    }
}
