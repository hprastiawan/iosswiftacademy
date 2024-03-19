//: [Previous](@previous)
// MARK: Assignment 2A - Basic String and Character

/* Berikut adalah beberapa soal implementasi tentang Strings and Characters dalam Swift:

1. Diberikan sebuah string dalam bahasa Inggris, tuliskan program Swift untuk menghitung jumlah karakter dalam string tersebut.

2. Buatlah sebuah program dalam Swift yang meminta pengguna untuk memasukkan dua string, lalu menggabungkan kedua string tersebut menjadi satu menggunakan operator konkatenasi dan mencetak hasilnya.

3. Tuliskan sebuah program dalam Swift yang mengambil sebuah string dan mencetak setiap karakternya secara terbalik. Misalnya, jika diberikan string "hello", maka hasilnya adalah "olleh".
4. Diberikan sebuah string, tuliskan program dalam Swift untuk menentukan apakah string tersebut adalah sebuah palindrom atau tidak. Sebuah palindrom adalah string yang dapat dibaca sama baik dari depan maupun dari belakang.

5. Buatlah sebuah program dalam Swift yang menerima sebuah string dan mencetak jumlah kemunculan setiap karakter dalam string tersebut.
 */

// Jawaban 1

let str = "Hello, world!"
let jumlahKarakter = str.count
print("Jumlah karakter dalam string adalah: \(jumlahKarakter)")

// Jawaban 2

print("Masukkan dua string:")
if let str1 = readLine(), let str2 = readLine() {
    let gabung = str1 + str2
    print("Hasil konkatenasi: \(gabung)")
} else {
    print("Input tidak valid.")
}

// Jawaban 3

let greeting = "Hello"
let reversed = String(greeting.reversed())
print("String terbalik: \(reversed)")

// Jawaban 4

func isPalindrome(_ str: String) -> Bool {
    let reversed = String(str.reversed())
    return str == reversed
}

let stringToCheck = "radar"
if isPalindrome(stringToCheck) {
    print("\(stringToCheck) adalah palindrom.")
} else {
    print("\(stringToCheck) bukan palindrom.")
}


// Jawaban 5

let str5 = "hello"
var kemunculanKarakter: [Character: Int] = [:]

for char in str5 {
    kemunculanKarakter[char, default: 0] += 1
}

print("Kemunculan setiap karakter dalam string:")
for (char, count) in kemunculanKarakter {
    print("\(char): \(count)")
}


/* Berikut adalah beberapa soal implementasi tentang Strings and Characters dalam Swift:


6. Tuliskan sebuah program dalam Swift yang menerima sebuah string dan mengembalikan versi string tersebut yang telah dibalik urutannya. Misalnya, jika diberikan string "Swift", maka hasilnya adalah "tfiwS".

7. Buatlah sebuah program dalam Swift yang mengambil dua string dan menentukan apakah string pertama merupakan awalan dari string kedua atau bukan.

8. Diberikan sebuah string dalam bahasa Inggris, tuliskan program Swift untuk menghitung jumlah kata dalam string tersebut.

9. Tuliskan sebuah program dalam Swift untuk mengganti setiap kemunculan sebuah kata dalam sebuah string dengan sebuah kata lain. Misalnya, jika diberikan string "Halo nama saya John, nama saya adalah John.", dan kita ingin mengganti setiap kemunculan "nama" dengan "nama panggilan", maka hasilnya adalah "Halo nama panggilan saya John, nama panggilan saya adalah John."

 10.Buatlah sebuah program dalam Swift yang menerima sebuah string dan mencetak semua prefix (awalan) dan suffix (akhiran) yang mungkin dari string tersebut.

 */

// Jawaban 6

let str = "Swift"
let reversed = String(str.reversed())
print("String terbalik: \(reversed)")

// Jawaban 7

print("Masukkan dua string:")
if let str1 = readLine(), let str2 = readLine() {
    if str2.hasPrefix(str1) {
        print("\(str1) adalah awalan dari \(str2).")
    } else {
        print("\(str1) bukan awalan dari \(str2).")
    }
} else {
    print("Input tidak valid.")
}

// Jawaban 8

let str = "Hello, how are you?"
let jumlahKata = str.components(separatedBy: " ").count
print("Jumlah kata dalam string adalah: \(jumlahKata)")

// Jawaban 9

print("Masukkan sebuah string:")
if let input = readLine() {
    let replaced = input.replacingOccurrences(of: "nama", with: "nama panggilan")
    print("String setelah penggantian: \(replaced)")
} else {
    print("Input tidak valid.")
}

// Jawaban 10

print("Masukkan sebuah string:")
if let input = readLine() {
    let length = input.count
    print("Prefixes:")
    for i in 0..<length {
        let prefix = input.prefix(i + 1)
        print(prefix)
    }

    print("\nSuffixes:")
    for i in 0..<length {
        let suffix = input.suffix(i + 1)
        print(suffix)
    }
} else {
    print("Input tidak valid.")
}


//: [Next](@next)
