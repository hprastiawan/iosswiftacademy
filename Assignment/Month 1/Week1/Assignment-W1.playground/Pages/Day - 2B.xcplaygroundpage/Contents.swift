//: [Previous](@previous)
import Foundation

// MARK: Basic Operator Swift Example

// Berikut adalah soal-soal yang mencakup implementasi dari beberapa jenis operator dalam Swift:

// MARK: Operator Aritmatika:

/*
Soal 1:
Tuliskan sebuah program dalam Swift yang menerima dua angka dari pengguna dan mencetak hasil penjumlahan kedua angka tersebut.

Soal 2:
Buatlah program dalam Swift yang meminta pengguna untuk memasukkan panjang dan lebar sebuah persegi panjang, lalu menghitung dan mencetak luas persegi panjang tersebut.

Soal 3:
Diberikan sebuah array berisi nilai-nilai numerik, tuliskan program dalam Swift untuk menghitung rata-rata dari semua nilai dalam array tersebut.

*/

// Jawaban Soal 1
print("Masukkan dua angka:")
if let input1 = readLine(), let input2 = readLine(), let angka1 = Int(input1), let angka2 = Int(input2) {
    let hasil = angka1 + angka2
    print("Hasil penjumlahan: \(hasil)")
} else {
    print("Input tidak valid.")
}

// Jawaban Soal 2
print("Masukkan panjang persegi panjang:")
if let panjangStr = readLine(), let panjang = Double(panjangStr) {
    print("Masukkan lebar persegi panjang:")
    if let lebarStr = readLine(), let lebar = Double(lebarStr) {
        let luas = panjang * lebar
        print("Luas persegi panjang: \(luas)")
    } else {
        print("Input lebar tidak valid.")
    }
} else {
    print("Input panjang tidak valid.")
}

// Jawaban Soal 3
let nilai = [75, 80, 90, 85, 95]
let rataRata = Double(nilai.reduce(0, +)) / Double(nilai.count)
print("Rata-rata nilai: \(rataRata)")



// ------------------------||-----------------------------------||------------------------------------

// MARK: Operator Perbandingan:

/*
 Soal 1:
 Tuliskan program dalam Swift yang meminta pengguna untuk memasukkan dua angka, lalu mencetak apakah angka pertama lebih besar dari angka kedua atau tidak.

 Soal 2:
 Buatlah program dalam Swift yang mengecek apakah sebuah angka yang dimasukkan oleh pengguna merupakan bilangan genap atau ganjil.

 Soal 3:
 Diberikan dua string, tuliskan program dalam Swift untuk menentukan apakah kedua string tersebut sama panjang atau tidak.

*/

// Jawaban Soal 1

print("Masukkan dua angka:")
if let input1 = readLine(), let input2 = readLine(), let angka1 = Int(input1), let angka2 = Int(input2) {
    if angka1 > angka2 {
        print("\(angka1) lebih besar dari \(angka2).")
    } else {
        print("\(angka1) tidak lebih besar dari \(angka2).")
    }
} else {
    print("Input tidak valid.")
}

// Jawaban Soal 2

print("Masukkan sebuah angka:")
if let input = readLine(), let angka = Int(input) {
    if angka % 2 == 0 {
        print("\(angka) adalah bilangan genap.")
    } else {
        print("\(angka) adalah bilangan ganjil.")
    }
} else {
    print("Input tidak valid.")
}


// Jawaban Soal 3

let string1 = "Hello"
let string2 = "Swift"
if string1.count == string2.count {
    print("Kedua string memiliki panjang yang sama.")
} else {
    print("Kedua string memiliki panjang yang berbeda.")
}


// ------------------------||-----------------------------------||------------------------------------

// MARK: Operator Logika:

/*
 Soal 1:
 Tuliskan program dalam Swift yang memeriksa apakah sebuah angka yang dimasukkan oleh pengguna berada di antara 10 dan 20, atau di luar rentang tersebut.

 Soal 2:
 Buatlah program dalam Swift yang mengecek apakah sebuah karakter yang dimasukkan oleh pengguna merupakan huruf vokal atau bukan.

 Soal 3:
 Diberikan dua variabel boolean, tuliskan program dalam Swift untuk menentukan apakah keduanya bernilai true atau tidak.

 */

// Jawaban Soal 1

print("Masukkan sebuah angka:")
if let input = readLine(), let angka = Int(input) {
    if angka >= 10 && angka <= 20 {
        print("\(angka) berada di antara 10 dan 20.")
    } else {
        print("\(angka) tidak berada di antara 10 dan 20.")
    }
} else {
    print("Input tidak valid.")
}


// Jawaban Soal 2

print("Masukkan sebuah karakter:")
if let input = readLine(), let char = input.first {
    let vokal: Set<Character> = ["a", "e", "i", "o", "u"]
    if vokal.contains(char.lowercased()) {
        print("\(char) adalah huruf vokal.")
    } else {
        print("\(char) bukan huruf vokal.")
    }
} else {
    print("Input tidak valid.")
}


// Jawaban Soal 3

let boolean1 = true
let boolean2 = false
if boolean1 && boolean2 {
    print("Kedua boolean bernilai true.")
} else {
    print("Salah satu atau kedua boolean tidak bernilai true.")
}

// ------------------------||-----------------------------------||------------------------------------

// MARK: Operator Penugasan:

/*
 Soal 1:
 Tuliskan sebuah program dalam Swift yang menggunakan operator penugasan untuk mengubah nilai sebuah variabel dari 5 menjadi 10.

 Soal 2:
 Buatlah program dalam Swift yang menggunakan operator penugasan untuk mengalikan sebuah angka dengan 2.

 Soal 3:
 Diberikan sebuah array kosong dan sebuah nilai, tuliskan program dalam Swift untuk menggunakan operator penugasan untuk menambahkan nilai tersebut ke dalam array.

 */

// Jawaban Soal 1

var angka = 5
angka = 10
print("Nilai angka sekarang: \(angka)")


// Jawaban Soal 2

var angka = 5
angka *= 2
print("Nilai angka sekarang: \(angka)")


// Jawaban Soal 3

var array: [Int] = []
let nilai = 10
array.append(nilai)
print("Array setelah penambahan: \(array)")

//: [Next](@next)
