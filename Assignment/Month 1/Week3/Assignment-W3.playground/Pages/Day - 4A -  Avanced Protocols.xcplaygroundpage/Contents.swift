//: [Previous](@previous)

import Foundation

// MARK: Advanced Protocols Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal 1: Class-Only Protocols
 
 1.1 Apa itu Class-Only Protocols dan apa kegunaannya dalam pemrograman Swift?
 
 1.2 Buatlah contoh sederhana protokol yang hanya dapat diadopsi oleh kelas (Class-Only Protocols).

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: Apa itu Class-Only Protocols dan apa kegunaannya dalam pemrograman Swift?
 Class-Only Protocols adalah protokol yang hanya dapat diadopsi oleh kelas, dan tidak dapat diadopsi oleh struktur (struct) atau enumerasi (enum). Ini berarti hanya kelas yang dapat mengonformasi (adopt) protokol ini. Kegunaannya adalah untuk mengharuskan penggunaan protokol pada jenis data yang lebih fleksibel dan memungkinkan hanya kelas untuk memanfaatkan kemampuan yang ditentukan oleh protokol tersebut. Dengan menggunakan Class-Only Protocols, Anda dapat memastikan bahwa hanya kelas yang memiliki akses ke sifat-sifat tertentu yang didefinisikan oleh protokol.
 */

// MARK: Contoh sederhana protokol yang hanya dapat diadopsi oleh kelas (Class-Only Protocols):

// Contoh Class-Only Protocol
protocol Drawable: AnyObject {
    func draw()
}

// Kelas yang mengadopsi protokol Drawable
class Circle: Drawable {
    func draw() {
        print("Menggambar lingkaran")
    }
}

// Struktur yang tidak dapat mengadopsi protokol Drawable (akan menghasilkan error)
/*
struct Square: Drawable {
    func draw() {
        print("Menggambar persegi")
    }
}
*/

/*
 Dalam contoh di atas, protokol Drawable adalah Class-Only Protocols karena memiliki penanda AnyObject. Protokol ini hanya dapat diadopsi oleh kelas, bukan oleh struktur atau enumerasi. Implementasi protokol Drawable hanya diberikan oleh kelas Circle, sedangkan struktur Square tidak dapat mengadopsinya karena ini bukan kelas.
 */


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal 2: Protocol Delegation

 2.1 Jelaskan konsep dari Protocol Delegation dan berikan contoh situasi di mana penggunaan Protocol Delegation menjadi relevan.

 2.2 Buatlah dua protokol, satu sebagai delegator dan satu sebagai delegasi, dengan contoh implementasi penggunaan Protocol Delegation.


 */

// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: 2.1 Konsep dari Protocol Delegation:

 Protocol Delegation adalah pola desain di mana sebuah objek (delegator) menyerahkan atau mendelegasikan tugasnya kepada objek lain (delegasi) melalui penggunaan protokol. Delegasi bertanggung jawab untuk menangani atau merespons peristiwa yang terjadi di delegator. Ini adalah mekanisme yang umum digunakan dalam pengembangan aplikasi iOS untuk mengelola interaksi antara komponen-komponen dalam aplikasi.

 Contoh situasi di mana penggunaan Protocol Delegation menjadi relevan adalah ketika Anda memiliki objek yang membutuhkan interaksi dengan objek lain, tetapi Anda ingin membuat objek itu lebih terisolasi dan termodular. Dengan menggunakan Protocol Delegation, Anda dapat memisahkan logika bisnis dari objek delegator dan delegasi, sehingga membuat kode lebih bersih, terstruktur, dan mudah untuk diubah atau diperluas.


 */

/*
 MARK: 2.2 Contoh Implementasi Protocol Delegation:
 */

// Protokol Delegasi
protocol PrinterDelegate: AnyObject {
    func didPrintMessage(_ message: String)
}

// Protokol Delegator
class Printer {
    weak var delegate: PrinterDelegate?

    func printMessage(_ message: String) {
        print("Printing: \(message)")
        delegate?.didPrintMessage(message)
    }
}

// Kelas Delegasi
class LoggingService: PrinterDelegate {
    func didPrintMessage(_ message: String) {
        print("Message printed: \(message)")
    }
}

// Penggunaan Protocol Delegation
let printer = Printer()
let loggingService = LoggingService()
printer.delegate = loggingService

printer.printMessage("Hello, world!")

/*
 Dalam contoh di atas, Printer bertindak sebagai delegator dan memiliki sebuah opsi delegate yang mengadopsi protokol PrinterDelegate. LoggingService adalah kelas delegasi yang mengimplementasikan protokol PrinterDelegate. Ketika Printer memanggil metode printMessage, itu meneruskan informasi kepada delegasi (dalam hal ini, LoggingService) melalui metode delegasi didPrintMessage.
 */





// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal 3: Protocol Composition

 3.1 Apa yang dimaksud dengan Protocol Composition dan bagaimana hal itu dapat meningkatkan fleksibilitas dalam pengembangan?
 
 3.2 Berikan contoh implementasi Protocol Composition dengan dua protokol yang berbeda.

 */


// MARK: JAWABAN SOAL 🤚🤚🤚

