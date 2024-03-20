//: [Previous](@previous)

import Foundation

// MARK: Advanced Generics Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
 MARK: Generic Function (Kesulitan: 5)
 Buatlah sebuah generic function printElement yang menerima parameter berupa array dan mencetak setiap elemen dalam array tersebut.

 MARK: Type Constraint (Kesulitan: 5)
 Jelaskan apa itu type constraint dalam generic dan berikan contohnya.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚


// MARK: Jawaban soal Generic Function
func printElement<T>(_ array: [T]) {
    for element in array {
        print(element)
    }
}

// Contoh penggunaan
let numbers = [1, 2, 3, 4, 5]
let strings = ["Apple", "Banana", "Orange"]

printElement(numbers)
printElement(strings)

// MARK: Jawaban Type Constraint
// Type constraint adalah batasan yang diberikan pada tipe data yang digunakan dalam generic untuk memastikan bahwa tipe data tersebut memenuhi persyaratan tertentu.
// Contoh:
// Kita dapat menggunakan type constraint untuk membatasi generic function agar hanya dapat menerima tipe data yang dapat dijumlahkan.
func sum<T: Numeric>(_ array: [T]) -> T {
    var result: T = 0
    for element in array {
        result += element
    }
    return result
}

// Contoh penggunaan
let numbers = [1, 2, 3, 4, 5]
let total = sum(numbers)
print("Total: \(total)")



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 10  :

/*
 MARK: Associated Type (Kesulitan: 10)
 Tentukan sebuah protocol Container dengan associated type Item. Kemudian, buatlah sebuah struct Box yang mengadopsi protocol tersebut.

 MARK: Where Clause (Kesulitan: 10)
 Implementasikan extension untuk protocol Equatable dengan where clause, yang menambahkan metode isEqual untuk tipe data yang mengadopsi protocol tersebut.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

// MARK: Jawaban soal Associated Type
protocol Container {
    associatedtype Item
    mutating func addItem(_ item: Item)
    var count: Int { get }
    subscript(index: Int) -> Item { get }
}

// Implementasi struct Box
struct Box<T>: Container {
    typealias Item = T

    private var items: [T] = []

    mutating func addItem(_ item: T) {
        items.append(item)
    }

    var count: Int {
        return items.count
    }

    subscript(index: Int) -> T {
        return items[index]
    }
}

// Contoh penggunaan
var box = Box<String>()
box.addItem("Apple")
box.addItem("Banana")
print("Total items: \(box.count)")
print("Item at index 1: \(box[1])")

// MARK: Jawaban soal Where Clause
extension Equatable {
    func isEqual(to other: Self) -> Bool {
        return self == other
    }
}

// Contoh penggunaan
let a = 5
let b = 10
print("a isEqual to b? \(a.isEqual(to: b))")  // false

let str1 = "Hello"
let str2 = "Hello"
print("str1 isEqual to str2? \(str1.isEqual(to: str2))")  // true




// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 15  :

/*
 MARK: Extension Generic dengan Where Clause (Kesulitan: 15)
 Buatlah sebuah generic struct PrintablePair yang memiliki dua elemen dengan associated type dan implementasikan extension yang hanya aktif ketika keduanya adalah tipe yang dapat dicetak (CustomStringConvertible).


 MARK: Advanced Where Clause (Kesulitan: 15)
 Tentukan sebuah generic protocol Mergeable yang memiliki associated type Element dan metode merge. Implementasikan extension untuk tipe yang mengadopsi protocol tersebut dengan where clause yang memastikan tipe tersebut adalah koleksi dan dapat di-merge.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

// MARK: Jawaban soal Extension Generic dengan Where Clause
struct PrintablePair<T, U> {
    typealias First = T
    typealias Second = U

    var first: T
    var second: U
}

extension PrintablePair where T: CustomStringConvertible, U: CustomStringConvertible {
    func printPair() {
        print("(\(first), \(second))")
    }
}

// Contoh penggunaan
let pair1 = PrintablePair(first: 5, second: "Hello")
pair1.printPair()  // Output: (5, Hello)

// MARK: Jawaban soal Advanced Where Clause
protocol Mergeable {
    associatedtype Element
    func merge() -> Element
}

extension Mergeable where Self: Collection {
    func merge() -> [Element] {
        var merged: [Element] = []
        for element in self {
            merged.append(element)
        }
        return merged
    }
}

// Contoh penggunaan
let numbers = [1, 2, 3]
let mergedNumbers = numbers.merge()
print("Merged numbers: \(mergedNumbers)")  // Output: Merged numbers: [1, 2, 3]

/*
 Penjelasan:

 Pada jawaban soal Extension Generic dengan Where Clause, kita mendefinisikan sebuah generic struct PrintablePair yang memiliki dua elemen dengan associated type T dan U. Kemudian, kita menambahkan sebuah extension yang hanya aktif ketika kedua tipe T dan U adalah tipe yang dapat dicetak (CustomStringConvertible). Dalam extension tersebut, kita mendefinisikan metode printPair() untuk mencetak pasangan elemen.
 Pada jawaban soal Advanced Where Clause, kita mendefinisikan sebuah generic protocol Mergeable dengan associated type Element dan metode merge(). Kemudian, kita menambahkan sebuah extension untuk tipe yang mengadopsi protocol tersebut dengan where clause yang memastikan tipe tersebut adalah koleksi (Collection) dan dapat di-merge. Dalam extension tersebut, kita mengimplementasikan metode merge() untuk menggabungkan semua elemen dalam koleksi menjadi sebuah array.
 */
//: [Next](@next)
