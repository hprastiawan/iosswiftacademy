//: [Previous](@previous)

import Foundation

// MARK: Advanced Access Control Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal

 Dalam konteks pengembangan aplikasi manajemen inventaris, Anda memiliki kelas Product yang mewakili produk dalam inventaris. Properti productName yang menampung nama produk dan price yang menunjukkan harga produk telah dideklarasikan. Tetapi, Anda ingin membatasi akses ke properti price agar hanya dapat diubah dari dalam modul yang sama. Implementasikan access control untuk properti price dengan cara yang sesuai.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: JAWABAN
 Untuk membatasi akses ke properti price agar hanya dapat diubah dari dalam modul yang sama, Anda dapat mendeklarasikan properti tersebut dengan access control internal.

 Berikut adalah implementasi kelas Product dengan properti price yang memiliki access control internal:
 */

public class Product {
    public var productName: String
    internal var price: Double // Properti price dengan access control internal

    public init(productName: String, price: Double) {
        self.productName = productName
        self.price = price
    }
}

/*
 Dengan cara ini, properti price hanya dapat diakses dan diubah dari dalam modul yang sama. Jika Anda mencoba untuk mengakses atau mengubah properti price dari luar modul tempat Product dideklarasikan, Anda akan mendapatkan kesalahan kompilasi
 */



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal

 Anda sedang mengembangkan sistem manajemen pengguna untuk aplikasi web. Anda memiliki sebuah protocol Authenticatable yang memiliki sebuah metode authenticate(username: String, password: String) -> Bool yang digunakan untuk otentikasi pengguna. Namun, Anda ingin memastikan bahwa implementasi otentikasi hanya dapat diakses oleh kelas-kelas yang memiliki tingkat access control tertentu. Implementasikan access control untuk protocol Authenticatable dengan cara yang sesuai.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: JAWABAN
 Untuk membatasi akses terhadap protocol Authenticatable, Anda dapat menggunakan access control internal atau public tergantung pada kebutuhan proyek Anda. 

 Berikut adalah contoh implementasi protocol Authenticatable dengan access control internal:
 */

internal protocol Authenticatable {
    func authenticate(username: String, password: String) -> Bool
}

// Implementasi protocol Authenticatable
internal class Authenticator: Authenticatable {
    func authenticate(username: String, password: String) -> Bool {
        // Implementasi otentikasi
        // ...
        return true // Dummy return value, ganti dengan logika otentikasi yang sesuai
    }
}

/*
 Dengan cara ini, protocol Authenticatable dan implementasinya hanya dapat diakses dari dalam modul yang sama. Jika Anda ingin membuat protocol Authenticatable dapat diakses dari luar modul, Anda dapat menggunakan access control public pada protocol dan implementasinya. Misalnya:
 */

public protocol Authenticatable {
    func authenticate(username: String, password: String) -> Bool
}

public class Authenticator: Authenticatable {
    public func authenticate(username: String, password: String) -> Bool {
        // Implementasi otentikasi
        // ...
        return true // Dummy return value, ganti dengan logika otentikasi yang sesuai
    }
}

/*
 Dalam contoh kedua, protocol Authenticatable dan implementasinya dapat diakses dari luar modul tempat mereka dideklarasikan.
 */



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal

 Dalam pengembangan aplikasi e-commerce yang besar, Anda memiliki berbagai modul yang bertanggung jawab atas berbagai fitur seperti manajemen pembayaran, manajemen pesanan, dan manajemen produk. Setiap modul memiliki kelas-kelas yang berisi properti dan metode yang sensitif. Anda perlu memastikan bahwa hanya kelas-kelas di dalam modul yang sama yang dapat mengakses properti dan metode tersebut. Implementasikan access control pada kelas-kelas tersebut dengan tingkat yang sesuai agar memenuhi persyaratan tersebut.




 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 TODO: JAWABAN
 Untuk memastikan bahwa hanya kelas-kelas di dalam modul yang sama yang dapat mengakses properti dan metode yang sensitif, Anda dapat menggunakan access control internal. 

 Dengan access control ini, entitas hanya dapat diakses oleh kode yang berada dalam modul yang sama. Berikut adalah contoh implementasi access control internal untuk kelas-kelas sensitif dalam modul yang berbeda:

 */

// Modul Manajemen Pembayaran

internal class PaymentManager {
    internal var paymentMethod: String = "Credit Card" // Properti sensitif dengan access control internal

    internal func processPayment() {
        // Logika pemrosesan pembayaran
    }
}

// Modul Manajemen Pesanan

internal class OrderManager {
    internal var orderStatus: String = "Pending" // Properti sensitif dengan access control internal

    internal func updateOrderStatus() {
        // Logika pembaruan status pesanan
    }
}

// Modul Manajemen Produk

internal class ProductManager {
    internal var productPrice: Double = 100.0 // Properti sensitif dengan access control internal

    internal func updateProductPrice() {
        // Logika pembaruan harga produk
    }
}

/*
 Dengan menggunakan access control internal pada kelas-kelas tersebut, Anda memastikan bahwa properti dan metode sensitif hanya dapat diakses oleh kelas-kelas dalam modul yang sama. Ini membantu dalam menjaga privasi dan keamanan data dalam aplikasi e-commerce Anda.
 */

//: [Next](@next)
