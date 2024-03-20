//: [Previous](@previous)

import Foundation

// MARK: Extensions Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal Soal
 1. Buatlah extension untuk tipe data Array yang menambahkan metode sum() untuk menghitung jumlah elemen-elemen dalam array. Implementasikan extension tersebut.


 2. Tentukan kegunaan self pada extension dalam Swift dan berikan contoh penggunaannya pada metode extension.


 3. Buat extension untuk tipe data Date yang menambahkan metode isWeekend() untuk menentukan apakah tanggal tersebut jatuh pada hari akhir pekan atau tidak. Implementasikan extension tersebut.

 */


// MARK: JAWABAN SOAL 1 ⚽︎

// Extension for Array type to calculate sum of elements
extension Array where Element: Numeric {
    func sum() -> Element {
        var total: Element = 0
        for element in self {
            total += element
        }
        return total
    }
}

// Example usage of Array extension
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.sum()
print("Sum of numbers: \(sum)")

// MARK: JAWABAN SOAL 2

// Extension with self keyword usage
extension Array {
    func printElementsCount() {
        print("Number of elements in array: \(self.count)")
    }
}

// Example usage of extension with self keyword
let names = ["John", "Emma", "Alex"]
names.printElementsCount()
}

// MARK: JAWABAN SOAL 3
// Extension for Date type to check if it's weekend
extension Date {
    func isWeekend() -> Bool {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday == 1 || weekday == 7
    }
}

// Example usage of Date extension
let currentDate = Date()
if currentDate.isWeekend() {
    print("Today is a weekend!")
} else {
    print("Today is not a weekend.")
}


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 10  :

/*
MARK: Soal Soal
1. Buatlah protokol bernama Resettable yang memiliki metode reset(). Selanjutnya, buat extension untuk tipe data Int yang mengadopsi protokol Resettable dan mengimplementasikan metode reset() untuk mengatur nilai menjadi 0.


2. Buat extension untuk tipe data String yang menambahkan metode containsVowel() untuk mengecek apakah string tersebut mengandung huruf vokal atau tidak. Implementasikan extension tersebut.


3.  Buat extension untuk tipe data Dictionary yang menambahkan metode sortedByKey() untuk mengembalikan dictionary yang diurutkan berdasarkan kuncinya (key). Implementasikan extension tersebut.
 */


// MARK: JAWABAN SOAL 1

// Protocol definition
protocol Resettable {
    mutating func reset()
}

// Extension for Int type adopting Resettable protocol
extension Int: Resettable {
    mutating func reset() {
        self = 0
    }
}

// Example usage of Int extension
var number = 10
print("Original value: \(number)")
number.reset()
print("After reset: \(number)")


// MARK: JAWABAN SOAL 2

// Extension for String type
extension String {
    func containsVowel() -> Bool {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        return self.lowercased().contains { vowels.contains($0) }
    }
}

// Example usage of String extension
let text = "Hello"
if text.containsVowel() {
    print("The string contains vowel(s).")
} else {
    print("The string does not contain any vowel.")
}


// MARK: JAWABAN SOAL 3

// Extension for Dictionary type
typealias ArrDict:  [(Key, Value)]
extension Dictionary where Key: Comparable {
    func sortedByKey() -> ArrDict {
        return self.sorted(by: { $0.key < $1.key })
    }
}

// Example usage of Dictionary extension
let dictionary = ["b": 2, "a": 1, "c": 3]
let sortedDictionary = dictionary.sortedByKey()
print("Sorted dictionary by key: \(sortedDictionary)")



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 15 :

/*
MARK: Soal Soal
1. Buatlah tipe data Person dengan properti name dan age. Buat extension untuk tipe data Person yang menambahkan metode isAdult() yang mengembalikan nilai boolean apakah seseorang dianggap dewasa jika usianya 18 tahun atau lebih.


2. Buat protokol Calculatable yang memiliki metode calculate(_:) untuk melakukan operasi perhitungan matematika pada dua angka. Selanjutnya, buat extension untuk tipe data Double yang mengadopsi protokol Calculatable dan mengimplementasikan metode calculate(_:) untuk operasi perkalian.


3. Buat extension untuk tipe data Array yang menambahkan metode uniqueElements() untuk mengembalikan array yang hanya berisi elemen-elemen unik. Implementasikan extension tersebut.

 */


// MARK: JAWABAN SOAL 1

// Data type definition
struct Person {
    var name: String
    var age: Int
}

// Extension for Person type
extension Person {
    func isAdult() -> Bool {
        return age >= 18
    }
}

// Example usage of Person extension
let person1 = Person(name: "John", age: 20)
print("\(person1.name) is adult: \(person1.isAdult())")

let person2 = Person(name: "Alice", age: 15)
print("\(person2.name) is adult: \(person2.isAdult())")


// MARK: JAWABAN SOAL 2

// Protocol definition
protocol Calculatable {
    func calculate(_ value1: Double, _ value2: Double) -> Double
}

// Extension for Double type adopting Calculatable protocol
extension Double: Calculatable {
    func calculate(_ value1: Double, _ value2: Double) -> Double {
        return value1 * value2
    }
}

// Example usage of Double extension
let result = 5.0.calculate(2.0, 3.0)
print("Result of multiplication: \(result)")


// MARK: JAWABAN SOAL 3

// Extension for Array type
extension Array where Element: Hashable {
    func uniqueElements() -> [Element] {
        var uniqueElements: Set<Element> = []
        return filter { uniqueElements.insert($0).inserted }
    }
}

// Example usage of Array extension
let numbers = [1, 2, 3, 2, 4, 3, 5]
let uniqueNumbers = numbers.uniqueElements()
print("Unique elements in array: \(uniqueNumbers)")


/*
 Pada kode di atas:

 Struktur Person didefinisikan dengan properti name dan age.
 Extension untuk tipe data Person menambahkan metode isAdult() untuk menentukan apakah seseorang dianggap dewasa jika usianya 18 tahun atau lebih.
 Protokol Calculatable didefinisikan dengan metode calculate(_:) untuk melakukan operasi perhitungan matematika pada dua angka.
 Extension untuk tipe data Double mengadopsi protokol Calculatable dan mengimplementasikan metode calculate(_:) untuk operasi perkalian.
 Extension untuk tipe data Array menambahkan metode uniqueElements() untuk mengembalikan array yang hanya berisi elemen-elemen unik. Metode ini menggunakan kelas Set untuk melakukan filter pada array dan menghapus duplikat.
 */

//: [Next](@next)
