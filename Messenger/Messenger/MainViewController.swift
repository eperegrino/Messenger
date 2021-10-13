//
//  MainViewController.swift
//  Messenger
//
//  Created by Eduardo Peregrino on 07/10/21.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties -
    let viewModel = MessengerViewModel()

    // MARK: - Views -
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionFootersPinToVisibleBounds = false
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MessengerCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Messenger"
        setupViews()
        setupNavigationItems()
    }
}

// MARK: - ViewCode -
extension MainViewController: ViewCode {
    func setupSubviews() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.layout {
            $0.top == view.top
            $0.leading == view.leading
            $0.bottom == view.bottom
            $0.trailing == view.trailing
        }
    }
}

extension MainViewController {
    func setupNavigationItems() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                  target: self,
                                  action: nil)
        navigationItem.rightBarButtonItem = addButton
    }
}

// MARK: - CollectionView Setup -
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.messageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MessengerCollectionViewCell
        let name = "name \(indexPath.item)"
        let message = "message \(indexPath.item)"
        cell.prepare(name: name, message: message)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected cell \(indexPath.item)")
        // TODO
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
}
