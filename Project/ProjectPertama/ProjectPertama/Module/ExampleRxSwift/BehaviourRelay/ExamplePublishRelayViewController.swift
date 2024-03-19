//
//  ExamplePublishRelayViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 25/02/24.
//

import UIKit
import RxSwift
import RxCocoa

class MessageService {
    static let shared = MessageService()
    let messageRelay = PublishRelay<String>()

    private init() {} // Singleton

    func sendMessage(_ message: String) {
        messageRelay.accept(message)
    }
}

class ExamplePublishRelayViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTF: InputField!
    @IBOutlet weak var sendButton: UIButton!

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Subscribe untuk menampilkan pesan yang diterima pada label
        MessageService.shared.messageRelay
            .bind(to: messageLabel.rx.text)
            .disposed(by: disposeBag)

        // Subscribe untuk mengirimkan pesan saat tombol diklik
        sendButton.rx.tap
        // Ambil teks dari TextField
        .map { [weak self] _ in self?.messageTF.inputText.text ?? "" }
            .subscribe(onNext: { message in
                MessageService.shared.sendMessage(message)
            })
            .disposed(by: disposeBag)
    }
}
