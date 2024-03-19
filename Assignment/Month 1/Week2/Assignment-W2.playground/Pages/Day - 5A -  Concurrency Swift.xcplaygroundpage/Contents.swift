//: [Previous](@previous)

import Foundation

// MARK: Concurrency Swift ☀️

//------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 5: 🏖️🏖️

/*
MARK: Soal 1
 Apa perbedaan antara Concurrent dan Serial Dispatch Queue di Grand Central Dispatch (GCD)?
 Mengapa kita perlu menggunakan concurrency dalam pengembangan aplikasi iOS?
 Jelaskan konsep "race condition" dalam konteks konkurensi dan bagaimana cara menghindarinya di Swift.
 Buatlah Implementasi Concurrency Dengan GCD.

 */

// MARK:  Jawaban Soal Poin 5:

/*
 MARK: Perbedaan antara Concurrent dan Serial Dispatch Queue di Grand Central Dispatch (GCD):
 MARK: Serial Dispatch Queue:
 Menjalankan tugas secara berurutan satu per satu, artinya tugas berikutnya tidak dimulai sebelum tugas sebelumnya selesai. Ini memastikan bahwa tugas dijalankan dalam urutan yang ditentukan.
 MARK: Concurrent Dispatch Queue:
 Menjalankan tugas secara bersamaan atau paralel, artinya beberapa tugas dapat berjalan secara bersamaan. Namun, urutan penyelesaian tugas tidak dijamin.
 */

/*
 MARK: Mengapa kita perlu menggunakan concurrency dalam pengembangan aplikasi iOS?
 Concurrency memungkinkan aplikasi untuk melakukan beberapa tugas secara bersamaan, meningkatkan responsifitas dan kinerja aplikasi.
 Dengan concurrency, aplikasi dapat melakukan tugas-tugas latar belakang seperti pengunduhan data, pemrosesan gambar, atau pembaruan antarmuka pengguna tanpa menghambat responsifitas aplikasi.
 */

/*
 MARK: Konsep "race condition" dalam konteks konkurensi dan cara menghindarinya di Swift:
 "Race condition" terjadi ketika dua atau lebih proses berusaha mengakses atau memodifikasi sumber daya bersama tanpa sinkronisasi yang memadai, yang dapat menyebabkan hasil yang tidak terduga atau tidak konsisten.
 Untuk menghindari "race condition", kita dapat menggunakan teknik sinkronisasi seperti penggunaan Dispatch Queue dengan mekanisme yang tepat, penggunaan lock, atau penggunaan semafor.
 */

/*
 MARK: Berikut adalah contoh lengkap implementasi GCD (Grand Central Dispatch) dalam Swift:
 */


// Membuat sebuah concurrent dispatch queue
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

// Membuat sebuah serial dispatch queue
let serialQueue = DispatchQueue(label: "com.example.serialQueue")

// Eksekusi tugas di dalam concurrent queue secara bersamaan
concurrentQueue.async {
    for i in 1...5 {
        print("Tugas \(i) dijalankan secara bersamaan di concurrentQueue")
    }
}

// Eksekusi tugas di dalam serial queue secara berurutan
serialQueue.async {
    for i in 1...5 {
        print("Tugas \(i) dijalankan secara berurutan di serialQueue")
    }
}

// Dispatch Work Item untuk mengatur tugas yang akan dieksekusi
let workItem = DispatchWorkItem {
    print("Ini adalah tugas yang dijadwalkan dengan Dispatch Work Item")
}

// Jadwalkan eksekusi tugas dengan Dispatch Work Item
DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
    workItem.perform()
}

// Menunggu selesainya semua tugas di queue global
DispatchQueue.global().async {
    print("Menunggu selesainya semua tugas di queue global")
    DispatchQueue.main.sync {
        print("Semua tugas di queue global telah selesai")
    }
}

// Menunggu selesainya tugas di queue main
DispatchQueue.main.async {
    print("Menunggu selesainya tugas di queue main")
}

// Dispatch group untuk mengelompokkan beberapa tugas
let group = DispatchGroup()

// Tambahkan tugas ke dalam group
group.enter()
concurrentQueue.async {
    print("Tugas 1 dijalankan dalam group")
    group.leave()
}

group.enter()
concurrentQueue.async {
    print("Tugas 2 dijalankan dalam group")
    group.leave()
}

// Memberikan handler penyelesaian untuk group
group.notify(queue: .main) {
    print("Semua tugas dalam group telah selesai")
}


//------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 10: 🏖️🏖️

/*
MARK: Soal 1
 Bagaimana cara menggunakan async/await untuk menulis kode asynchronous yang bersih di Swift?

 Jelaskan perbedaan antara DispatchQueue.global() dan DispatchQueue.main dalam Grand Central Dispatch (GCD).

 Bagaimana Anda menangani error dalam asynchronous code menggunakan async/await?


 */

// MARK:  Jawaban Soal Poin 10:
/*
 MARK: Penggunaan async/await untuk Kode Asynchronous yang Bersih di Swift:
 MARK: Async/await:
 adalah fitur baru dalam Swift yang memungkinkan penulisan kode asynchronous dengan lebih bersih dan mudah dimengerti. Berikut adalah langkah-langkah penggunaannya:

 MARK: Menandai Fungsi dengan Async:
 Gunakan kata kunci async sebelum deklarasi fungsi untuk menunjukkan bahwa fungsi tersebut asynchronous.

 MARK: Menunggu Hasil dengan Await:
 Di dalam fungsi yang ditandai sebagai async, gunakan kata kunci await sebelum pemanggilan fungsi atau ekspresi yang mengembalikan nilai asynchronous. Ini akan menunda eksekusi hingga nilai dikembalikan.
 Contoh Penggunaan:
 */

