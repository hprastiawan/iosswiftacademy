//: [Previous](@previous)

import Foundation

// MARK: Automatic Reference Counting (ARC) Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 5 Poin :

/*
 MARK: Soal 1: Understanding ARC dan Strong References (5 poin)

1. Jelaskan konsep dasar Automatic Reference Counting (ARC) dalam Swift.

2. Apa itu strong reference? Berikan contoh sederhana penggunaan strong reference dalam Swift.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚


/*
 MARK: Konsep Dasar Automatic Reference Counting (ARC) dalam Swift:
 Automatic Reference Counting (ARC) adalah mekanisme yang digunakan oleh Swift untuk mengelola alokasi dan dealokasi memori secara otomatis.
 ARC melacak berapa kali sebuah objek direferensikan (diakses) dalam aplikasi. Setiap kali sebuah objek mendapatkan reference baru, ARC akan menambahkan satu pada jumlah referensi objek tersebut. Ketika tidak ada lagi reference yang menunjuk ke objek tersebut, ARC akan secara otomatis menghapus objek dari memori.
 ARC memastikan bahwa objek tetap ada selama masih ada reference yang menunjuk padanya, dan dihapus saat tidak ada lagi reference yang menunjuk padanya.
 */

/*
 MARK: Strong Reference:
 Strong reference adalah jenis reference yang menambahkan jumlah referensi suatu objek, sehingga objek tersebut tetap ada selama ada satu atau lebih strong reference yang menunjuk padanya.
 Contoh sederhana penggunaan strong reference dalam Swift:
 */

class Person {
    var name: String

    init(name: String) {
        self.name = name
        print("\(name) is initialized.")
    }

    deinit {
        print("\(name) is being deinitialized.")
    }
}

var person1: Person? = Person(name: "John") // Strong reference
var person2 = person1 // Strong reference
var person3 = person1 // Strong reference

person1 = nil // Objek tidak akan dihapus dari memori karena masih ada dua strong reference lainnya yang menunjuk padanya
person2 = nil // Objek masih tidak dihapus dari memori karena masih ada satu strong reference yang menunjuk padanya
person3 = nil // Setelah reference terakhir dihapus, objek akan dihapus dari memori karena tidak ada lagi strong reference yang menunjuk padanya

/*
 Dalam contoh di atas, ketiga variabel person1, person2, dan person3 merupakan strong reference yang menunjuk ke objek Person. Objek tersebut akan tetap ada di memori selama masih ada setidaknya satu strong reference yang menunjuk padanya.
 */




// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal 2: Resolving Strong References with Weak References (10 poin)
1. Jelaskan mengapa siklus referensi dapat terjadi dalam penggunaan strong references dan mengapa hal ini dapat menyebabkan kebocoran memori.

2. Bagaimana referensi lemah (weak reference) dapat membantu mengatasi siklus referensi? Berikan contoh penggunaannya dalam konteks Swift.

3. Sebutkan dan jelaskan langkah-langkah yang dapat diambil untuk mengatasi masalah siklus referensi menggunakan referensi lemah.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: Siklus Referensi dan Kebocoran Memori:
 Siklus referensi terjadi ketika dua atau lebih objek saling memiliki strong reference satu sama lain secara timbal balik. Dalam hal ini, tidak ada objek yang akan dihapus dari memori oleh ARC karena setiap objek masih memiliki strong reference yang menunjuk padanya.
 Hal ini dapat menyebabkan kebocoran memori karena objek yang tidak lagi digunakan tetap ada di memori dan tidak akan dihapus oleh ARC. Seiring waktu, ini dapat mengakibatkan akumulasi objek yang tidak terpakai, yang pada gilirannya dapat menyebabkan aplikasi kehabisan memori.
 */

/*
 MARK: Referensi Lemah untuk Mengatasi Siklus Referensi:
 Referensi lemah (weak reference) adalah jenis referensi yang tidak menambah jumlah referensi suatu objek. Objek yang diacu oleh referensi lemah tidak akan dihitung oleh ARC saat menentukan apakah objek tersebut harus tetap ada di memori atau tidak.
 Contoh penggunaan referensi lemah dalam konteks Swift:
 */

