//: [Previous](@previous)

import Foundation

// MARK: Function Swift


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 5:

/*
 1. Deklarasikan sebuah fungsi bernama greetUser yang menerima parameter name bertipe String dan mencetak pesan sapaan kepada pengguna.

 2. Buat sebuah fungsi calculateArea yang menerima dua parameter bertipe Double, length dan width, dan mengembalikan nilai luas dari persegi panjang.

 */

// MARK: Jawaban soal 1

func greetUser(name: String) {
    print("Halo, \(name)! Selamat datang.")
}

// Contoh pemanggilan fungsi
greetUser(name: "John")


// MARK: Jawaban soal 2

func calculateArea(length: Double, width: Double) -> Double {
    let area = length * width
    return area
}

// Contoh pemanggilan fungsi
let length = 5.0
let width = 3.0
let area = calculateArea(length: length, width: width)
print("Luas persegi panjang dengan panjang \(length) dan lebar \(width) adalah \(area).")



// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 10:

/*
 1. Deklarasikan sebuah closure dengan nama multiplyByTwo yang menerima parameter bertipe Int dan mengembalikan hasil perkalian parameter dengan 2. Gunakan sintaksis pendek untuk closure.

 2. Gunakan closure multiplyByTwo untuk mengalikan angka 8. Simpan hasilnya dalam sebuah konstanta dan cetak hasilnya.

 3. Buat sebuah fungsi bernama applyOperation yang menerima dua parameter: sebuah angka bertipe Int dan sebuah closure bertipe (Int) -> Int. Fungsi ini harus mengembalikan hasil dari penggunaan closure pada angka yang diberikan.

 */

// MARK: Jawaban soal 1

let multiplyByTwo: (Int) -> Int = { $0 * 2 }

// MARK: Jawaban soal 2

let number = 8
let result = multiplyByTwo(number)
print("Hasil perkalian \(number) dengan 2 adalah \(result).")


// MARK: Jawaban soal 3

func applyOperation(number: Int, closure: (Int) -> Int) -> Int {
    return closure(number)
}

let numberToOperate = 10
let squared = applyOperation(number: numberToOperate) { $0 * $0 }
print("Kuadrat dari \(numberToOperate) adalah \(squared).")



// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 15:

/*
 1. Buat sebuah array integer dengan beberapa nilai (minimal 5 nilai). Gunakan fungsi map dan closure untuk membuat array baru yang berisi nilai-nilai tersebut, namun setiap nilai dikalikan dengan 3.

 2. Deklarasikan sebuah closure isEven yang menerima parameter bertipe Int dan mengembalikan nilai boolean yang menunjukkan apakah angka tersebut genap atau tidak. Gunakan closure ini dalam fungsi filter untuk menyaring hanya nilai-genap dari array yang telah dibuat sebelumnya.

 3. Buat sebuah fungsi bernama performMathOperation yang menerima dua angka dan sebuah closure yang menerima dua parameter dan mengembalikan nilai. Fungsi ini harus menggunakan closure yang diberikan untuk melakukan operasi matematika pada dua angka tersebut dan mencetak hasilnya.
 */

// MARK: Jawaban soal 1

let numbers = [1, 2, 3, 4, 5]
let multipliedNumbers = numbers.map({ $0 * 3 })
print("Array baru setelah setiap nilai dikalikan dengan 3:", multipliedNumbers)


// MARK: Jawaban soal 2

let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let evenNumbers = numbers.filter(isEven)
print("Nilai-nilai genap dari array:", evenNumbers)


// MARK: Jawaban soal 3

func performMathOperation(number1: Int, number2: Int, operation: (Int, Int) -> Int) {
    let result = operation(number1, number2)
    print("Hasil operasi matematika: \(result)")
}

let num1 = 10
let num2 = 5
performMathOperation(number1: num1, number2: num2) { $0 + $1 } // Penjumlahan
performMathOperation(number1: num1, number2: num2) { $0 - $1 } // Pengurangan
performMathOperation(number1: num1, number2: num2) { $0 * $1 } // Perkalian
performMathOperation(number1: num1, number2: num2) { $0 / $1 } // Pembagian

//: [Next](@next)
