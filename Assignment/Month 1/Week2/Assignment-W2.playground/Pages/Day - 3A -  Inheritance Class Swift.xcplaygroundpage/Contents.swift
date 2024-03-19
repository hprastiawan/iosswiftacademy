//: [Previous](@previous)

import Foundation

// MARK: Inheritance Class Swift ☀️

// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 5: 🏖️🏖️

/*
MARK: Soal 1
 Buatlah dua class, Orang dan Pelajar. Pelajar merupakan subclass dari Orang.
 Tentukan properti umur pada keduanya dengan nilai default 0.
 Berikan metode pada Orang untuk mengganti nilai umur.

MARK: Soal 2
 Buat objek Pelajar dan tetapkan umur menggunakan metode yang ada di Orang.
 Cetak umur Pelajar setelah perubahan.

 */

// MARK:  Jawaban Soal Poin 5:
// Class Orang
class Orang {
    var umur: Int

    init() {
        self.umur = 0
    }

    func setUmur(_ umur: Int) {
        self.umur = umur
    }
}

// Class Pelajar merupakan subclass dari Orang
class Pelajar: Orang {
    // Properti umur sudah diwarisi dari class Orang
}

// Objek Pelajar
let pelajar = Pelajar()

// Mengatur umur Pelajar menggunakan metode dari class Orang
pelajar.setUmur(18)

// Mencetak umur Pelajar setelah perubahan
print("Umur Pelajar:", pelajar.umur)

//MARK: OUTPUT
// Umur Pelajar: 18


// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 10: 🏖️🏖️

/*
MARK: Soal 1
 Buatlah class BangunDatar dengan properti luas dan metode hitungLuas().
 Buat dua subclass, Persegi dan Segitiga, yang masing-masing meng-override metode hitungLuas().

MARK: Soal 2
 Buat objek Persegi dan Segitiga, tetapkan nilai sisi atau alas dan tinggi, dan cetak luas keduanya.

 */

// MARK:  Jawaban Soal Poin 10:
// Class BangunDatar
class BangunDatar {
    var luas: Double = 0.0

    func hitungLuas() {
        // Metode hitungLuas() tidak diimplementasikan di class induk BangunDatar
    }
}

// Subclass Persegi
class Persegi: BangunDatar {
    var sisi: Double

    init(sisi: Double) {
        self.sisi = sisi
    }

    override func hitungLuas() {
        luas = sisi * sisi
    }
}

// Subclass Segitiga
class Segitiga: BangunDatar {
    var alas: Double
    var tinggi: Double

    init(alas: Double, tinggi: Double) {
        self.alas = alas
        self.tinggi = tinggi
    }

    override func hitungLuas() {
        luas = 0.5 * alas * tinggi
    }
}

// Objek Persegi
let persegi = Persegi(sisi: 5.0)
persegi.hitungLuas()
print("Luas Persegi:", persegi.luas)

// Objek Segitiga
let segitiga = Segitiga(alas: 6.0, tinggi: 4.0)
segitiga.hitungLuas()
print("Luas Segitiga:", segitiga.luas)

// MARK: OUTPUT
// Luas Persegi: 25.0
// Luas Segitiga: 12.0


// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 15: 🏖️🏖️

/*
MARK: Soal 1
 Buat class Hewan dengan properti nama dan metode bersuara().
 Buat dua subclass, Kucing dan Anjing, yang masing-masing meng-override metode bersuara().

MARK: Soal 2
 Buat objek Kucing dan Anjing, tetapkan nama, dan panggil metode bersuara().
 Berikan tambahan properti khusus pada masing-masing subclass, seperti warnaBulu untuk Kucing dan jenisAnjing untuk Anjing.

 */

// MARK:  Jawaban Soal Poin 15:

// Class Hewan
class Hewan {
    var nama: String

    init(nama: String) {
        self.nama = nama
    }

    func bersuara() {
        // Metode bersuara() tidak diimplementasikan di class induk Hewan
    }
}

// Subclass Kucing
class Kucing: Hewan {
    var warnaBulu: String

    init(nama: String, warnaBulu: String) {
        self.warnaBulu = warnaBulu
        super.init(nama: nama)
    }

    override func bersuara() {
        print("\(nama) meong")
    }
}

// Subclass Anjing
class Anjing: Hewan {
    var jenisAnjing: String

    init(nama: String, jenisAnjing: String) {
        self.jenisAnjing = jenisAnjing
        super.init(nama: nama)
    }

    override func bersuara() {
        print("\(nama) guk guk")
    }
}

// Objek Kucing
let kucing = Kucing(nama: "Tom", warnaBulu: "Hitam")
kucing.bersuara()

// Objek Anjing
let anjing = Anjing(nama: "Buddy", jenisAnjing: "Golden Retriever")
anjing.bersuara()

// MARK: OUTPUT 🦕🦐🐠

/*
 Tom meong
 Buddy guk guk
 */
//: [Next](@next)