/*
 MARK: 3.1 Protocol Composition
 adalah kemampuan untuk menggabungkan beberapa protokol ke dalam satu tipe data. Ini memungkinkan Anda untuk menentukan persyaratan yang lebih spesifik untuk tipe data, yang dapat meningkatkan fleksibilitas dalam pengembangan dengan memperbolehkan objek untuk mengadopsi kumpulan fitur protokol yang diperlukan.

 Dengan menggunakan protocol composition, Anda dapat membuat kumpulan persyaratan yang lebih spesifik untuk tipe data, tetapi tanpa membatasi tipe data tersebut untuk mengadopsi hanya satu protokol. Ini memungkinkan untuk memperoleh fleksibilitas yang lebih besar dalam desain sistem, dengan memungkinkan tipe data untuk memiliki sifat-sifat dari beberapa protokol.
 */

// MARK: 3.2 Contoh Implementasi Protocol Composition:

// Protokol 1
protocol Drawable {
    func draw()
}

// Protokol 2
protocol Colorable {
    var color: String { get }
}

// Tipe data yang menggabungkan kedua protokol di atas menggunakan Protocol Composition
struct Shape: Drawable, Colorable {
    func draw() {
        print("Drawing shape...")
    }

    let color: String
}

// Objek yang mengadopsi protokol composition
let square = Shape(color: "Red")
square.draw()
print("Color: \(square.color)")

/*
 Dalam contoh di atas, Shape adalah sebuah tipe data yang menggabungkan protokol Drawable dan Colorable menggunakan protocol composition. Ini berarti bahwa setiap objek dari tipe data Shape harus dapat mengimplementasikan kedua protokol tersebut.
 */




// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal 4: Checking for Protocol Conformance
 
 4.1 Jelaskan mengapa pemeriksaan kepatuhan protokol (Checking for Protocol Conformance) penting dalam pengembangan aplikasi.

 4.2 Buatlah contoh di mana Anda menggunakan is untuk memeriksa apakah sebuah objek sesuai dengan suatu protokol tertentu.

 */


// MARK: JAWABAN SOAL

/*
 MARK: 4.1 Pemeriksaan Kepatuhan Protokol (Checking for Protocol Conformance)
 adalah proses yang memungkinkan Anda untuk memeriksa apakah sebuah tipe data atau objek sesuai dengan suatu protokol. Ini penting dalam pengembangan aplikasi karena memungkinkan Anda untuk memastikan bahwa objek dapat mengikuti kontrak protokol yang diperlukan untuk digunakan dalam konteks tertentu. Dengan pemeriksaan kepatuhan protokol, Anda dapat menghindari kesalahan pada waktu kompilasi dan mengurangi kemungkinan terjadinya bug di waktu runtime.

 Misalnya, jika Anda memiliki fungsi yang mengharapkan objek untuk memiliki metode tertentu yang didefinisikan dalam protokol, Anda dapat memeriksa apakah objek tersebut sesuai dengan protokol tersebut sebelum memanggil metode tersebut. Ini memastikan bahwa objek yang Anda gunakan memenuhi persyaratan yang diperlukan oleh fungsi tersebut.
 */

// MARK: 4.2 Contoh Pemeriksaan Kepatuhan Protokol:

// Protokol
protocol Drawable {
    func draw()
}

// Objek
struct Circle: Drawable {
    func draw() {
        print("Drawing circle...")
    }
}

// Pemeriksaan kepatuhan protokol
let circle = Circle()
if circle is Drawable {
    print("Circle conforms to Drawable protocol")
} else {
    print("Circle does not conform to Drawable protocol")
}

/*
 Dalam contoh di atas, kita menggunakan operator is untuk memeriksa apakah objek circle sesuai dengan protokol Drawable. Jika objek tersebut sesuai dengan protokol, maka pesan "Circle conforms to Drawable protocol" akan dicetak. Jika tidak, maka pesan "Circle does not conform to Drawable protocol" akan dicetak.
 */



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal 5: Protocol Extensions
 
 5.1 Jelaskan konsep dari Protocol Extensions dan bagaimana itu dapat meningkatkan reusabilitas kode.
 
 5.2 Buatlah protokol dengan beberapa persyaratan dan berikan implementasi default menggunakan Protocol Extensions.

 */


// MARK: JAWABAN SOAL

/*
 MARK: 5.1 Konsep dari Protocol Extensions:

 Protocol Extensions adalah kemampuan dalam Swift untuk menyediakan implementasi default untuk metode protokol. Ini memungkinkan Anda untuk menambahkan fungsionalitas tambahan ke protokol tanpa memodifikasi tipe yang mengadopsinya. Dengan kata lain, Anda dapat menyediakan implementasi default untuk metode atau properti protokol yang tidak mengharuskan tipe yang mengadopsi protokol untuk mengimplementasikan kembali metode atau properti tersebut, kecuali jika mereka membutuhkan perilaku khusus.

 Ini meningkatkan reusabilitas kode karena Anda dapat menyediakan implementasi default untuk fungsionalitas umum yang berlaku untuk banyak tipe yang mengadopsi protokol yang sama. Dengan cara ini, Anda dapat menghindari duplikasi kode dan mengurangi jumlah kode yang harus ditulis ulang.
 */

// MARK: 5.2 Contoh Protokol dengan Implementasi Default:

// Protokol dengan metode yang memerlukan implementasi default
protocol Vehicle {
    var numberOfWheels: Int { get }
    func drive()
}

// Implementasi default untuk protokol Vehicle menggunakan protocol extension
extension Vehicle {
    func drive() {
        print("The vehicle is being driven.")
    }
}

// Contoh tipe yang mengadopsi protokol dan menggunakan implementasi default
struct Car: Vehicle {
    var numberOfWheels: Int { return 4 }
}

let myCar = Car()
myCar.drive() // Output: The vehicle is being driven.




//: [Next](@next)
