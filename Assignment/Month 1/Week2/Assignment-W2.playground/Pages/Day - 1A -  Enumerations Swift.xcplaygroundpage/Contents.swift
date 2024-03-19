//: [Previous](@previous)

import Foundation


// MARK: Enumerations Swift ☀️😃🥳


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal :

/*
 MARK: Soal 1: Basic Enumeration
 Diberikan enum Color dengan kasus-kasus: red, green, dan blue. Buatlah pernyataan switch untuk mengeluarkan pesan berbeda sesuai dengan setiap warna.

 MARK: Soal 2: Enumeration with Associated Values
 Buat enum CarStatus yang memiliki dua kasus: running(speed: Double) dan stopped. Tulis fungsi untuk mengecek status mobil dan mencetak kecepatannya jika mobil sedang berjalan.

 MARK: Soal 3: Enumeration Iteration
 Buat enum Month dengan kasus-kasus: january, february, hingga december. Gunakan protokol CaseIterable untuk membuat array dengan semua bulan. Cetak nama bulan pada setiap iterasi.


 */


// MARK: JAWABAN Basic Enumeration

// Soal 1: Basic Enumeration
enum Color {
    case red, green, blue
}

let color = Color.green

switch color {
case .red:
    print("Warna merah dipilih.")
case .green:
    print("Warna hijau dipilih.")
case .blue:
    print("Warna biru dipilih.")
}

// MARK: JAWABAN Enumeration with Associated Values

// Soal 2: Enumeration with Associated Values
enum CarStatus {
    case running(speed: Double)
    case stopped
}

func checkCarStatus(status: CarStatus) {
    switch status {
    case .running(let speed):
        print("Mobil sedang berjalan dengan kecepatan \(speed) km/jam.")
    case .stopped:
        print("Mobil sedang berhenti.")
    }
}

let carStatus1 = CarStatus.running(speed: 80.0)
let carStatus2 = CarStatus.stopped

checkCarStatus(status: carStatus1)
checkCarStatus(status: carStatus2)

// MARK: JAWABAN Enumeration Iteration

// Soal 3: Enumeration Iteration
enum Month: CaseIterable {
    case january, february, march, april, may, june, july, august, september, october, november, december
}

for month in Month.allCases {
    print("Bulan:", month)
}


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal :

/*
 MARK: Soal 4: Recursive Enumeration
 Buat enum ArithmeticExpression yang mendukung operasi aritmatika sederhana seperti penjumlahan dan perkalian. Implementasikan evaluasi ekspresi secara rekursif dan berikan contoh penggunaan.

 MARK: Soal 5: Enumeration dengan Generic
 Buat enum generic Result<T> dengan dua kasus: success(T) dan failure(String). Berikan metode untuk memeriksa apakah hasil adalah sukses atau kegagalan.

 MARK: Soal 6: Enumeration dan Protocol
 Buat protokol Drawable dengan metode draw() dan enum Shape yang mewarisi protokol tersebut. Implementasikan metode draw untuk setiap kasus enum seperti kotak, lingkaran, dan segitiga.

 */


// MARK: JAWABAN Recursive Enumeration
// Soal 4: Recursive Enumeration
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)

    func evaluate() -> Int {
        switch self {
        case .number(let value):
            return value
        case .addition(let left, let right):
            return left.evaluate() + right.evaluate()
        case .multiplication(let left, let right):
            return left.evaluate() * right.evaluate()
        }
    }
}

// Contoh penggunaan
let expression = ArithmeticExpression.multiplication(.addition(.number(2), .number(3)), .number(4))
print("Hasil evaluasi ekspresi:", expression.evaluate())

// MARK: JAWABAN Enumeration dengan Generic

// Soal 5: Enumeration dengan Generic
enum Result<T> {
    case success(T)
    case failure(String)

    func isSuccess() -> Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}

// Contoh penggunaan
let successResult = Result.success(10)
let failureResult = Result<Int>.failure("Terjadi kesalahan")

print("Apakah hasil sukses?", successResult.isSuccess())
print("Apakah hasil gagal?", failureResult.isSuccess())


// MARK: JAWABAN Enumeration dan Protocol

