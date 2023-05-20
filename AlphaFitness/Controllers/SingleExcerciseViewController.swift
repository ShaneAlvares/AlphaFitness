//
//  SingleExcerciseViewController.swift
//  AlphaFitness
//
//  Created by Frank Alvares on 2023-05-20.
//

import UIKit

class SingleExcerciseViewController: UIViewController{
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        
        return scrollView
    }()
    
    let contentView : UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBackground
        return contentView
    }()
    
    let imageView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 3
        contentView.layer.masksToBounds = true
        return contentView
    }()

    let image: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.sd_setImage(with: URL(string: "https://gymvisual.com/img/p/2/7/0/1/4/27014.gif"), placeholderImage: nil, options: [], completed: nil)
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
//        scrollView.contentInsetAdjustmentBehavior = .never
        
        image.layer.cornerRadius = view.layer.cornerRadius
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imageView)
        
        imageView.addSubview(image)
        
                
       
        
        addConstraints()
    }
    
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: imageView.topAnchor),
            image.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            imageView.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1.0)
        ])
        
        
//
//
//
//        NSLayoutConstraint.activate([
//            popularWorkoutsCard.topAnchor.constraint(equalTo: resultsLabel.bottomAnchor, constant: 20),
//            popularWorkoutsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
//            popularWorkoutsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
//            popularWorkoutsCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
