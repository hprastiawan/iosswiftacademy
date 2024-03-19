//: [Previous](@previous)

import Foundation


// MARK: Array, Set, Dictionary Swift


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 5:

/*
 MARK: Array:
 Buatlah sebuah array yang berisi angka 1 hingga 5.
 Tampilkan elemen ketiga dari array tersebut.

 MARK: Set:
 Buatlah sebuah set yang berisi tiga warna: "Merah", "Hijau", dan "Biru".
 Tambahkan warna "Kuning" ke dalam set.
 Tampilkan setelah penambahan warna "Kuning".

 MARK: Dictionary:
 Buatlah sebuah dictionary yang menyimpan informasi buah-buahan dan jumlahnya. Contoh: ["Apel": 3, "Jeruk": 5].
 Tambahkan buah "Mangga" dengan jumlah 2 ke dalam dictionary.
 Tampilkan dictionary setelah penambahan buah "Mangga".

 */

// MARK: Jawaban Array

// Buat array yang berisi angka 1 hingga 5
var numbersArray = [1, 2, 3, 4, 5]

// Tampilkan elemen ketiga dari array tersebut
if numbersArray.indices.contains(2) {
    print("Elemen ketiga dari array: \(numbersArray[2])")
} else {
    print("Elemen ketiga tidak ada dalam array.")
}

// MARK: Jawaban Set

// Buat set yang berisi tiga warna: "Merah", "Hijau", dan "Biru"
var colorsSet: Set<String> = ["Merah", "Hijau", "Biru"]

// Tambahkan warna "Kuning" ke dalam set
colorsSet.insert("Kuning")

// Tampilkan setelah penambahan warna "Kuning"
print("Set warna setelah penambahan warna Kuning:")
print(colorsSet)

// MARK: Jawaban Dictionary

// Buat dictionary yang menyimpan informasi buah-buahan dan jumlahnya
var fruitsDict = ["Apel": 3, "Jeruk": 5]

// Tambahkan buah "Mangga" dengan jumlah 2 ke dalam dictionary
fruitsDict["Mangga"] = 2

// Tampilkan dictionary setelah penambahan buah "Mangga"
print("Dictionary setelah penambahan buah Mangga:")
print(fruitsDict)


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 10:

/*
 MARK: Array:
 Buatlah sebuah array yang berisi 5 nama teman.
 Hapus nama ketiga dari array.
 Tampilkan array setelah penghapusan.

 MARK: Set:
 Buatlah dua set yang berisi angka-angka genap dan ganjil.
 Gabungkan kedua set tersebut menjadi satu set.
 Tampilkan set hasil penggabungan.

 MARK: Dictionary:
 Buatlah dictionary yang menyimpan informasi tentang mata pelajaran dan nilai siswa. Contoh: ["Matematika": 90, "Bahasa Inggris": 85].
 Tambahkan nilai "Fisika" dengan nilai 88 ke dalam dictionary.
 Tampilkan dictionary setelah penambahan nilai "Fisika".

 */

// MARK: Jawaban Array

// Buat array yang berisi 5 nama teman
var friendsArray = ["Alice", "Bob", "Charlie", "David", "Eve"]

// Hapus nama ketiga dari array
if friendsArray.indices.contains(2) {
    friendsArray.remove(at: 2)
}

// Tampilkan array setelah penghapusan
print("Array teman setelah penghapusan:")
print(friendsArray)


// MARK: Jawaban Set

// Buat dua set yang berisi angka-angka genap dan ganjil
let evenSet: Set<Int> = [2, 4, 6, 8, 10]
let oddSet: Set<Int> = [1, 3, 5, 7, 9]

// Gabungkan kedua set tersebut menjadi satu set
let combinedSet = evenSet.union(oddSet)

// Tampilkan set hasil penggabungan
print("Set hasil penggabungan:")
print(combinedSet)

// MARK: Jawaban Dictionary

// Buat dictionary yang menyimpan informasi tentang mata pelajaran dan nilai siswa
var gradesDict = ["Matematika": 90, "Bahasa Inggris": 85]

// Tambahkan nilai "Fisika" dengan nilai 88 ke dalam dictionary
gradesDict["Fisika"] = 88

// Tampilkan dictionary setelah penambahan nilai "Fisika"
print("Dictionary setelah penambahan nilai Fisika:")
print(gradesDict)


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 15:

/*
 MARK: Array:
 Buatlah sebuah array yang berisi 10 angka acak antara 1 hingga 20.
 Urutkan array tersebut secara descending.
 Tampilkan array setelah diurutkan.

 MARK: Set:
 Buatlah dua set yang berisi huruf-huruf dari kata "SWIFT" dan "JAVA".
 Buatlah set baru yang berisi huruf-huruf yang muncul dalam kedua set.
 Tampilkan set hasil interseksi.

 MARK: Dictionary:
 Buatlah dictionary yang menyimpan informasi tentang tim sepak bola dan jumlah gol yang dicetak. Contoh: ["Barcelona": 25, "Real Madrid": 20].
 Tambahkan gol sebanyak 5 untuk tim "Barcelona".
 Tampilkan dictionary setelah penambahan gol

 */

// MARK: Jawaban Array

// Buat array yang berisi 10 angka acak antara 1 hingga 20
var numbersArray: [Int] = []
for _ in 1...10 {
    numbersArray.append(Int.random(in: 1...20))
}

// Urutkan array secara descending
numbersArray.sort(by: >)

// Tampilkan array setelah diurutkan
print("Array setelah diurutkan secara descending:")
print(numbersArray)


// MARK: Jawaban Set

// Buat dua set yang berisi huruf-huruf dari kata "SWIFT" dan "JAVA"
let swiftSet: Set<Character> = Set("SWIFT")
let javaSet: Set<Character> = Set("JAVA")

// Buat set baru yang berisi huruf-huruf yang muncul dalam kedua set
let intersectionSet = swiftSet.intersection(javaSet)

// Tampilkan set hasil interseksi
print("Set hasil interseksi:")
print(intersectionSet)


// MARK: Jawaban Dictionary

// Buat dictionary yang menyimpan informasi tentang tim sepak bola dan jumlah gol yang dicetak
var soccerDict = ["Barcelona": 25, "Real Madrid": 20]

// Tambahkan gol sebanyak 5 untuk tim "Barcelona"
if let goals = soccerDict["Barcelona"] {
    soccerDict["Barcelona"] = goals + 5
}

// Tampilkan dictionary setelah penambahan gol
print("Dictionary setelah penambahan gol untuk Barcelona:")
print(soccerDict)






//: [Next](@next)