// Soal 6: Enumeration dan Protocol
protocol Drawable {
    func draw()
}

enum Shape: Drawable {
    case square
    case circle
    case triangle

    func draw() {
        switch self {
        case .square:
            print("Menggambar kotak.")
        case .circle:
            print("Menggambar lingkaran.")
        case .triangle:
            print("Menggambar segitiga.")
        }
    }
}

// Contoh penggunaan
let square = Shape.square
let circle = Shape.circle
let triangle = Shape.triangle

square.draw()
circle.draw()
triangle.draw()


// MARK: OUTPUT

/*
 Hasil evaluasi ekspresi: 20
 Apakah hasil sukses? true
 Apakah hasil gagal? false
 Menggambar kotak.
 Menggambar lingkaran.
 Menggambar segitiga.
 */


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal :

/*
 MARK: Soal 7: Enumeration dan Async Operation
 Buat enum DownloadStatus dengan kasus-kasus: downloading(progress: Double), completed, dan failed(error: String). Implementasikan metode untuk memeriksa status unduhan dan mencetak pesan sesuai kondisinya.

 MARK: Soal 8: Enumeration dengan Associated Values dan Generic
 Buat enum Result<T> yang mendukung asosiasi nilai dan generic. Kasusnya harus mencakup success(T), failure(Error), dan invalidInput(String). Implementasikan metode untuk mengevaluasi dan mencetak hasilnya.

 MARK: Soal 9: Enumeration Iteration dengan Generic
 Buat enum generic List<T> yang mewakili daftar dengan elemen-elemen bertipe T. Implementasikan metode untuk menambahkan elemen ke dalam daftar dan iterasi untuk mencetak setiap elemen.

 */

// MARK: JAWABAN Enumeration dan Async Operation

// Soal 7: Enumeration dan Async Operation
enum DownloadStatus {
    case downloading(progress: Double)
    case completed
    case failed(error: String)

    func checkStatus() {
        switch self {
        case .downloading(let progress):
            print("Sedang mengunduh... Progres: \(progress * 100)%")
        case .completed:
            print("Unduhan selesai.")
        case .failed(let error):
            print("Gagal mengunduh. Error: \(error)")
        }
    }
}

// Contoh penggunaan
let status1 = DownloadStatus.downloading(progress: 0.5)
let status2 = DownloadStatus.completed
let status3 = DownloadStatus.failed(error: "Koneksi terputus")

status1.checkStatus()
status2.checkStatus()
status3.checkStatus()

// MARK: JAWABAN Enumeration dengan Associated Values dan Generic

// Soal 8: Enumeration dengan Associated Values dan Generic
enum Result<T> {
    case success(T)
    case failure(Error)
    case invalidInput(String)

    func evaluate() {
        switch self {
        case .success(let value):
            print("Hasil sukses:", value)
        case .failure(let error):
            print("Terjadi kesalahan:", error)
        case .invalidInput(let message):
            print("Input tidak valid:", message)
        }
    }
}

// Contoh penggunaan
let successResult = Result.success(10)
let failureResult = Result<Int>.failure("File not found")
let invalidInputResult = Result<String>.invalidInput("Invalid email format")

successResult.evaluate()
failureResult.evaluate()
invalidInputResult.evaluate()

// MARK: JAWABAN Enumeration Iteration dengan Generic

// Soal 9: Enumeration Iteration dengan Generic
enum List<T> {
    case empty
    indirect case node(element: T, next: List<T>)

    func add(element: T) -> List<T> {
        return .node(element: element, next: self)
    }

    func printElements() {
        var current: List<T> = self
        while case let .node(element, next) = current {
            print(element)
            current = next
        }
    }
}

// Contoh penggunaan
let list = List<Int>.empty
let newList = list.add(element: 1).add(element: 2).add(element: 3)

newList.printElements()

// MARK: OUTPUT

/*
 Sedang mengunduh... Progres: 50.0%
 Unduhan selesai.
 Gagal mengunduh. Error: Koneksi terputus
 Hasil sukses: 10
 Terjadi kesalahan: File not found
 Input tidak valid: Invalid email format
 3
 2
 1

 */

//: [Next](@next)
