//
//  SecondViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 26/10/23.
//


import UIKit

struct Person {
    var image: String
    var title: String
}

class SecondViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fromCameraBtn: UIButton!
    @IBOutlet weak var fromGalleryBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!

    @IBOutlet weak var showPopupBtn: UIButton!

    @IBOutlet weak var containerView: UIView!

    let data: [Person] = [Person(image: "pencil", title: "Home"),
                          Person(image: "eraser.fill", title: "Favorite"),
                          Person(image: "eraser", title: "Pln"),
                          Person(image: "scribble", title: "PPOB"),
                          Person(image: "eraser.fill", title: "Favorite"),
                          Person(image: "eraser", title: "Pln"),
                          Person(image: "scribble", title: "PPOB")]

    let pickerImage = UIImagePickerController()
    var imageChosen = [UIImagePickerController.InfoKey: Any]()


    let shapeLayer = CAShapeLayer()
    let animation = CABasicAnimation(keyPath: "path")


    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureShape()
    }

    func configureView() {
        collectionView.dataSource =  self
        collectionView.delegate = self
        collectionView.registerCellWithNib(FoodCollectionCell.self)
        fromCameraBtn.addTarget(self, action: #selector(tapCamera), for: .touchUpInside)
        fromGalleryBtn.addTarget(self, action: #selector(tapGallery), for: .touchUpInside)
        showPopupBtn.addTarget(self, action: #selector(tapPopUpButton), for: .touchUpInside)

    }

    @objc func tapCamera() {
        self.pickerImage.allowsEditing = true
        self.pickerImage.delegate = self
        self.pickerImage.sourceType = .camera
        self.present(self.pickerImage, animated: true, completion: nil)
    }

    @objc func tapGallery() {
        self.pickerImage.allowsEditing = true
        self.pickerImage.delegate = self
        self.pickerImage.sourceType = .photoLibrary
        self.present(self.pickerImage, animated: true, completion: nil)
    }

    @objc func tapPopUpButton() {
        loadingIndicator.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadingIndicator.dismissImmediately()
            let vc = PopUpView()
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .coverVertical
            self.navigationController?.present(vc, animated: true, completion: nil)
        }

        shapeLayer.add(animation, forKey: "pathAnimation")
    }

    func configureShape() {
        let squarePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 100, height: 100))

        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 0, y: 0))
        trianglePath.addLine(to: CGPoint(x: 100, y: 0))
        trianglePath.addLine(to: CGPoint(x: 50, y: 100))
        trianglePath.close()


        shapeLayer.path = squarePath.cgPath // Start with a square path
        shapeLayer.fillColor = UIColor.black.cgColor
        let parentCenter = CGPoint(x: containerView.layer.bounds.midX, y: containerView.layer.bounds.midY)

        shapeLayer.position = parentCenter
        containerView.layer.addSublayer(shapeLayer)


        animation.toValue = trianglePath.cgPath
        animation.duration = 2.0 // Animation duration in seconds
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false

        shapeLayer.add(animation, forKey: "pathAnimation")

    }
}


extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as FoodCollectionCell
        cell.setup(image: data.image, title: data.title)
        return cell
    }

    // UICollectionViewFlowLayout delegate method to set the size of items
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         // Calculate the item width based on the collection view's width divided by 3
         let collectionViewWidth = collectionView.bounds.width
         let itemWidth = (collectionViewWidth) / 4.0
         return CGSize(width: itemWidth, height: 100) // Adjust the height as needed
     }

    // UICollectionViewFlowLayout delegate method to set the section insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10) // Adjust as needed
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.collectionView.scrollToNearestVisibleCollectionViewCell()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.collectionView.scrollToNearestVisibleCollectionViewCell()
        }
    }

}

extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.imageChosen = info
        self.profileImage.image = image
        self.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

