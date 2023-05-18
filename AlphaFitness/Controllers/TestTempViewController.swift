import UIKit

class TestTempViewController:  UIViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let navigationBar: UITabBar = {
        let navigationBar = UITabBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
        setupNavigationBar()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        view.addSubview(navigationBar)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: navigationBar.topAnchor),
            
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register custom UICollectionViewCell if needed
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")
        
        // Set the collection view's scrolling direction to horizontal
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        // Additional configuration if needed
    }
    
    private func setupNavigationBar() {
        navigationBar.delegate = self
        
        let icons = [
            UITabBarItem(title: "Icon 1", image: UIImage(systemName: "1.square.fill"), tag: 0),
            UITabBarItem(title: "Icon 2", image: UIImage(systemName: "2.square.fill"), tag: 1),
            UITabBarItem(title: "Icon 3", image: UIImage(systemName: "3.square.fill"), tag: 2),
            UITabBarItem(title: "Icon 4", image: UIImage(systemName: "4.square.fill"), tag: 3)
        ]
        
        navigationBar.setItems(icons, animated: false)
    }
}

extension TestTempViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Number of rows (sections) in the collection view
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Number of items (cards) in each row (section)
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        
        // Configure the cell
        
        return cell
    }
}

extension TestTempViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust the size of each card as per your requirement
        return CGSize(width: 150, height: 200)
    }
}

extension TestTempViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Handle tab bar item selection
        switch item.tag {
        case 0:
            // Handle Icon 1 selection
            break
        case 1:
            // Handle Icon 2 selection
            break
        case 2:
            // Handle Icon 3 selection
            break
        case 3:
            // Handle Icon 4 selection
            break
        default:
            break
        }
    }
}

class CardCollectionViewCell: UICollectionViewCell {
    // Customize the card cell layout and contents as needed
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure the cell's subviews and constraints
        
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
