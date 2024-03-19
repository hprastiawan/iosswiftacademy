//
//  ExampleMultithreadingViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 24/02/24.
//

import UIKit

class ExampleMultithreadingViewController: UIViewController {

  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!


  override func viewDidLoad() {
    super.viewDidLoad()
//    exampleDispatchGroup()
    runningTask()

  }

  func simpleQueue() {
    // Membuat dispatch queue global
    let queue = DispatchQueue.global()

    // Menjalankan tugas secara asinkronus di dispatch queue global
    queue.async {
      // Kode untuk tugas yang akan dijalankan secara asinkronus

      // Misalnya, mencetak teks ke konsol
      print("Tugas dijalankan di thread \(Thread.current)")
    }
  }



  func exampleDispatchGroup() {
    // Membuat dispatch group
    let dispatchGroup = DispatchGroup()

    // Inisialisasi error optional
    var encounteredError: Error?

    // Tambahkan tugas pertama ke dalam dispatch group
    dispatchGroup.enter()
    fetchDataFromServer1 { result in
      switch result {
      case .success(let data):
        print("Data dari Server 1: \(data)")
        DispatchQueue.main.async {
          self.statusLabel.text = "Data dari Server 1: \(data)"
        }
      case .failure(let error):
        encounteredError = error
        print("Error dari Server 1: \(error)")
        dispatchGroup.leave()
      }
      // Tandai bahwa tugas pertama selesai
      dispatchGroup.leave()
    }

    // Tambahkan tugas kedua ke dalam dispatch group
    dispatchGroup.enter()
    fetchDataFromServer2 { result in
      switch result {
      case .success(let data):
        print("Data dari Server 2: \(data)")
        DispatchQueue.main.async {
          self.statusLabel.text = "Data dari Server 2: \(data)"
        }
      case .failure(let error):
        encounteredError = error
        print("Error dari Server 2: \(error)")
      }
      // Tandai bahwa tugas kedua selesai
      dispatchGroup.leave()
    }

    // Tunggu sampai semua tugas dalam dispatch group selesai
    dispatchGroup.notify(queue: .main) {
      if let error = encounteredError {
        // Menangani kesalahan yang terjadi jika ada
        print("Kesalahan yang terjadi: \(error)")
      } else {
        // Semua tugas berhasil diselesaikan tanpa kesalahan
        print("Semua tugas selesai tanpa kesalahan.")
      }
    }
  }

  func fetchDataFromServer1(completion: @escaping (Result<Data, Error>) -> Void) {
      // Contoh implementasi tugas asinkronus ke Server 1
      // Implementasi ini bisa berupa pengambilan data dari jaringan atau operasi lainnya
      // Kita hanya melakukan simulasi sederhana dengan mengirim data dummy
      DispatchQueue.global().async {
          // Data dummy
          let data = "Data dari Server 1".data(using: .utf8)!
          sleep(3)
          completion(.success(data))
      }
  }

  func fetchDataFromServer2(completion: @escaping (Result<Data, Error>) -> Void) {
      // Contoh implementasi tugas asinkronus ke Server 2
      // Implementasi ini bisa berupa pengambilan data dari jaringan atau operasi lainnya
      // Kita hanya melakukan simulasi sederhana dengan mengirim data dummy
      DispatchQueue.global().async {
          // Data dummy
          sleep(3)
          let data = "Data dari Server 2".data(using: .utf8)!
          completion(.success(data))
      }
  }


  @IBAction func startTask(_ sender: Any) {

    // Mengubah teks label menjadi "Sedang Memproses..."
    statusLabel.text = "Sedang Memproses..."

    // Membuat dispatch queue global untuk menjalankan tugas secara asinkronus
    let queue = DispatchQueue.global()

    // Menjalankan tugas secara asinkronus di dispatch queue
    queue.async {
      // Kode untuk tugas yang akan dijalankan secara asinkronus

      // Menggunakan sleep untuk mensimulasikan tugas yang memakan waktu
      sleep(3)

      // Kembali ke thread utama untuk memperbarui antarmuka pengguna
      DispatchQueue.main.async {
        // Mengubah teks label menjadi "Selesai"
        self.statusLabel.text = "Selesai"
      }
    }
  }

  @IBAction func downloadImage(_ sender: UIButton) {
    // Mengubah teks label menjadi "Downloading..."
    statusLabel.text = "Downloading..."

    // Membuat dispatch queue global untuk menjalankan tugas secara asinkronus
    let queue = DispatchQueue.global()

    // Menjalankan tugas secara asinkronus di dispatch queue
    queue.async {
      // Kode untuk tugas yang akan dijalankan secara asinkronus

      // URL gambar yang akan diunduh
      let imageUrlString = "https://images.unsplash.com/photo-1682695794947-17061dc284dd?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"

      // Membuat URL dari string URL
      if let imageUrl = URL(string: imageUrlString) {
        // Mengunduh data gambar dari URL
        if let imageData = try? Data(contentsOf: imageUrl) {
          // Mengubah data gambar menjadi gambar
          if let image = UIImage(data: imageData) {
            // Kembali ke thread utama untuk memperbarui antarmuka pengguna
            DispatchQueue.main.async {
              // Menampilkan gambar di imageView
              self.imageView.image = image
              // Mengubah teks label menjadi "Download Complete"
              self.statusLabel.text = "Download Complete"
            }
          }
        } else {
          // Kembali ke thread utama untuk memperbarui antarmuka pengguna
          DispatchQueue.main.async {
            // Mengubah teks label menjadi "Download Failed"
            self.statusLabel.text = "Download Failed"
          }
        }
      } else {
        // Kembali ke thread utama untuk memperbarui antarmuka pengguna
        DispatchQueue.main.async {
          // Mengubah teks label menjadi "Invalid URL"
          self.statusLabel.text = "Invalid URL"
        }
      }
    }
  }

}



extension ExampleMultithreadingViewController {

  // Enum untuk menangani kesalahan saat pengambilan data
  enum APIError: Error {
      case requestTimedOut
      case failedToGetData
      case decodingError
  }

  // Fungsi untuk mengambil data JSON dari URL
  func fetchDataFromURL<T: Decodable>(url: URL, type: T.Type) async throws -> T {
      do {
          // Menggunakan try await untuk menunggu hasil tugas asinkronus
          let (data, _) = try await URLSession.shared.data(from: url)

          // Deserialisasi JSON
          let result = try JSONDecoder().decode(type, from: data)
          return result
      } catch let error as NSError {
          // Menangani error koneksi
          if error.code == NSURLErrorTimedOut {
              throw APIError.requestTimedOut
          } else {
              throw APIError.failedToGetData
          }
      } catch {
          throw APIError.decodingError
      }
  }

  func runningTask() {
    // Menjalankan async tasks untuk fetch data dari beberapa URL
    Task {
        do {
            // URLs tempat data JSON tersedia
            let url1 = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            let url2 = URL(string: "https://jsonplaceholder.typicode.com/posts")!

            let data1: PlaceHolder = try await fetchDataFromURL(url: url1, type: PlaceHolder.self)
            let data2: PlaceHolder = try await fetchDataFromURL(url: url2, type: PlaceHolder.self)

            // Memprint hasil
            print("Data JSON dari URL 1: \(data1)")
            print("Data JSON dari URL 2: \(data2)")
        } catch {
            // Menangani kesalahan yang terjadi
            print("Error saat mengambil data: \(error)")
        }
    }
  }



}
