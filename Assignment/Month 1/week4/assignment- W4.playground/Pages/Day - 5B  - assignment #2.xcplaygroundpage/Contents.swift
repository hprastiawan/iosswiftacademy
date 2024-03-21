//: [Previous](@previous)

import Foundation

// MARK: Assignment 2 Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Error Handling :

/*
 MARK: Soal 1: Error Handling


 MARK: Error Handling dalam Aplikasi (20 points):
 - Efektivitas dalam menangani dan merespons berbagai jenis kesalahan yang dapat terjadi.
 - Penggunaan try, catch, dan throw yang tepat dalam konteks aplikasi.


 TODO: Soal Error Handling | Pilih Salah Satu

 1. Anda sedang mengembangkan aplikasi manajemen file yang mencoba membuka file teks. Implementasikan error handling untuk menangani situasi di mana file yang diminta tidak dapat ditemukan atau tidak dapat dibuka. Buatlah sebuah fungsi yang menerima path file sebagai parameter, dan jika file berhasil dibuka, cetak isinya ke konsol; jika gagal, tangani error yang muncul dengan memberikan pesan yang sesuai kepada pengguna.


 2. Dalam pengembangan aplikasi perbankan, Anda memiliki sebuah fungsi yang mencoba mentransfer dana dari satu rekening ke rekening lainnya. Implementasikan error handling untuk menangani situasi di mana transaksi gagal dilakukan karena saldo yang tidak mencukupi pada rekening sumber atau rekening tujuan tidak valid. Pastikan untuk memberikan pesan yang sesuai dalam kasus transaksi gagal.


 3. Anda sedang mengembangkan aplikasi penjadwalan acara yang memungkinkan pengguna untuk menambahkan acara baru ke dalam kalender mereka. Implementasikan error handling untuk menangani situasi di mana pengguna mencoba menambahkan acara yang bertabrakan dengan acara lain di kalender mereka. Buatlah sebuah fungsi yang menerima detail acara sebagai parameter, dan jika acara berhasil ditambahkan, tambahkan ke kalender; jika gagal, kembalikan error yang sesuai untuk menunjukkan konflik dengan acara yang sudah ada.

 4. Anda sedang mengembangkan aplikasi e-commerce yang terhubung ke server untuk mengambil data produk. Implementasikan error handling untuk menangani situasi di mana koneksi ke server gagal atau data produk tidak dapat diambil karena alasan tertentu, seperti kesalahan jaringan atau server tidak responsif. Pastikan untuk memberikan pesan yang sesuai kepada pengguna dan melakukan tindakan pemulihan yang memungkinkan.


 5. Dalam pengembangan aplikasi pengiriman barang, Anda memiliki sebuah fungsi yang mencoba menghitung estimasi biaya pengiriman berdasarkan lokasi pengambilan dan pengiriman serta berat barang. Implementasikan error handling untuk menangani situasi di mana lokasi yang dimasukkan tidak valid atau berat barang melebihi batas yang diizinkan untuk pengiriman tertentu. Pastikan untuk memberikan pesan yang jelas tentang masalah yang terjadi dan memberikan opsi alternatif jika memungkinkan.


 6. Anda sedang mengembangkan aplikasi permainan dengan mode multiplayer online. Implementasikan error handling untuk menangani situasi di mana koneksi ke server multiplayer terputus saat permainan sedang berlangsung. Pastikan untuk menyimpan progress permainan secara lokal dan memberikan opsi kepada pemain untuk melakukan rekoneksi atau memulai kembali permainan saat koneksi kembali tersedia. Jelaskan bagaimana Anda akan menangani kasus-kasus yang berbeda, seperti pemain yang terputus saat giliran mereka atau saat sedang melakukan aksi penting dalam permainan.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚


// MARK: Berikut adalah implementasi untuk masing-masing soal:

// MARK: 1. Error handling untuk membuka file teks:

enum FileError: Error {
    case fileNotFound
    case fileOpenError
}

func readFile(atPath path: String) throws {
    guard let content = try? String(contentsOfFile: path) else {
        throw FileError.fileNotFound
    }
    print(content)
}

do {
    try readFile(atPath: "example.txt")
} catch FileError.fileNotFound {
    print("File not found.")
} catch {
    print("An error occurred while opening the file.")
}


// MARK: 2. Error handling untuk mentransfer dana antar rekening:

enum TransferError: Error {
    case insufficientBalance
    case invalidAccount
}

func transferFunds(fromAccount: Account, toAccount: Account, amount: Double) throws {
    guard fromAccount.balance >= amount else {
        throw TransferError.insufficientBalance
    }
    guard toAccount.isValid else {
        throw TransferError.invalidAccount
    }

    fromAccount.withdraw(amount: amount)
    toAccount.deposit(amount: amount)
    print("Transfer successful.")
}

do {
    try transferFunds(fromAccount: sourceAccount, toAccount: destinationAccount, amount: 100.0)
} catch TransferError.insufficientBalance {
    print("Insufficient balance in the source account.")
} catch TransferError.invalidAccount {
    print("Invalid destination account.")
} catch {
    print("An error occurred while processing the transfer.")
}

// MARK: 3. Error handling untuk penjadwalan acara:

struct Event {
    var date: Date
    var description: String
}

enum ScheduleError: Error {
    case eventConflict
}

func addEvent(_ event: Event, toCalendar calendar: [Event]) throws -> [Event] {
    for existingEvent in calendar {
        if existingEvent.date == event.date {
            throw ScheduleError.eventConflict
        }
    }
    return calendar + [event]
}

do {
    calendar = try addEvent(newEvent, toCalendar: calendar)
} catch ScheduleError.eventConflict {
    print("Event conflicts with an existing event.")
} catch {
    print("An error occurred while adding the event.")
}

// MARK: 4. Error handling untuk mengambil data produk dari server e-commerce:

enum NetworkError: Error {
    case connectionFailed
    case dataUnavailable
}

func fetchData() throws -> Data {
    guard let data = try? fetchDataFromServer() else {
        throw NetworkError.dataUnavailable
    }
    return data
}

do {
    let data = try fetchData()
    // Process the data
} catch NetworkError.connectionFailed {
    print("Failed to connect to the server.")
} catch NetworkError.dataUnavailable {
    print("Data unavailable. Please try again later.")
} catch {
    print("An error occurred while fetching data.")
}

// 5. Untuk menangani error pada perhitungan estimasi biaya pengiriman, Anda dapat menggunakan mekanisme error handling Swift, yaitu dengan menggunakan throw untuk melemparkan error dan do-catch untuk menangkapnya. Berikut adalah contoh implementasinya:


enum ShippingError: Error {
    case invalidLocation
    case overweight
}

func calculateShippingCost(from pickupLocation: String, to deliveryLocation: String, weight: Double) throws -> Double {
    // Cek apakah lokasi pengambilan dan pengiriman valid
    guard isValidLocation(pickupLocation) && isValidLocation(deliveryLocation) else {
        throw ShippingError.invalidLocation
    }

    // Cek apakah berat barang tidak melebihi batas yang diizinkan
    let maxWeight: Double = 100.0 // Misalnya, batas maksimal adalah 100 kg
    guard weight <= maxWeight else {
        throw ShippingError.overweight
    }

    // Hitung estimasi biaya pengiriman (contoh implementasi sederhana)
    let costPerKg: Double = 10.0 // Misalnya, biaya per kg adalah $10
    let shippingCost = weight * costPerKg

    return shippingCost
}

// Fungsi untuk mengecek apakah lokasi valid (contoh implementasi sederhana)
func isValidLocation(_ location: String) -> Bool {
    // Lakukan pengecekan, misalnya dengan membandingkan dengan daftar lokasi yang valid
    let validLocations = ["Jakarta", "Surabaya", "Bandung"]
    return validLocations.contains(location)
}

// Contoh penggunaan
do {
    let estimatedCost = try calculateShippingCost(from: "Jakarta", to: "Surabaya", weight: 80.0)
    print("Estimasi biaya pengiriman: $\(estimatedCost)")
} catch ShippingError.invalidLocation {
    print("Lokasi pengambilan atau pengiriman tidak valid.")
} catch ShippingError.overweight {
    print("Berat barang melebihi batas yang diizinkan.")
} catch {
    print("Terjadi kesalahan: \(error)")
}

// Untuk menangani koneksi terputus saat permainan multiplayer online, Anda dapat menggunakan error handling untuk mengidentifikasi situasi koneksi terputus. Jika koneksi terputus, simpan progress permainan secara lokal dan berikan opsi kepada pemain untuk melakukan rekoneksi atau memulai kembali permainan saat koneksi kembali tersedia. Berikut adalah contoh implementasinya:


enum MultiplayerError: Error {
    case connectionLost
}

class MultiplayerGameManager {
    var gameProgress: GameProgress = .inProgress

    func playTurn() throws {
        // Lakukan aksi penting dalam permainan

        // Simulasi koneksi terputus
        let isConnectionLost = arc4random_uniform(2) == 1
        if isConnectionLost {
            throw MultiplayerError.connectionLost
        }

        // Lanjutkan permainan jika koneksi masih aktif
        // ...
    }
}

// Contoh penggunaan
let gameManager = MultiplayerGameManager()

do {
    try gameManager.playTurn()
    print("Aksi penting berhasil dilakukan.")
} catch MultiplayerError.connectionLost {
    print("Koneksi ke server terputus. Menyimpan progress permainan secara lokal...")
    // Simpan progress permainan secara lokal
    gameManager.gameProgress = .paused
    print("Silakan coba lagi nanti atau koneksi kembali tersedia.")
} catch {
    print("Terjadi kesalahan: \(error)")
}

// Dalam kasus pemain yang terputus saat giliran mereka, Anda dapat menyimpan status permainan saat ini dan memberikan opsi kepada pemain untuk melanjutkan giliran mereka saat mereka kembali terkoneksi. Sedangkan dalam kasus pemain yang terputus saat melakukan aksi penting dalam permainan, Anda dapat menyimpan progress permainan secara lokal dan memberikan opsi kepada pemain untuk melanjutkan permainan saat koneksi kembali tersedia.



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Concurrency:

/*
 MARK: Soal 1: Concurrency


 MARK: Pengelolaan Concurrency (20 points):
 - Penerapan concurrency untuk mengoptimalkan proses pemesanan dan pelacakan.
 - Kemampuan untuk menangani aktivitas simultan tanpa mempengaruhi performa aplikasi.



 TODO: Soal Concurrency | Pilih Salah Satu

 1. Anda sedang mengembangkan aplikasi untuk mengunduh gambar dari server secara asinkron. Implementasikan concurrency menggunakan DispatchQueue untuk membuat fungsi yang mengunduh gambar dari URL yang diberikan. Pastikan agar proses pengunduhan dilakukan secara asinkron agar tidak menghambat antarmuka pengguna. Setelah unduhan selesai, tampilkan gambar tersebut di antarmuka pengguna.


 2. Dalam pengembangan aplikasi pelacakan cuaca, Anda memiliki fungsi yang mengambil data cuaca dari server untuk beberapa lokasi yang berbeda. Implementasikan concurrency dengan menggunakan OperationQueue untuk membuat beberapa operasi yang mengambil data cuaca untuk lokasi-lokasi tersebut secara bersamaan. Setelah semua data cuaca telah diambil, gabungkan hasilnya dan tampilkan informasi cuaca yang relevan kepada pengguna.


 3. Anda sedang mengembangkan aplikasi untuk menghitung nilai Fibonacci secara rekursif dengan memanfaatkan konsep concurrency. Implementasikan rekursi konkuransi menggunakan DispatchGroup atau OperationQueue untuk menghitung nilai Fibonacci dari urutan yang diberikan secara paralel. Pastikan untuk menangani kasus-kasus khusus seperti ketika urutan yang diberikan negatif atau ketika perhitungan memakan waktu terlalu lama.

 4. Anda sedang mengembangkan aplikasi pengeditan foto yang memungkinkan pengguna untuk menerapkan berbagai efek pada gambar. Implementasikan concurrency menggunakan GCD (Grand Central Dispatch) untuk memproses efek-efek tersebut secara paralel. Setiap efek akan diterapkan pada salinan gambar asli, dan hasil dari semua efek yang diterapkan akan digabungkan kembali untuk ditampilkan kepada pengguna. Pastikan untuk menghindari deadlock dan menangani kasus di mana beberapa efek bergantung pada hasil dari efek lainnya.


 5. Dalam pengembangan aplikasi manajemen data besar, Anda memiliki tugas untuk mengimpor sejumlah besar data dari server ke dalam basis data lokal. Implementasikan concurrency dengan menggunakan DispatchSemaphore untuk mengimpor data secara paralel ke dalam basis data lokal. Pastikan untuk mengontrol jumlah maksimum operasi yang berjalan secara bersamaan agar tidak menghabiskan terlalu banyak sumber daya sistem.


 6. Anda sedang mengembangkan aplikasi untuk memproses dan menganalisis data sensor dari perangkat IoT. Implementasikan concurrency dengan menggunakan Operation dan OperationQueue untuk memproses data sensor dari beberapa perangkat secara bersamaan. Setiap perangkat akan memiliki tugas pemrosesan data yang terpisah, dan hasilnya akan digabungkan kembali untuk analisis lebih lanjut. Pastikan untuk menangani penguncian sumber daya yang mungkin terjadi dan memastikan konsistensi data selama proses pemrosesan.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚


// MARK: Berikut adalah implementasi untuk masing-masing soal:

// MARK: 1.Unduh gambar secara asinkron menggunakan DispatchQueue:

import UIKit

func downloadImage(fromURL url: URL, completion: @escaping (UIImage?) -> Void) {
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            DispatchQueue.main.async {
                completion(image)
            }
        } else {
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
}

// Contoh penggunaan
let imageURL = URL(string: "https://example.com/image.jpg")!
downloadImage(fromURL: imageURL) { image in
    if let image = image {
        // Tampilkan gambar di antarmuka pengguna
    } else {
        print("Failed to download image.")
    }
}


// MARK: 2. Mengambil data cuaca untuk beberapa lokasi menggunakan OperationQueue:

import Foundation

func fetchWeatherData(forLocations locations: [String], completion: @escaping ([String: Weather]) -> Void) {
    var weatherData = [String: Weather]()
    let queue = OperationQueue()
    let completionOperation = BlockOperation {
        completion(weatherData)
    }
    for location in locations {
        let operation = BlockOperation {
            let weather = fetchWeather(forLocation: location)
            weatherData[location] = weather
        }
        completionOperation.addDependency(operation)
        queue.addOperation(operation)
    }
    OperationQueue.main.addOperation(completionOperation)
}

// Fungsi pengambilan data cuaca untuk setiap lokasi
func fetchWeather(forLocation location: String) -> Weather {
    // Lakukan pengambilan data cuaca dari server
    return Weather() // Mengembalikan data cuaca
}

// Struktur data cuaca
struct Weather {
    // Definisikan properti data cuaca
}

// Contoh penggunaan
let locations = ["New York", "London", "Tokyo"]
fetchWeatherData(forLocations: locations) { weatherData in
    // Tampilkan informasi cuaca kepada pengguna
}

// MARK: 3. Menghitung nilai Fibonacci secara rekursif dengan menggunakan DispatchGroup atau OperationQueue:

import Foundation

func calculateFibonacci(sequenceLength: Int, completion: @escaping ([Int]?) -> Void) {
    guard sequenceLength > 0 else {
        completion(nil)
        return
    }

    let group = DispatchGroup()
    var fibonacciSequence = [Int]()

    for i in 0..<sequenceLength {
        group.enter()
        DispatchQueue.global().async {
            let fibonacciNumber = fibonacci(of: i)
            fibonacciSequence.append(fibonacciNumber)
            group.leave()
        }
    }

    group.notify(queue: .main) {
        completion(fibonacciSequence)
    }
}

func fibonacci(of n: Int) -> Int {
    if n <= 1 {
        return n
    } else {
        return fibonacci(of: n - 1) + fibonacci(of: n - 2)
    }
}

// Contoh penggunaan
calculateFibonacci(sequenceLength: 10) { sequence in
    if let sequence = sequence {
        print("Fibonacci Sequence: \(sequence)")
    } else {
        print("Invalid sequence length.")
    }
}

// MARK: 4. Mengedit gambar dengan efek-efek secara paralel menggunakan GCD:

import UIKit

func applyEffectsToImage(_ image: UIImage, effects: [Effect], completion: @escaping (UIImage?) -> Void) {
    DispatchQueue.global().async {
        var processedImage = image

        let group = DispatchGroup()
        for effect in effects {
            group.enter()
            DispatchQueue.global().async {
                processedImage = effect.apply(to: processedImage)
                group.leave()
            }
        }

        group.notify(queue: .main) {
            completion(processedImage)
        }
    }
}

// Contoh penggunaan
let image = UIImage(named: "example_image")
let effects: [Effect] = [BlurEffect(), ColorAdjustmentEffect(), RotateEffect()]
applyEffectsToImage(image, effects: effects) { processedImage in
    if let processedImage = processedImage {
        // Tampilkan gambar dengan efek-efek yang sudah diterapkan
    } else {
        print("Failed to apply effects to the image.")
    }
}

// MARK: 5. Mengimpor data secara paralel ke dalam basis data lokal menggunakan DispatchSemaphore:

import Foundation

func importData(from server: Server, into database: Database) {
    let semaphore = DispatchSemaphore(value: 5) // Batasi jumlah operasi yang berjalan secara bersamaan

    for data in server.data {
        semaphore.wait() // Menunggu hingga semaphore menjadi available

        DispatchQueue.global().async {
            database.importData(data)
            semaphore.signal() // Memberi tahu semaphore bahwa operasi telah selesai
        }
    }
}

// Contoh penggunaan
let server = Server()
let database = Database()

importData(from: server, into: database)


// MARK: 5. Mengimpor data secara paralel ke dalam basis data lokal menggunakan DispatchSemaphore:

import Foundation

func importData(from server: Server, into database: Database) {
    let semaphore = DispatchSemaphore(value: 5) // Batasi jumlah operasi yang berjalan secara bersamaan

    for data in server.data {
        semaphore.wait() // Menunggu hingga semaphore menjadi available

        DispatchQueue.global().async {
            database.importData(data)
            semaphore.signal() // Memberi tahu semaphore bahwa operasi telah selesai
        }
    }
}

// Contoh penggunaan
let server = Server()
let database = Database()

importData(from: server, into: database)


// MARK: 6. Memproses data sensor dari perangkat IoT secara paralel menggunakan Operation dan OperationQueue:

import Foundation

class SensorProcessingOperation: Operation {
    let sensorData: SensorData

    init(sensorData: SensorData) {
        self.sensorData = sensorData
    }

    override func main() {
        // Proses data sensor
    }
}

func processSensorData(from devices: [IoTDevice]) {
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 5 // Batasi jumlah operasi yang berjalan secara bersamaan

    for device in devices {
        let operation = SensorProcessingOperation(sensorData: device.sensorData)
        queue.addOperation(operation)
    }
}

// Contoh penggunaan
let devices: [IoTDevice] = // Array of IoT devices
processSensorData(from: devices)

//: [Next](@next)