class Person {
    var name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
        print("\(name) is initialized.")
    }

    deinit {
        print("\(name) is being deinitialized.")
    }
}

class Apartment {
    var unit: String
    weak var tenant: Person? // Weak reference

    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) is initialized.")
    }

    deinit {
        print("Apartment \(unit) is being deinitialized.")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

john = nil // Setelah john di-deinit, unit4A akan kehilangan referensi lemahnya dan dapat di-deinit juga


/*
 MARK: Langkah-langkah Mengatasi Siklus Referensi Menggunakan Referensi Lemah:
 Gunakan referensi lemah (weak) untuk referensi yang tidak perlu mempertahankan objek secara permanen.
 Gunakan referensi yang tidak memiliki hubungan timbal balik (one-way references) atau gunakan weak references untuk salah satu referensi dalam hubungan timbal balik.
 Pastikan untuk membersihkan referensi lemah yang tidak lagi diperlukan, seperti dengan mengaturnya menjadi nil ketika objek yang diacu sudah tidak diperlukan lagi.
 */



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 15 Poin :

/*
 MARK: Soal 3: Implementing ARC and Resolving Strong References (15 poin)
 1. Implementasikan kelas sederhana dalam Swift yang menggunakan strong references dan cenderung menyebabkan siklus referensi.

 2. Modifikasi kelas tersebut dengan menggunakan referensi lemah untuk mencegah terjadinya siklus referensi.

 3. Jelaskan langkah-langkah yang Anda lakukan untuk mengatasi siklus referensi dan bagaimana referensi lemah membantu dalam situasi tersebut.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚


/*
 Berikut adalah langkah-langkah yang dapat diambil untuk mengatasi siklus referensi dan menggunakan referensi lemah untuk mencegahnya:

 MARK: Identifikasi Potensi Siklus Referensi:
 Tinjau kelas atau struktur Anda untuk mengidentifikasi hubungan timbal balik antara objek yang menggunakan strong references. Cari titik di mana objek saling memiliki referensi satu sama lain.
 
 MARK: Konversi Strong References Menjadi Weak References:
 Temukan referensi yang seharusnya tidak saling terkait secara timbal balik dan ubah menjadi referensi lemah dengan menandainya sebagai weak.
 Pastikan untuk mengidentifikasi referensi yang bisa menjadi penyebab siklus referensi dan konversi menjadi referensi lemah. Ini mencegah objek saling memiliki strong references satu sama lain.
 
 MARK: Atur Penjelasan dan Penjelasan:
 Berikan komentar atau penjelasan yang jelas di dalam kode untuk menjelaskan perubahan yang dilakukan untuk mengatasi siklus referensi.
 Jelaskan alasan penggunaan referensi lemah dan bagaimana itu mencegah terjadinya siklus referensi.
 
 MARK: Uji dan Verifikasi:
 Pastikan untuk menguji kelas atau struktur setelah mengimplementasikan perubahan.
 Verifikasi bahwa siklus referensi telah diatasi dan objek dapat dihapus dengan benar dari memori saat tidak lagi digunakan.
 */

// MARK: Berikut adalah contoh implementasi langkah-langkah di atas:

class Person1 {
    var name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
        print("\(name) is initialized.")
    }

    deinit {
        print("\(name) is being deinitialized.")
    }
}

class Apartment1 {
    var unit: String
    weak var tenant: Person? // Konversi strong reference menjadi weak reference

    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) is initialized.")
    }

    deinit {
        print("Apartment \(unit) is being deinitialized.")
    }
}

// Pengujian
var johni: Person1?
var unit4B: Apartment1?

johni = Person1(name: "John")
unit4B = Apartment1(unit: "4A")

johni?.apartment = unit4B
unit4B?.tenant = johni

john = nil // Setelah john di-deinit, unit4A akan kehilangan referensi lemahnya dan dapat di-deinit juga


/*
 Dalam contoh di atas, referensi antara objek Person dan Apartment sebelumnya adalah strong reference, yang dapat menyebabkan siklus referensi. Namun, dengan mengonversi referensi dari Apartment ke Person menjadi weak reference, siklus referensi diatasi dan objek dapat dihapus dengan benar saat sudah tidak diperlukan.
 */
//: [Next](@next)
