//
//  PopUpView.swift
//  TestAplikasi
//
//  Created by Macbook on 31/10/23.
//

import UIKit

class PopUpView: UIViewController {

    @IBOutlet weak var viewCoachmark: UIView!
    @IBOutlet weak var containerView: FormView!
    @IBOutlet weak var okBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        okBtn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        viewCoachmark.addGestureRecognizer(tapGesture)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        containerInitialState(containerView)
        animateContainerUp(containerView)
    }

    func setup() {
        viewCoachmark.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc func tapBtn() {
        self.dismiss(animated: true)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.dismissPopup(backView: viewCoachmark, contentView: containerView)
    }
}

extension PopUpView  {

    func containerInitialState(_ view: UIView) {

        view.transform = CGAffineTransform(translationX: 0, y: .currentDeviceHeight)
    }

    func animateContainerUp(_ view: UIView) {
        let animation = UIViewPropertyAnimator(
            duration: 0.5,
            dampingRatio: 0.8) { () in
            view.transform = .identity
        }
        animation.startAnimation()
    }

    func animateFadeInBackView(_ view: UIView) {
        view.alpha = 0
        UIView.animate(withDuration: 0.4) {
            view.alpha = 0.6
        }
    }

    func dismissPopup(backView: UIView, contentView: UIView) {
        UIView.animate(withDuration: 0.1) {
            self.viewCoachmark.alpha = 0
        }

        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseInOut) { [weak self] () in
            guard let self = self else { return }
                self.containerInitialState(self.containerView)
        } completion: { [weak self] isDone in
            guard let self = self else { return }
            if isDone {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
}
