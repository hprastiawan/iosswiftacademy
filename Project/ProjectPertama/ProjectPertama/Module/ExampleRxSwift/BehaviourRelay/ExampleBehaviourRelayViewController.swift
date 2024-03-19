//
//  ExampleBehaviourRelayViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 25/02/24.
//

import UIKit
import RxSwift
import RxCocoa

class ExampleBehaviourRelayViewController: UIViewController {

  // Mendeklarasikan BehaviorRelay dengan nilai awal "Initial Value"
  let behaviorRelay = BehaviorRelay<String>(value: "Initial Value")
  let disposeBag = DisposeBag()

  @IBOutlet weak var valueLabel: UILabel!
  @IBOutlet weak var valueTF: InputField!
  @IBOutlet weak var updateButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Melakukan binding antara nilai BehaviorRelay dengan teks label
    behaviorRelay.asObservable()
      .bind(to: valueLabel.rx.text)
      .disposed(by: disposeBag)

    // Menghubungkan input dari text field ke BehaviorRelay saat teks berubah
    valueTF.inputText.rx.text
      .flatMapLatest { text -> Observable<String> in
          // Lakukan proses transformasi atau validasi di sini jika diperlukan
          let modifiedText = text?.uppercased() ?? ""
          return Observable.just(modifiedText)
      }
      .bind(to: behaviorRelay)
      .disposed(by: disposeBag)

    // Melakukan sesuatu ketika tombol ditekan
    updateButton.rx.tap
      .subscribe(onNext: { [weak self] in
        guard let newValue = self?.valueTF.inputText.text else { return }
        self?.behaviorRelay.accept(newValue)
      })
      .disposed(by: disposeBag)
  }
}




//extension ExampleBehaviourRelayViewController {
//
//
//    // Mendeklarasikan BehaviorRelay dengan nilai awal "Initial Value"
//    let behaviorRelay = BehaviorRelay<String>(value: "Initial Value")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Menggandakan setiap nilai yang diterima oleh behaviorRelay
//        behaviorRelay.asObservable()
//            .flatMapLatest { value -> Observable<String> in
//                // Menggandakan nilai terakhir dengan menambahkan "Doubled: " di depannya
//                return Observable.just("Doubled: \(value)")
//            }
//            .subscribe(onNext: { doubledValue in
//                print("Doubled value:", doubledValue)
//            })
//            .disposed(by: disposeBag)
//
//        // Mengirimkan nilai baru ke behaviorRelay
//        behaviorRelay.accept("New Value")
//    }
//}
//
//let numbersObservable = Observable.of(1, 2, 3, 4)
//let lettersObservable = Observable.of("A", "B", "C", "D")
//
//numbersObservable.flatMapLatest { number in
//    // Mengalikan setiap angka dengan dua
//    return Observable.just(number * 2)
//
//}.subscribe(onNext: { value in
//    print("Transformed value:", value)
//}).disposed(by: disposeBag)
//
//lettersObservable.flatMapLatest { letter in
//    // Mengubah huruf menjadi huruf kecil
//    return Observable.just(letter.lowercased())
//}.subscribe(onNext: { value in
//    print("Lowercased letter:", value)
//}).disposed(by: disposeBag)
//
//
//let firstObservable = Observable.of(1, 2, 3)
//let secondObservable = Observable.of(4, 5, 6)
//
//Observable.combineLatest(firstObservable, secondObservable) { first, second in
//    return first + second // Menjumlahkan nilai terbaru dari kedua aliran data
//}.subscribe(onNext: { value in
//    print("Combined value:", value)
//}).disposed(by: disposeBag)



