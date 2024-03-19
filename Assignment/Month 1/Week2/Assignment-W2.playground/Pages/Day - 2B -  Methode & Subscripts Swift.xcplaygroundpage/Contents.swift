//: [Previous](@previous)

import Foundation

// MARK: Methode & Subscripts Swift ☀️


// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 5: 🏖️🏖️

/*
 Buatlah sebuah class Bookshelf yang memiliki properti berupa array untuk menyimpan judul-judul buku.
 Tambahkan method pada class tersebut untuk menambahkan buku ke dalam rak buku.
 Implementasikan sebuah subscript yang memungkinkan akses ke judul buku berdasarkan indeks.
 */

// MARK:  Jawaban Soal Poin 5:
/*
 Berikut adalah implementasi class Bookshelf dengan properti array untuk menyimpan judul-judul buku, method untuk menambahkan buku, dan subscript untuk akses ke judul buku berdasarkan indeks:
 */

class Bookshelf {
    private var books: [String]

    init() {
        self.books = []
    }

    // Method untuk menambahkan buku ke dalam rak buku
    func addBook(_ title: String) {
        books.append(title)
    }

    // Subscript untuk akses ke judul buku berdasarkan indeks
    subscript(index: Int) -> String? {
        guard index >= 0 && index < books.count else {
            return nil
        }
        return books[index]
    }
}

// Contoh penggunaan:
let myBookshelf = Bookshelf()
myBookshelf.addBook("The Great Gatsby")
myBookshelf.addBook("To Kill a Mockingbird")
myBookshelf.addBook("1984")

print("Buku di indeks 0:", myBookshelf[0] ?? "Tidak ada buku")
print("Buku di indeks 2:", myBookshelf[2] ?? "Tidak ada buku")


// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 10: 🏖️🏖️

/*
 Buat sebuah enum Season yang memiliki kasus (case) untuk musim semi, panas, gugur, dan musim dingin.
 Implementasikan sebuah class TemperatureInfo yang memiliki properti berupa array untuk menyimpan informasi suhu setiap musim.
 Tambahkan method pada class TemperatureInfo untuk menambahkan suhu untuk suatu musim tertentu.
 Implementasikan sebuah subscript yang memungkinkan akses ke suhu berdasarkan musim.

 */

// MARK:  Jawaban Soal Poin 10:
/*
Berikut adalah implementasi enum Season dan class TemperatureInfo dengan properti array untuk menyimpan informasi suhu setiap musim, method untuk menambahkan suhu untuk suatu musim tertentu, dan subscript untuk akses ke suhu berdasarkan musim:
 */

// Enum Season untuk mewakili musim-musim
enum Season {
    case spring
    case summer
    case autumn
    case winter
}

// Class TemperatureInfo untuk menyimpan informasi suhu setiap musim
class TemperatureInfo {
    private var temperatures: [Season: Double]

    init() {
        self.temperatures = [:]
    }

    // Method untuk menambahkan suhu untuk suatu musim tertentu
    func addTemperature(_ temperature: Double, for season: Season) {
        temperatures[season] = temperature
    }

    // Subscript untuk akses ke suhu berdasarkan musim
    subscript(season: Season) -> Double? {
        return temperatures[season]
    }
}

// Contoh penggunaan:
let temperatureInfo = TemperatureInfo()
temperatureInfo.addTemperature(20.5, for: .spring)
temperatureInfo.addTemperature(30.0, for: .summer)
temperatureInfo.addTemperature(15.2, for: .autumn)
temperatureInfo.addTemperature(5.0, for: .winter)

print("Suhu musim semi:", temperatureInfo[.spring] ?? "Tidak ada data")
print("Suhu musim panas:", temperatureInfo[.summer] ?? "Tidak ada data")
print("Suhu musim gugur:", temperatureInfo[.autumn] ?? "Tidak ada data")
print("Suhu musim dingin:", temperatureInfo[.winter] ?? "Tidak ada data")


// MARK: OUTPUT
/*
 Suhu musim semi: 20.5
 Suhu musim panas: 30.0
 Suhu musim gugur: 15.2
 Suhu musim dingin: 5.0
 */

// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 15: 🏖️🏖️

/*
 Buat sebuah struct Matrix yang memiliki properti array dua dimensi (data) dan metode untuk inisialisasi matriks dengan ukuran tertentu.
 Implementasikan method pada struct Matrix untuk mengakses dan mengubah elemen matriks berdasarkan baris dan kolom.
 Tambahkan subscript pada struct Matrix yang memungkinkan akses ke elemen berdasarkan baris dan kolom.
 Implementasikan sebuah static subscript yang memungkinkan akses ke elemen matriks berdasarkan baris saja.
 Buat contoh matriks dan tunjukkan penggunaan method dan subscript yang telah Anda implementasikan.

 */

// MARK:  Jawaban Soal Poin 15:
/*
 Berikut adalah implementasi struct Matrix dengan properti array dua dimensi untuk menyimpan data matriks, method untuk inisialisasi matriks dengan ukuran tertentu, method untuk mengakses dan mengubah elemen matriks berdasarkan baris dan kolom, subscript untuk akses ke elemen berdasarkan baris dan kolom, dan static subscript untuk akses ke elemen matriks berdasarkan baris saja:
 */

struct Matrix {
    private var data: [[Int]]
    var rows: Int
    var columns: Int

    // Inisialisasi matriks dengan ukuran tertentu
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.data = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    }

    // Method untuk mengakses elemen matriks berdasarkan baris dan kolom
    func getElement(row: Int, column: Int) -> Int? {
        guard row >= 0 && row < rows && column >= 0 && column < columns else {
            return nil
        }
        return data[row][column]
    }

    // Method untuk mengubah elemen matriks berdasarkan baris dan kolom
    mutating func setElement(row: Int, column: Int, value: Int) {
        guard row >= 0 && row < rows && column >= 0 && column < columns else {
            return
        }
        data[row][column] = value
    }

    // Subscript untuk akses ke elemen berdasarkan baris dan kolom
    subscript(row: Int, column: Int) -> Int? {
        get {
            return getElement(row: row, column: column)
        }
        set {
            guard let newValue = newValue else { return }
            setElement(row: row, column: column, value: newValue)
        }
    }

    // Static subscript untuk akses ke elemen matriks berdasarkan baris saja
    static subscript(row: Int) -> [Int]? {
        get {
            // Implementasi berdasarkan data matriks yang telah dibuat sebelumnya
            // Misalnya, jika matriks telah dibuat sebelumnya dengan ukuran tertentu
            // Anda dapat mengembalikan baris dari matriks tersebut
            return nil
        }
    }
}

// Contoh penggunaan:
var myMatrix = Matrix(rows: 3, columns: 3)
print("Matriks awal:")
for i in 0..<myMatrix.rows {
    for j in 0..<myMatrix.columns {
        print(myMatrix[i, j] ?? 0, terminator: " ")
    }
    print()
}

myMatrix[0, 0] = 1
myMatrix[1, 1] = 2
myMatrix[2, 2] = 3

print("\nMatriks setelah diubah:")
for i in 0..<myMatrix.rows {
    for j in 0..<myMatrix.columns {
        print(myMatrix[i, j] ?? 0, terminator: " ")
    }
    print()
}

// MARK: OUTPUT
/*
 Matriks awal:
 0 0 0
 0 0 0
 0 0 0

 Matriks setelah diubah:
 1 0 0
 0 2 0
 0 0 3

 */
//: [Next](@next)
