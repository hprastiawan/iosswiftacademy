//: [Previous](@previous)

import Foundation

// MARK: Generics Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
 MARK: Generic Function:
 1. Buatlah sebuah generic function printElement yang menerima parameter berupa array dan mencetak setiap elemen dalam array tersebut.

 MARK: Type Parameter:
 2. Apa fungsi dari type parameter dalam generic function atau class? Jelaskan dengan singkat.

 MARK: Stack Generic:
 3. Implementasikan sebuah stack generik yang dapat menambahkan dan menghapus elemen dengan menggunakan tipe parameter.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚


// MARK: Generic Function
func printElement<T>(_ array: [T]) {
    for element in array {
        print(element)
    }
}

// Contoh penggunaan
let intArray = [1, 2, 3, 4, 5]
let stringArray = ["apple", "banana", "orange"]

printElement(intArray)
printElement(stringArray)

// MARK: Type Parameter:
// Type parameter dalam generic function atau class berfungsi untuk membuat komponen tersebut menjadi fleksibel dalam hal tipe data yang dapat digunakan. Dengan menggunakan type parameter, kita dapat menentukan tipe data secara dinamis saat menggunakan generic function atau class, sehingga meningkatkan fleksibilitas dan reusable code.

// MARK: Stack Generic
struct Stack<T> {
    private var elements: [T] = []

    mutating func push(_ element: T) {
        elements.append(element)
    }

    mutating func pop() -> T? {
        return elements.popLast()
    }

    func peek() -> T? {
        return elements.last
    }
}

// Contoh penggunaan stack generik
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.push(3)

print(intStack.peek()) // Output: Optional(3)

intStack.pop()
print(intStack.peek()) // Output: Optional(2)


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 10  :

/*
 MARK: Generic Function with Constraints:
 Buatlah sebuah generic function sumArray yang menerima array dengan elemen-elemen numerik dan mengembalikan hasil penjumlahan elemen-elemen tersebut. Pastikan function ini hanya dapat digunakan dengan tipe data yang dapat dijumlahkan.

 MARK: Type Parameter in Custom Class:
 Implementasikan sebuah class generik Pair yang memiliki dua property dengan tipe parameter yang berbeda.

 MARK: Stack Generic Operations:
 Perluas implementasi stack generik dengan menambahkan fungsi isEmpty, peek, dan count.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚
// MARK: Jawaban soal Generic Function with Constraints

func sumArray<T: Numeric>(_ array: [T]) -> T {
    var sum: T = 0
    for element in array {
        sum += element
    }
    return sum
}

// Contoh penggunaan
let intArray1 = [1, 2, 3, 4, 5]
let doubleArray = [1.5, 2.5, 3.5, 4.5, 5.5]

print(sumArray(intArray1))    // Output: 15
print(sumArray(doubleArray)) // Output: 17.5

// MARK: Jawaban Type Parameter in Custom Class

class Pair<T, U> {
    var first: T
    var second: U

    init(first: T, second: U) {
        self.first = first
        self.second = second
    }
}

// Contoh penggunaan
let stringIntPair = Pair(first: "Swift", second: 5)
let intDoublePair = Pair(first: 10, second: 3.14)

// MARK: Jawaban Stack Generic Operations

extension Stack {
    func isEmpty() -> Bool {
        return elements.isEmpty
    }

    func count() -> Int {
        return elements.count
    }
}

// Contoh penggunaan operasi tambahan pada stack generik
print(intStack.isEmpty()) // Output: false
print(intStack.count())   // Output: 2



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 15  :

/*
 MARK: Advanced Generic Function:
 Buatlah generic function filterAndTransform yang menerima array, kondisi (closure untuk filter), dan transformasi (closure untuk transformasi). Function ini harus dapat mengembalikan array baru yang terfilter dan tertransformasi.

 MARK: Generic Type Parameter in Enum:
 Implementasikan enum generik Result<T, E: Error> yang mewakili hasil operasi yang bisa berhasil atau gagal. T adalah tipe data hasil sukses, dan E adalah tipe data kesalahan.

 MARK: Generic Stack Operations:
 Tambahkan fitur pada implementasi stack generik untuk menghapus semua elemen (clear stack) dan mengembalikan array yang berisi elemen-elemen stack.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

// MARK: Jawaban soal Advanced Generic Function
func filterAndTransform<T>(_ array: [T], condition: (T) -> Bool, transform: (T) -> T) -> [T] {
    var result: [T] = []
    for element in array {
        if condition(element) {
            result.append(transform(element))
        }
    }
    return result
}

// Contoh penggunaan
let numbers = [1, 2, 3, 4, 5]
let filteredAndTransformed = filterAndTransform(numbers, condition: { $0 % 2 == 0 }, transform: { $0 * 2 })
print(filteredAndTransformed) // Output: [4, 8]



// MARK: Jawaban Generic Type Parameter in Enum

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum CustomError: Error {
  case internalServerError
  case unknown
}

// Contoh penggunaan
let successResult: Result<Int, Error> = .success(10)
let failureResult: Result<String, CustomError> = .failure(CustomError.internalServerError)




// MARK: Jawaban Generic Stack Operations
extension Stack {
    mutating func clear() {
        elements.removeAll()
    }

    func toArray() -> [Element] {
        return elements
    }
}

// Contoh penggunaan operasi tambahan pada stack generik
var stringStack = Stack<String>()
stringStack.push("Apple")
stringStack.push("Banana")
stringStack.push("Orange")

print(stringStack.toArray()) // Output: ["Apple", "Banana", "Orange"]

stringStack.clear()
print(stringStack.toArray()) // Output: []

//: [Next](@next)
