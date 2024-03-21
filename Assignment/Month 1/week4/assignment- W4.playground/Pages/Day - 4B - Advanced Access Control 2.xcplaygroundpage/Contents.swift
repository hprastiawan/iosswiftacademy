//: [Previous](@previous)

import Foundation

// MARK: Advanced Access Control II Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 5 Poin :

/*
 MARK: Soal 1:  Access Control pada Extension (5 Poin)


 Berikut adalah deklarasi struktur User yang memiliki properti username dengan tingkat access control internal.

 Dengan menggunakan extension, tambahkan metode isValidUsername() yang akan mengembalikan true jika panjang username lebih dari 5 karakter, dan false jika tidak. Tetapi, pastikan metode ini hanya dapat diakses dari dalam modul yang sama.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 Berikut adalah implementasi struktur User dengan properti username yang memiliki tingkat access control internal dan metode isValidUsername() yang hanya dapat diakses dari dalam modul yang sama:
 */

// Deklarasi struktur User dengan properti username (internal access control)
struct User {
    internal var username: String

    // Extension untuk menambahkan metode isValidUsername()
    extension User {
        // Metode isValidUsername() dengan access control internal
        internal func isValidUsername() -> Bool {
            return username.count > 5
        }
    }
}

// Contoh penggunaan
let user = User(username: "john_doe")
print(user.isValidUsername()) // Output: true

/*
 Dengan implementasi di atas, metode isValidUsername() hanya dapat diakses dari dalam modul yang sama karena memiliki access control internal.

 Hal ini memastikan bahwa validasi panjang username dilakukan secara internal dalam modul yang sama untuk menjaga keamanan dan konsistensi data.
 */




// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal 2: Access Control pada Generics (10 Poin)

 Anda sedang mengembangkan sebuah library untuk manajemen data. Anda ingin membuat sebuah generic struct DataStore untuk menyimpan data apa pun. Namun, Anda ingin memastikan bahwa hanya properti data pada struct tersebut yang dapat diakses dari luar modul, sedangkan metode untuk mengubah atau mengakses data hanya dapat diakses dari dalam modul yang sama. Implementasikan hal ini dengan menambahkan tingkat access control yang sesuai pada properti dan metode pada DataStore.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚

// Berikut adalah implementasi dari generic struct DataStore dengan tingkat access control yang sesuai:

// Generic struct DataStore
public struct DataStore<T> {
    // Properti data dengan access control private(set)
    private(set) var data: T

    // Public initializer untuk menginisialisasi data
    public init(data: T) {
        self.data = data
    }

    // Metode untuk mengubah data dengan access control internal
    internal mutating func updateData(_ newData: T) {
        self.data = newData
    }

    // Metode untuk mengakses data dengan access control internal
    internal func getData() -> T {
        return self.data
    }
}

/*
 MARK: Dalam implementasi di atas:

 Properti data dideklarasikan dengan access control private(set), sehingga hanya dapat diakses untuk membaca dari luar modul, tetapi tidak dapat diubah.

 Metode updateData(_:) dan getData() dideklarasikan dengan access control internal, sehingga hanya dapat diakses dari dalam modul yang sama. Hal ini memastikan bahwa penggunaan dan manipulasi data hanya terjadi secara internal dalam modul yang sama untuk menjaga integritas data.
 */

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 15 Poin :

/*
 MARK: Soal 3: Access Control pada Protocol (15 Poin)

 Anda ingin membuat sebuah protocol Animal yang akan diadopsi oleh berbagai jenis hewan di kebun binatang Anda. 

 Protocol ini memiliki beberapa metode untuk menangani perilaku umum hewan, seperti eat(), sleep(), dan makeSound().

 Namun, Anda ingin memastikan bahwa hanya modul yang bertanggung jawab atas manajemen hewan yang dapat mengakses dan menggunakan protocol Animal. Implementasikan protocol Animal dengan tingkat access control yang sesuai untuk mencapai hal ini.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

// Berikut adalah implementasi dari protocol Animal dengan tingkat access control yang sesuai:

// Protocol Animal dengan access control internal
internal protocol Animal {
    // Metode eat dengan access control internal
    func eat()

    // Metode sleep dengan access control internal
    func sleep()

    // Metode makeSound dengan access control internal
    func makeSound()
}

/*
 Dalam implementasi di atas:

 Protocol Animal dideklarasikan dengan access control internal, sehingga hanya dapat diakses dari dalam modul yang sama.
 Metode eat(), sleep(), dan makeSound() juga dideklarasikan dengan access control internal, sehingga hanya dapat diakses dari dalam modul yang sama. Hal ini memastikan bahwa perilaku umum hewan yang ditangani oleh protocol Animal hanya dapat dimanipulasi dan diakses oleh modul yang bertanggung jawab atas manajemen hewan di kebun binatang.
 */

//: [Next](@next)
