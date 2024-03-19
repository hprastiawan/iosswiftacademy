//: [Previous](@previous)

import Foundation

// MARK: Conditional And Looping Swift


// ------------------------||-----------------------------------||------------------------------------

// MARK: IF Statement:

/*
Soal 1 (Single IF):
Tuliskan sebuah program dalam Swift yang memeriksa apakah sebuah angka yang dimasukkan oleh pengguna adalah positif atau negatif.

Soal 2 (IF ELSE):
Buatlah program dalam Swift yang mengecek apakah tahun yang dimasukkan oleh pengguna adalah tahun kabisat atau bukan.
 */


// Jawaban  Soal 1

print("Masukkan sebuah angka:")
if let input = readLine(), let angka = Int(input) {
    if angka > 0 {
        print("\(angka) adalah angka positif.")
    } else {
        print("\(angka) adalah angka negatif.")
    }
} else {
    print("Input tidak valid.")
}


// Jawaban  Soal 2

print("Masukkan sebuah tahun:")
if let input = readLine(), let tahun = Int(input) {
    if (tahun % 4 == 0 && tahun % 100 != 0) || tahun % 400 == 0 {
        print("\(tahun) adalah tahun kabisat.")
    } else {
        print("\(tahun) bukan tahun kabisat.")
    }
} else {
    print("Input tidak valid.")
}


// ------------------------||-----------------------------------||------------------------------------

// MARK: NESTED IF :

/*
 Soal 1:

 Tuliskan program dalam Swift untuk menentukan apakah sebuah bilangan bulat yang dimasukkan oleh pengguna adalah bilangan prima atau tidak.

 Soal 2:

 Buatlah program dalam Swift yang meminta pengguna untuk memasukkan dua angka, lalu mencetak angka yang lebih besar di antara keduanya.
 */

// Jawaban Soal 1

print("Masukkan sebuah angka:")
if let input = readLine(), let angka = Int(input) {
    var prima = true
    if angka <= 1 {
        prima = false
    } else {
        for i in 2..<angka {
            if angka % i == 0 {
                prima = false
                break
            }
        }
    }
    if prima {
        print("\(angka) adalah bilangan prima.")
    } else {
        print("\(angka) bukan bilangan prima.")
    }
} else {
    print("Input tidak valid.")
}


// Jawaban Soal 2

print("Masukkan dua angka:")
if let input1 = readLine(), let input2 = readLine(), let angka1 = Int(input1), let angka2 = Int(input2) {
    if angka1 > angka2 {
        print("Angka pertama (\(angka1)) lebih besar dari angka kedua (\(angka2)).")
    } else if angka1 < angka2 {
        print("Angka pertama (\(angka1)) lebih kecil dari angka kedua (\(angka2)).")
    } else {
        print("Angka pertama (\(angka1)) sama dengan angka kedua (\(angka2)).")
    }
} else {
    print("Input tidak valid.")
}



// ------------------------||-----------------------------------||------------------------------------

// MARK: Switch Case :

/*
 Soal 1:

 Tuliskan program dalam Swift yang meminta pengguna untuk memasukkan bulan dalam angka (1-12), lalu mencetak jumlah hari dalam bulan tersebut.

 Soal 2:

 Buatlah program dalam Swift yang menentukan jenis hari berdasarkan nama hari yang dimasukkan oleh pengguna (senin, selasa, dll.).
 */



// Jawaban Soal 1

print("Masukkan nomor bulan (1-12):")
if let input = readLine(), let bulan = Int(input) {
    switch bulan {
    case 1, 3, 5, 7, 8, 10, 12:
        print("Jumlah hari dalam bulan ini adalah 31.")
    case 4, 6, 9, 11:
        print("Jumlah hari dalam bulan ini adalah 30.")
    case 2:
        print("Jumlah hari dalam bulan ini adalah 28 atau 29 (pada tahun kabisat).")
    default:
        print("Nomor bulan tidak valid.")
    }
} else {
    print("Input tidak valid.")
}

// Jawaban Soal 2

print("Masukkan nama hari:")
if let hari = readLine()?.lowercased() {
    switch hari {
    case "senin", "selasa", "rabu", "kamis", "jumat":
        print("\(hari.capitalized) adalah hari kerja.")
    case "sabtu", "minggu":
        print("\(hari.capitalized) adalah hari libur.")
    default:
        print("Hari tidak valid.")
    }
} else {
    print("Input tidak valid.")
}



// ------------------------||-----------------------------------||------------------------------------

// MARK: Looping Statement :

/*

 Soal 1 (For):

 Tuliskan program dalam Swift untuk mencetak semua bilangan bulat dari 1 hingga 10.

 Soal 2 (While):

 Buatlah program dalam Swift yang meminta pengguna untuk memasukkan sebuah kata, lalu mencetak setiap huruf dari kata tersebut secara terbalik menggunakan pernyataan while.
 */


// Jawaban Soal 1

print("Mencetak angka 1 hingga 10:")
for i in 1...10 {
    print(i)
}

// Jawaban Soal 2

print("Masukkan sebuah kata:")
if let kata = readLine() {
    var index = kata.count - 1
    print("Kata terbalik:")
    while index >= 0 {
        let reversedIndex = kata.index(kata.startIndex, offsetBy: index)
        print(kata[reversedIndex], terminator: "")
        index -= 1
    }
    print()
} else {
    print("Input tidak valid.")
}



// ------------------------||-----------------------------------||------------------------------------

// MARK: Do While Statement :

/*
 Soal 1:

 Tuliskan sebuah program dalam Swift yang meminta pengguna untuk memasukkan sebuah angka, lalu mencetak semua angka dari 1 hingga angka yang dimasukkan oleh pengguna.

 Soal 2:

 Buatlah program dalam Swift yang meminta pengguna untuk memasukkan sebuah kata, lalu mencetak setiap huruf dari kata tersebut menggunakan pernyataan do-while.
 */

// Jawaban Soal 1

print("Masukkan sebuah angka:")
if let input = readLine(), let angka = Int(input) {
    var i = 1
    print("Mencetak angka 1 hingga \(angka):")
    repeat {
        print(i)
        i += 1
    } while i <= angka
} else {
    print("Input tidak valid.")
}

// Jawaban Soal 2

print("Masukkan sebuah kata:")
if let kata = readLine() {
    var index = 0
    print("Huruf dalam kata:")
    repeat {
        let currentIndex = kata.index(kata.startIndex, offsetBy: index)
        print(kata[currentIndex], terminator: "")
        index += 1
    } while index < kata.count
    print()
} else {
    print("Input tidak valid.")
}



// ------------------------||-----------------------------------||------------------------------------

// MARK: Break and Continue :

/*
 Soal 1:

 Tuliskan program dalam Swift untuk mencetak semua angka bulat dari 1 hingga 20, kecuali angka yang dapat dibagi habis oleh 3.

 Soal 2:

 Buatlah program dalam Swift yang mencetak semua angka ganjil dari 1 hingga 10, dan ketika mencapai angka 5, program langsung berhenti.
 */

// Jawaban Soal 1

print("Mencetak angka 1 hingga 20, kecuali angka yang habis dibagi 3:")
for i in 1...20 {
    if i % 3 == 0 {
        continue
    }
    print(i)
}

// Jawaban Soal 2

print("Mencetak semua angka ganjil dari 1 hingga 10, dan berhenti saat mencapai angka 5:")
for i in 1...10 {
    if i % 2 == 0 {
        continue
    }
    print(i)
    if i == 5 {
        break
    }
}


//: [Next](@next)
