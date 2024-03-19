//: [Previous](@previous)

import Foundation

// MARK: Initialization and Deinitialization Class Swift ☀️

// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 5: 🏖️🏖️

/*
MARK: Soal 1
 Jelaskan perbedaan antara init dan required init dalam konteks inisialisasi kelas di Swift.
 Berikan contoh sederhana penggunaan keduanya.

 */

// MARK:  Jawaban Soal Poin 5:
/*
 Dalam konteks inisialisasi kelas di Swift, terdapat dua jenis inisialisasi yang penting, yaitu init dan required init. Berikut adalah perbedaan dan contoh penggunaannya:

 MARK: init:
 init digunakan untuk membuat inisialisasi baru pada sebuah kelas.
 init tidak mengharuskan subclass untuk mengimplementasikan inisialisasi yang sama.
 Dapat memiliki parameter opsional atau memiliki nilai default untuk parameter tertentu.
 Inisialisasi yang dideklarasikan dengan init hanya akan diwariskan ke subclass jika tidak dideklarasikan sebagai required init.
 Contoh penggunaan init:
 */
class Mobil {
    var merek: String
    var tahun: Int

    init(merek: String, tahun: Int) {
        self.merek = merek
        self.tahun = tahun
    }
}

let mobil1 = Mobil(merek: "Toyota", tahun: 2020)


/*
 MARK: required init:
 required init digunakan pada inisialisasi yang diwariskan kepada subclass.
 Memastikan bahwa semua subclass harus mengimplementasikan inisialisasi tersebut.
 Biasanya digunakan untuk mencegah instansiasi kelas induk secara langsung.
 required init tidak boleh dideklarasikan bersamaan dengan convenience init.
 Contoh penggunaan required init:
 */

class Kendaraan {
    var nama: String

    required init(nama: String) {
        self.nama = nama
    }
}

class Mobil: Kendaraan {
    var merek: String

    init(nama: String, merek: String) {
        self.merek = merek
        super.init(nama: nama)
    }

    required init(nama: String) {
        self.merek = "Unknown"
        super.init(nama: nama)
    }
}

let mobil1 = Mobil(nama: "Avanza", merek: "Toyota")


// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 10: 🏖️🏖️

/*
MARK: Soal 1
 Gambarkan proses inisialisasi dan deinisialisasi dalam sebuah objek di Swift.
 Buat contoh dengan dua kelas yang saling berhubungan, dan tunjukkan bagaimana inisialisasi dan deinisialisasi bekerja.

 */

// MARK:  Jawaban Soal Poin 10:

/*
 Proses inisialisasi dan deinisialisasi dalam Swift sangat penting untuk memastikan bahwa objek terinisialisasi dengan benar dan sumber daya yang digunakan dilepaskan dengan baik setelah objek tidak lagi diperlukan.
 Mari kita gambarkan proses tersebut menggunakan dua kelas yang saling berhubungan, yaitu Parent dan Child. Ketika objek Parent diinisialisasi, ia juga membuat objek Child, dan ketika objek Parent di-deinisialisasi, ia juga menghapus objek Child.
 */

class Child {
    let name: String

    init(name: String) {
        self.name = name
        print("Child \(name) diinisialisasi")
    }

    deinit {
        print("Child \(name) di-deinisialisasi")
    }
}

class Parent {
    let child: Child

    init(childName: String) {
        print("Parent diinisialisasi")
        self.child = Child(name: childName)
    }

    deinit {
        print("Parent di-deinisialisasi")
    }
}

// Membuat instance Parent
var parent: Parent? = Parent(childName: "Child1")

// Ketika parent dihapus, akan memicu deinit di Parent dan Child
parent = nil

// MARK: OUTPUT 🦕🦐🐠
/*
 Parent diinisialisasi
 Child Child1 diinisialisasi
 Parent di-deinisialisasi
 Child Child1 di-deinisialisasi
 */

/*
 Dalam contoh di atas, saat objek Parent diinisialisasi, ia membuat objek Child. Ketika objek Parent dihapus, objek Child juga dihapus karena ia adalah bagian dari Parent.
Ini menunjukkan bagaimana proses inisialisasi dan deinisialisasi bekerja dalam kelas yang saling berhubungan.
 */


// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 15: 🏖️🏖️

/*
MARK: Soal 1
 Jelaskan konsep failable initializer dalam Swift dan berikan contoh situasi di mana failable initializer berguna.
 Implementasikan failable initializer dalam sebuah kelas atau struktur dengan kondisi tertentu.
 Jelaskan cara failable initializer bekerja dan apa yang dikembalikan ketika inisialisasi gagal.

 */

// MARK:  Jawaban Soal Poin 15:

/*
 Failable initializer dalam Swift adalah sebuah inisialisasi yang dapat gagal. Artinya, inisialisasi tersebut dapat mengembalikan nil sebagai hasilnya, menandakan bahwa objek tidak dapat diinisialisasi dengan nilai yang diberikan. Failable initializer digunakan ketika inisialisasi objek tidak dapat dilakukan dengan berhasil karena kondisi tertentu.

 Contoh situasi di mana failable initializer berguna adalah ketika kita ingin membuat objek berdasarkan data eksternal, misalnya dari data yang dibaca dari file atau input pengguna. Dalam beberapa kasus, data tersebut mungkin tidak sesuai dengan format yang diharapkan, dan oleh karena itu, inisialisasi objek tidak dapat dilakukan dengan berhasil. Dengan menggunakan failable initializer, kita dapat menangani kondisi tersebut dan memberikan feedback yang sesuai kepada pengguna.

 Berikut adalah contoh implementasi failable initializer dalam sebuah kelas Person yang menerima usia sebagai parameter. Jika usia yang diberikan tidak valid (misalnya usia negatif), maka inisialisasi akan gagal:
 */

class Person {
    let name: String
    let age: Int

    init?(name: String, age: Int) {
        guard age >= 0 else {
            print("Usia tidak valid")
            return nil
        }

        self.name = name
        self.age = age
    }
}

// Penggunaan failable initializer
if let person = Person(name: "John", age: 25) {
    print("Person berhasil diinisialisasi dengan usia \(person.age)")
} else {
    print("Gagal menginisialisasi Person")
}

if let person = Person(name: "Alice", age: -30) {
    print("Person berhasil diinisialisasi dengan usia \(person.age)")
} else {
    print("Gagal menginisialisasi Person")
}

/*
 Dalam contoh di atas, jika usia yang diberikan negatif, inisialisasi akan gagal dan nilai nil akan dikembalikan.
 Saat menggunakan failable initializer, kita perlu memeriksa apakah inisialisasi berhasil atau tidak dengan menggunakan opsi if let atau guard let.
 */


//: [Next](@next)
