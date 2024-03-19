//
//  ExampleRxSwiftViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 25/02/24.
//

import UIKit
import RxSwift
import RxCocoa

class ExampleRxSwiftViewController: UIViewController {

  let bag = DisposeBag()

  @IBOutlet weak var statusLabel: UILabel!


  // Membuat sebuah PublishSubject dengan tipe Int
  let subject = PublishSubject<Int>()
  // Mendeklarasikan PublishSubject dengan tipe String
  let publishSubject = PublishSubject<String>()

  // Mendeklarasikan BehaviorSubject dengan tipe String dan memberikan nilai awal "Initial Value"
  let behaviorSubject = BehaviorSubject<String>(value: "Initial Value")

  // Mendeklarasikan PublishRelay dengan tipe Void
  let buttonTapRelay = PublishRelay<Void>()


  override func viewDidLoad() {
    super.viewDidLoad()

    // Melakukan subscribe ke relay untuk menangani ketika tombol ditekan
    buttonTapRelay.subscribe(onNext: { _ in
      print("Button tapped!")
    }).disposed(by: bag)

  }

  @IBAction func buttonTapped(_ sender: UIButton) {
      buttonTapRelay.accept(())
  }

}

extension ExampleRxSwiftViewController {

  func examplePublishSubjects() {
    // Melakukan subscribe ke PublishSubject
    publishSubject.subscribe(onNext: { [weak self] value in
      guard let self = self else {return}
      print("Received value:", value)
      self.statusLabel.text = "Received value: \(value)"
    }).disposed(by: bag)
  }


  func examplePublish() {
    // Melakukan subscribe ke subjek
    let subscription1 = subject.subscribe(onNext: { value in
      print("Subscriber 1 menerima nilai:", value)
    })

    // Mengirimkan beberapa event ke subjek
    subject.onNext(1)
    subject.onNext(2)
    subject.onNext(3)

    // Melakukan subscribe lainnya
    let subscription2 = subject.subscribe(onNext: { value in
      print("Subscriber 2 menerima nilai:", value)
    })

    // Mengirimkan lebih banyak event ke subjek
    subject.onNext(4)
    subject.onNext(5)

    // Melakukan unsubscribe
    subscription1.dispose()

    // Mengirimkan lebih banyak event setelah unsubscribe
    subject.onNext(6)
    subject.onNext(7)

    subscription2.disposed(by: bag)
  }
}

extension ExampleRxSwiftViewController {
  func testBehaviourSubject() {
    behaviorSubject.onNext("first initial \(Date())")

    // Melakukan subscribe ke BehaviorSubject
    behaviorSubject.subscribe(onNext: { [weak self] value in
      guard let self = self else { return }
      print("Received value:", value)
      self.statusLabel.text = "Received value: \(value)"
    }).disposed(by: bag)
  }
}