//import UIKit
//import RxSwift
//import RxCocoa
//
//class MyViewController: UIViewController {
//
//    @IBOutlet weak var myTextField: UITextField! // IBOutlet untuk text field di antarmuka pengguna
//
//    let disposeBag = DisposeBag()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Membuat BehaviorRelay untuk menyimpan teks terakhir yang dimasukkan ke dalam text field
//        let textRelay = BehaviorRelay<String>(value: "")
//
//        // Menghubungkan aliran data dari RxSwift dengan teks dari text field
//        myTextField.rx.text.orEmpty // Mengambil aliran data teks dari text field menggunakan UIKit Bindings
//            .bind(to: textRelay) // Menghubungkan teks dari text field dengan BehaviorRelay
//            .disposed(by: disposeBag)
//
//        // Mengamati BehaviorRelay untuk melakukan sesuatu ketika nilai berubah
//        textRelay
//            .subscribe(onNext: { text in
//                print("Text field value changed:", text)
//            })
//            .disposed(by: disposeBag)
//    }
//}
//
//class MyViewController: UIViewController {
//
//    @IBOutlet weak var myButton: UIButton! // IBOutlet untuk tombol di antarmuka pengguna
//
//    let disposeBag = DisposeBag()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Menghubungkan event tap dari tombol dengan aliran data
//        myButton.rx.tap
//            .subscribe(onNext: {
//                print("Button tapped!") // Tindakan yang dilakukan ketika tombol ditekan
//            })
//            .disposed(by: disposeBag)
//    }
//}
//
//class MyViewController: UIViewController {
//
//    @IBOutlet weak var mySwitch: UISwitch! // IBOutlet untuk switch di antarmuka pengguna
//
//    let disposeBag = DisposeBag()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Membuat sebuah BehaviorSubject untuk menyimpan nilai terakhir dari switch
//        let switchState = BehaviorRelay(value: mySwitch.isOn)
//
//        // Menghubungkan aliran data dari RxSwift dengan properti isOn dari UISwitch
//        switchState
//            .bind(to: mySwitch.rx.isOn) // Menghubungkan nilai switch dengan aliran data menggunakan UIKit Bindings
//            .disposed(by: disposeBag)
//
//        // Mengamati perubahan pada switch dan menyimpannya ke dalam BehaviorSubject
//        mySwitch.rx.isOn
//            .bind(to: switchState)
//            .disposed(by: disposeBag)
//
//        // Menampilkan nilai switch setiap kali berubah
//        switchState
//            .subscribe(onNext: { isOn in
//                print("Switch is on:", isOn)
//            })
//            .disposed(by: disposeBag)
//    }
//}
//
//
//import UIKit
//import RxSwift
//import RxCocoa
//
//class MyViewController: UIViewController {
//
//    @IBOutlet weak var myLabel: UILabel! // IBOutlet untuk label di antarmuka pengguna
//
//    let disposeBag = DisposeBag()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Membuat Observable yang menghasilkan urutan angka
//        let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//
//        // Mengubah Observable menjadi Driver
//        let driver = observable
//            .map { "Count: \($0)" } // Mengubah nilai menjadi teks yang sesuai untuk ditampilkan di label
//            .asDriver(onErrorJustReturn: "Error occurred") // Mengubahnya menjadi Driver dan menangani error
//
//        // Menghubungkan aliran data Driver dengan teks label
//        driver
//            .drive(myLabel.rx.text) // Menghubungkan teks dari Driver dengan teks label menggunakan UIKit Bindings
//            .disposed(by: disposeBag)
//    }
//}
//
//
//import RxSwift
//import RxCocoa
//
//class MyViewController: UIViewController {
//
//    @IBOutlet weak var myLabel: UILabel! // IBOutlet untuk label di antarmuka pengguna
//
//    let disposeBag = DisposeBag()
//    let textRelay = BehaviorRelay<String>(value: "Initial Value")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Mengubah relay menjadi Driver
//        let driver = textRelay.asDriver() // Mengubah relay menjadi Driver
//
//        // Menghubungkan aliran data Driver dengan teks label
//        driver
//            .drive(myLabel.rx.text) // Menghubungkan teks dari Driver dengan teks label menggunakan UIKit Bindings
//            .disposed(by: disposeBag)
//
//        // Simulasi perubahan nilai dalam relay
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.textRelay.accept("New Value")
//        }
//    }
//}
//
//class MyViewController: UIViewController {
//
//    @IBOutlet weak var myButton: UIButton! // IBOutlet untuk tombol di antarmuka pengguna
//
//    let disposeBag = DisposeBag()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Mengamati event tap dari tombol menggunakan Control Event
//        myButton.rx.tap
//            .subscribe(onNext: {
//                print("Button tapped!") // Tindakan yang dilakukan ketika tombol ditekan
//            })
//            .disposed(by: disposeBag)
//    }
//}
//
//class MyViewController: UIViewController {
//
//    @IBOutlet weak var mySegmentedControl: UISegmentedControl! // IBOutlet untuk segmented control di antarmuka pengguna
//
//    let disposeBag = DisposeBag()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Mengamati event valueChanged dari segmented control menggunakan Control Event
//        mySegmentedControl.rx.selectedSegmentIndex
//            .subscribe(onNext: { selectedIndex in
//                print("Selected segment index:", selectedIndex) // Tindakan yang dilakukan ketika indeks segmen dipilih
//            })
//            .disposed(by: disposeBag)
//    }
//}
//
//class MyViewController: UIViewController {
//
//    let disposeBag = DisposeBag()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Membuat Observable yang menghasilkan urutan angka setiap detik
//        let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//
//        // Mengamati dan mencetak nilai dari observable di thread utama
//        observable
//            .subscribe(onNext: { value in
//                print("Value:", value)
//            })
//            .disposed(by: disposeBag)
//    }
//}
//
//
//import UIKit
//import RxSwift
//import RxCocoa
//
//class SearchViewController: UIViewController {
//
//    @IBOutlet weak var searchBar: UISearchBar! // IBOutlet untuk search bar di antarmuka pengguna
//    @IBOutlet weak var tableView: UITableView! // IBOutlet untuk table view di antarmuka pengguna
//
//    let disposeBag = DisposeBag()
//    let searchService = SearchService() // Objek yang menangani logika pencarian
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Mengamati event textDidChange dari search bar menggunakan Control Event
//        searchBar.rx.text.orEmpty
//            .throttle(.milliseconds(300), scheduler: MainScheduler.instance) // Mengatur delay sebelum memulai pencarian
//            .distinctUntilChanged() // Hanya memicu pencarian jika teks berubah
//            .flatMapLatest { query in
//                return self.searchService.searchForItems(query: query) // Melakukan pencarian menggunakan search service
//                    .observeOn(MainScheduler.instance) // Memastikan bahwa hasil pencarian ditampilkan di thread utama
//                    .catchErrorJustReturn([]) // Mengatasi kesalahan pencarian dengan mengembalikan array kosong
//            }
//            .bind(to: tableView.rx.items(cellIdentifier: "Cell")) { index, item, cell in
//                cell.textLabel?.text = item // Menampilkan hasil pencarian di dalam table view
//            }
//            .disposed(by: disposeBag)
//    }
//}
//
//import Foundation
//import RxSwift
//
//class SearchService {
//
//    func searchForItems(query: String) -> Observable<[String]> {
//        // Contoh implementasi sederhana: Mengembalikan sebuah array berisi kata-kata yang sesuai dengan query
//        let items = ["Apple", "Banana", "Orange", "Grapes", "Pineapple"]
//        let filteredItems = items.filter { $0.lowercased().contains(query.lowercased()) }
//        return Observable.just(filteredItems)
//            .delay(.milliseconds(500), scheduler: MainScheduler.instance) // Simulasi penundaan pencarian
//    }
//}
//
//import Foundation
//import RxSwift
//
//class CustomObservable {
//
//    let disposeBag = DisposeBag()
//
//    func emitNumbers() -> Observable<Int> {
//        return Observable.create { observer in
//            // Mengirimkan nilai dari 1 hingga 5
//            for number in 1...5 {
//                observer.onNext(number)
//                Thread.sleep(forTimeInterval: 1) // Memberi jeda 1 detik di antara pengiriman nilai
//            }
//            observer.onCompleted() // Mengirimkan event completed setelah selesai mengirimkan nilai
//            return Disposables.create()
//        }
//    }
//}
//
//// Contoh penggunaan Custom Observable
//let customObservable = CustomObservable()
//customObservable.emitNumbers()
//    .subscribe(onNext: { value in
//        print("Received value:", value)
//    }, onCompleted: {
//        print("Completed")
//    })
//    .disposed(by: customObservable.disposeBag)
//
//
//import Foundation
//import RxSwift
//
//class CustomObservable {
//
//    let disposeBag = DisposeBag()
//
//    func fetchDataFromAPI() -> Observable<String> {
//        return Observable.create { observer in
//            // Simulasi pemanggilan API dengan delay 2 detik
//            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//                // Simulasi hasil respons dari API
//                let responseData = "Data from API"
//                observer.onNext(responseData)
//                observer.onCompleted()
//            }
//            return Disposables.create()
//        }
//    }
//}
//
//// Contoh penggunaan Custom Observable
//let customObservable = CustomObservable()
//customObservable.fetchDataFromAPI()
//    .subscribe(onNext: { data in
//        print("Received data from API:", data)
//    }, onCompleted: {
//        print("API call completed")
//    })
//    .disposed(by: customObservable.disposeBag)
//
//
//import RxSwift
//
//class MyViewModel {
//    let disposeBag = DisposeBag()
//
//    func fetchData() {
//        fetchDataObservable()
//            .subscribe(onNext: { data in
//                print("Received data:", data)
//            })
//            .disposed(by: disposeBag) // Menggunakan DisposeBag untuk mengelola disposable
//    }
//}
//import RxSwift
//
//class MyViewModel {
//    let disposeBag = DisposeBag()
//
//    func fetchData() {
//        fetchDataObservable()
//            .takeUntil(self.rx.deallocated) // Auto-dispose ketika objek di-deallocated
//            .subscribe(onNext: { data in
//                print("Received data:", data)
//            })
//            .disposed(by: disposeBag)
//    }
//}
//
//
//import RxSwift
//
//class MyViewModel {
//    let disposeBag = DisposeBag()
//
//    func fetchData() {
//        fetchDataObservable()
//            .subscribe(onNext: { [weak self] data in // Menggunakan weak reference untuk self
//                guard let self = self else { return }
//                print("Received data:", data)
//            })
//            .disposed(by: disposeBag)
//    }
//}