func fetchData() async throws -> Data {
    // Melakukan panggilan asynchronous
    let data = try await URLSession.shared.data(from: URL(string: "https://example.com")!)
    return data.0
}

async {
    do {
        let data = try await fetchData()
        print("Data diterima: \(data)")
    } catch {
        print("Terjadi kesalahan: \(error)")
    }
}


/*
MARK: Perbedaan antara DispatchQueue.global() dan DispatchQueue.main dalam GCD:
MARK: DispatchQueue.global():
 Merupakan dispatch queue global yang digunakan untuk menjalankan tugas-tugas latar belakang secara asynchronous. Biasanya digunakan untuk tugas-tugas yang membutuhkan waktu lama agar tidak menghambat antarmuka pengguna.
MARK:  DispatchQueue.main:
 Merupakan dispatch queue yang terkait dengan antarmuka pengguna (UI). Semua tugas yang berhubungan dengan pembaruan antarmuka pengguna harus dijalankan di dalam dispatch queue ini untuk memastikan keselarasan antarmuka pengguna.
 */


/*
 MARK: Penanganan Error dalam Asynchronous Code menggunakan async/await:
 Dalam async/await, Anda dapat menangani error dengan cara yang mirip dengan penanganan error di kode synchronous. Anda dapat menggunakan do-catch untuk menangkap error yang dilempar oleh ekspresi yang diawasi (awaited).

 Contoh:
 */

async {
    do {
        let data = try await fetchData()
        print("Data diterima: \(data)")
    } catch {
        print("Terjadi kesalahan: \(error)")
    }
}



//------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 15: 🏖️🏖️

/*
MARK: Soal 1
 Jelaskan konsep "Deadlock" dalam pemrograman konkurensi dan berikan contoh implementasi di Swift.

 Bagaimana cara membuat dan menggunakan async let dalam Swift untuk menjalankan beberapa tugas secara konkuren?

 Jelaskan perbedaan antara Task dan async/await dalam pemrograman konkurensi di Swift.

 Buatlah class yang menerapkan konkurensi async/await  dengan handle Error menggunakan Enum


 */

// MARK:  Jawaban Soal Poin 15:

/*
 MARK: Deadlock dalam Pemrograman Konkurensi:
 Deadlock terjadi ketika dua atau lebih proses saling menunggu untuk mendapatkan sumber daya yang dipegang oleh proses lain, sehingga tidak ada proses yang dapat dilanjutkan. Ini biasanya terjadi dalam konteks konkurensi ketika terdapat dua atau lebih thread yang saling menunggu untuk mengakses sumber daya yang terkunci.

 Contoh implementasi deadlock dalam Swift menggunakan GCD:
 */


let serialQueue1 = DispatchQueue(label: "com.example.serialQueue1")
let serialQueue2 = DispatchQueue(label: "com.example.serialQueue2")

serialQueue1.async {
    serialQueue2.sync {
        print("Task di serialQueue2 yang menunggu untuk mengakses serialQueue1")
    }
    print("Task di serialQueue1")
}

serialQueue2.async {
    serialQueue1.sync {
        print("Task di serialQueue1 yang menunggu untuk mengakses serialQueue2")
    }
    print("Task di serialQueue2")
}

/*
 Dalam contoh di atas, serialQueue1 dan serialQueue2 saling menunggu satu sama lain untuk menyelesaikan tugasnya, yang mengakibatkan deadlock.
*/

/*
MARK:  Penggunaan async let untuk Menjalankan Tugas Secara Konkuren:
 async let digunakan untuk menjalankan beberapa tugas secara konkuren dan menunggu hingga semuanya selesai. Ini memungkinkan kita untuk menjalankan beberapa tugas secara asynchronous dan menggabungkan hasilnya secara bersamaan.

 Contoh penggunaan async let:
 */

async let result1 = someAsyncFunction1()
async let result2 = someAsyncFunction2()

let finalResult = await result1 + await result2


/*
 MARK: Perbedaan antara Task dan async/await dalam Pemrograman Konkurensi:
 MARK: Task:
 Mewakili sebuah tugas asynchronous yang dapat dijalankan secara konkuren. Task dapat memiliki status dan dapat dimulai, dijalankan, dan dibatalkan secara eksplisit.
 MARK: async/await:
 Merupakan cara untuk menulis kode asynchronous yang lebih bersih dan mudah dimengerti. Dengan menggunakan async/await, kita dapat menulis kode asynchronous seperti kode synchronous, membuatnya lebih mudah dipahami.
 */

/*
 MARK: Contoh Implementasi Class dengan Konkurensi async/await dan Penanganan Error Menggunakan Enum:
 */

enum NetworkError: Error {
    case connectionError
    case serverError
}

class NetworkManager {
    func fetchData() async throws -> Data {
        // Melakukan panggilan jaringan asynchronous
        // ...
        // Menunggu dan mengembalikan hasil
        return Data()
    }
}

class DataProcessor {
    let networkManager = NetworkManager()

    func processData() async throws -> Result<Data, NetworkError> {
        do {
            let data = try await networkManager.fetchData()
            // Proses data
            return .success(data)
        } catch {
            return .failure(.connectionError)
        }
    }
}

// Menggunakan async/await untuk memanggil async function dan menangani error
async {
    do {
        let processor = DataProcessor()
        let result = try await processor.processData()
        switch result {
        case .success(let data):
            print("Data berhasil diproses: \(data)")
        case .failure(let error):
            print("Terjadi kesalahan: \(error)")
        }
    } catch {
        print("Terjadi kesalahan: \(error)")
    }
}

//: [Next](@next)
