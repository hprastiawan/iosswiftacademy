//
//  UserListViewModel.swift
//  ProjectPertama
//
//  Created by Macbook on 25/02/24.
//

import Foundation
import RxSwift
import RxCocoa

enum LoadingState: String {
  case loading
  case finished
  case failed
}

class UserListViewModel {

  var articles = BehaviorRelay<PlaceHolder?>(value: nil)
  var loadingState = BehaviorRelay<LoadingState>(value: .loading)

  func fetchPlaceholder() {
    // Panggil fungsi fetchProductRequest melalui instance shared dari kelas NetworkManager
    loadingState.accept(.loading)
    NetworkManager.shared.fetchProductRequest(endpoint: .news, expecting: PlaceHolder.self) { result in
        switch result {
        case .success(let data):
            // Penanganan hasil jika permintaan berhasil
            print("Success: \(data)")
            self.loadingState.accept(.finished)
            self.articles.accept(data)
        case .failure(let error):
            // Penanganan kesalahan jika permintaan gagal
            print("Error: \(error)")
            self.loadingState.accept(.failed)
        }
    }
  }
}


//import Foundation
//import RxSwift
//
//class ViewModel {
//    let dataSubject = PublishSubject<String>() // Observable subject untuk menerbitkan data
//
//    func fetchData() {
//        // Mendapatkan data dari sumber
//        let newData = "Data baru dari sumber"
//        dataSubject.onNext(newData) // Menerbitkan data ke subscriber
//    }
//}
//
//import Foundation
//import RxSwift
//
//class ViewModel {
//    var data: BehaviorSubject<String> // Properti yang dapat diobservasi untuk data
//
//    init() {
//        // Inisialisasi properti dengan data awal
//        data = BehaviorSubject(value: "Data awal")
//    }
//}
//
//
//import Foundation
//
//class ViewModel {
//    var onDataUpdate: ((String) -> Void)? // Closure untuk mengirimkan data ke View
//
//    func fetchData() {
//        // Mendapatkan data dari sumber
//        let newData = "Data baru dari sumber"
//        onDataUpdate?(newData) // Memanggil closure untuk mengirimkan data ke View
//    }
//}
//
//import Foundation
//
//protocol ViewModelDelegate: AnyObject {
//    func dataDidUpdate(_ newData: String)
//}
//
//class ViewModel {
//    weak var delegate: ViewModelDelegate? // Delegate untuk mengirimkan data ke View
//
//    func fetchData() {
//        // Mendapatkan data dari sumber
//        let newData = "Data baru dari sumber"
//        delegate?.dataDidUpdate(newData) // Memanggil metode delegate untuk mengirimkan data ke View
//    }
//}


//struct Fruit {
//    let name: String
//}
//
//import Foundation
//import RxSwift
//import RxCocoa
//
//class FruitViewModel {
//    // Observable untuk data buah
//    let fruits: Driver<[Fruit]>
//
//    init() {
//        // Inisialisasi data awal
//        let initialFruits = [
//            Fruit(name: "Apple"),
//            Fruit(name: "Banana"),
//            Fruit(name: "Orange")
//        ]
//
//        // Mengubah data menjadi Observable dengan menggunakan Driver
//        fruits = Observable.just(initialFruits)
//            .observe(on: MainScheduler.instance) // Mengamati di MainScheduler
//            .asDriver(onErrorJustReturn: []) // Mengubah ke Driver
//    }
//}

//import UIKit
//import RxSwift
//import RxCocoa
//
//class FruitViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
//
//    let disposeBag = DisposeBag()
//    let viewModel = FruitViewModel() // Menginisialisasi ViewModel
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Menghubungkan data buah dari ViewModel ke tabel
//        viewModel.fruits
//            .drive(tableView.rx.items(cellIdentifier: "cell")) { index, fruit, cell in
//                cell.textLabel?.text = fruit.name
//            }
//            .disposed(by: disposeBag)
//    }
//}

//struct Fruit: Decodable {
//    let name: String
//}
//
//import Foundation
//import RxSwift
//
//class FruitService {
//    func fetchFruits() -> Observable<[Fruit]> {
//        return Observable.create { observer in
//            // Simulasi pengambilan data dari API
//            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//                let fruits = [
//                    Fruit(name: "Apple"),
//                    Fruit(name: "Banana"),
//                    Fruit(name: "Orange")
//                ]
//                observer.onNext(fruits)
//                observer.onCompleted()
//            }
//            return Disposables.create()
//        }
//    }
//}
//
//import Foundation
//import RxSwift
//import RxCocoa
//
//class FruitViewModel {
//    private let service = FruitService()
//
//    // Observable untuk data buah
//    var fruits: Observable<[Fruit]> {
//        return service.fetchFruits()
//            .observe(on: MainScheduler.instance) // Mengamati di MainScheduler
//            .catch { error in
//                print("Error fetching fruits: \(error)")
//                return Observable.just([])
//            }
//    }
//}
//
//import UIKit
//import RxSwift
//import RxCocoa
//
// class FruitViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
//
//    let disposeBag = DisposeBag()
//    let viewModel = FruitViewModel() // Menginisialisasi ViewModel
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Menghubungkan data buah dari ViewModel ke tabel
//        viewModel.fruits
//            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, fruit, cell in
//                cell.textLabel?.text = fruit.name
//            }
//            .disposed(by: disposeBag)
//    }
// }



