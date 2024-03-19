//: [Previous](@previous)

import Foundation


// MARK: Collection Swift


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal :

/*
 MARK: Array
 Buatlah sebuah array yang berisi nama-nama buah seperti "Apel", "Jeruk", "Mangga", "Pisang", "Anggur". Tampilkan nama buah pada indeks ke-2.

 MARK: Sets
 Buatlah dua set yang berisi angka-angka ganjil dan genap. Gabungkan kedua set tersebut menjadi satu set. Berapa jumlah elemen dalam set hasil penggabungan?

 MARK: Dictionary
 Buatlah sebuah dictionary yang menyimpan informasi tentang nama-nama kota dan jumlah populasi. Tambahkan kota "Jakarta" dengan populasi 10 juta ke dalam dictionary. Berapa populasi dari kota "Jakarta"?

 MARK: Mutable vs Immutable Collections
 Jelaskan perbedaan antara mutable dan immutable collections dalam konteks koleksi data seperti array, set, dan dictionary.
 */

// MARK: Jawaban Array

let fruits = ["Apel", "Jeruk", "Mangga", "Pisang", "Anggur"]
print("Nama buah pada indeks ke-2: \(fruits[2])")


// MARK: Jawaban Sets

let oddSet: Set<Int> = [1, 3, 5, 7, 9]
let evenSet: Set<Int> = [2, 4, 6, 8, 10]

let mergedSet = oddSet.union(evenSet)
print("Jumlah elemen dalam set hasil penggabungan: \(mergedSet.count)")



// MARK: Jawaban Dictionary

var cityPopulation = ["Jakarta": 10000000,
                      "Surabaya": 3000000,
                      "Bandung": 2500000]
// Menambahkan kota "Jakarta" dengan populasi 10 juta
cityPopulation["Jakarta"] = 10000000

if let jakartaPopulation = cityPopulation["Jakarta"] {
    print("Populasi Jakarta: \(jakartaPopulation)")
} else {
    print("Kota Jakarta tidak ditemukan dalam dictionary.")
}


// MARK: Jawaban Mutable vs Immutable Collections

/*
 Mutable collections (contohnya Array dan Dictionary) dapat diubah setelah pembuatan, artinya elemen atau properti dapat ditambahkan, dihapus, atau diubah nilainya.
 Immutable collections (contohnya let constant dan Set) tidak dapat diubah setelah pembuatan, sehingga elemen atau propertinya tetap konstan.
 */

// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal :

/*
 MARK: Collection Functions
 Hitunglah jumlah elemen dalam sebuah array integer yang berisi angka-angka ganjil.

 MARK: Sequences
 Apa yang dimaksud dengan sequences dalam Swift? Berikan contoh beberapa tipe data yang dapat digunakan sebagai sequences.

 MARK: Iterating through Collections
 Bagaimana cara melakukan iterasi (perulangan) melalui setiap elemen dalam sebuah array menggunakan loop for-in?

 MARK: Sorting Collections
 Urutkan sebuah array string yang berisi nama-nama buah secara alfabetis.

 */

// MARK: Jawaban Collection Functions

let numbers = [1, 3, 5, 7, 9]
let countOfOddNumbers = numbers.count
print("Jumlah elemen dalam array angka ganjil: \(countOfOddNumbers)")


// MARK: Jawaban Sequences

/*
 Sequences adalah tipe data dalam Swift yang mewakili sekumpulan nilai yang dapat diiterasi (diperulangkan) secara berurutan.
 Beberapa contoh tipe data yang dapat digunakan sebagai sequences adalah Array, Set, Range, dan String.
 */

// MARK: Jawaban Iterating through Collections

let numbers = [1, 2, 3, 4, 5]
for number in numbers {
    print(number)
}



// MARK: Jawaban Sorting Collections

var fruits = ["Apel", "Jeruk", "Mangga", "Pisang", "Anggur"]
fruits.sort()
print("Nama-nama buah setelah diurutkan: \(fruits)")


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal :

/*
 MARK: Filtering Collections
 Filterlah sebuah array integer sehingga hanya angka-angka yang lebih besar dari 10 yang tetap tersisa.

 MARK: Transforming Collections
 Ubahlah sebuah array string yang berisi nama-nama buah menjadi array yang berisi panjang nama masing-masing buah.

 MARK: Combining Collections
 Gabungkan dua array string yang berisi nama-nama buah menjadi satu array.


 */

// MARK: Jawaban Filtering Collections

let numbers = [5, 12, 8, 15, 6, 20]
let filteredNumbers = numbers.filter { $0 > 10 }
print("Angka-angka yang lebih besar dari 10: \(filteredNumbers)")

// MARK: Jawaban Transforming Collections

let fruits = ["Apel", "Jeruk", "Mangga", "Pisang", "Anggur"]
let lengths = fruits.map { $0.count }
print("Panjang nama-nama buah: \(lengths)")


// MARK: Jawaban Combining Collections

let fruits1 = ["Apel", "Jeruk", "Mangga"]
let fruits2 = ["Pisang", "Anggur"]
let combinedFruits = fruits1 + fruits2
print("Gabungan dari dua array buah: \(combinedFruits)")






//: [Next](@next)
