//: [Previous](@previous)

import Foundation

// MARK: Properties Swift ☀️


// ------------------------||-----------------------------------||------------------------------------

// MARK:  Soal Soal Stored Properties:🏖️🏖️

/*
 MARK: Kesulitan 5:
 Bagaimana cara mengakses nilai dari sebuah stored property yang dideklarasikan dalam sebuah instance dari kelas Swift?

 MARK: Kesulitan 10:
 Jelaskan perbedaan antara stored properties dan computed properties, dan kapan sebaiknya Anda memilih masing-masing dalam desain tipe data Anda.

 MARK: Kesulitan 15:
 Dalam konteks properties, apa itu "property wrapper"? Jelaskan penggunaan dan keuntungan dari property wrapper.


 */


// MARK: JAWABAN Soal 1
/*
 Untuk mengakses nilai dari sebuah stored property yang dideklarasikan dalam sebuah instance dari kelas Swift, Anda dapat menggunakan dot notation, yaitu dengan menggunakan nama instance diikuti oleh tanda titik dan nama properti yang ingin diakses. Berikut adalah contoh pengaksesan nilai dari stored property name dalam sebuah instance person dari kelas Person:
 */

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let person = Person(name: "John")
print(person.name) // Output: John


// MARK: JAWABAN Soal 2

/*
 Perbedaan utama antara stored properties dan computed properties adalah bagaimana mereka menyimpan dan menghitung nilai. Stored properties menyimpan nilai secara langsung di memori, sementara computed properties menghitung nilai berdasarkan logika tertentu setiap kali mereka diakses.

 MARK: Stored properties:

 Cocok digunakan ketika nilai properti perlu disimpan secara langsung dan dapat diakses secara langsung tanpa perhitungan tambahan setiap kali diakses.

 MARK: Computed properties:

 Berguna ketika nilai properti perlu dihitung atau diproses setiap kali diakses, tergantung pada nilai properti lain atau logika tertentu.

 Sebagai contoh, jika Anda memiliki properti radius dan diameter dalam sebuah lingkaran, maka radius bisa menjadi stored property karena nilainya hanya disimpan dan diakses langsung. Namun, diameter bisa menjadi computed property karena nilainya dapat dihitung berdasarkan nilai radius.
 */

// MARK: JAWABAN Soal 3

/*
 Dalam konteks properties, "property wrapper" adalah fitur baru dalam Swift yang memungkinkan Anda menambahkan perilaku khusus ke properti tertentu dengan cara yang mudah dan deklaratif. Property wrapper adalah tipe yang memungkinkan Anda untuk mengelola bagaimana nilai disimpan atau diakses oleh sebuah properti.

 Contoh penggunaan property wrapper adalah ketika Anda ingin memberikan fitur tambahan seperti validasi nilai, logging, penyimpanan lokal, atau transformasi nilai sebelum atau setelah penyimpanan atau pengambilan nilai dari properti.

 Keuntungan penggunaan property wrapper adalah memungkinkan Anda untuk menambahkan logika tambahan ke properti tanpa mengganggu struktur atau tampilan kode yang ada. Mereka memungkinkan Anda untuk memisahkan logika yang berkaitan dengan penyimpanan dan pengambilan nilai dari properti ke luar dari definisi kelas atau struktur. Ini dapat meningkatkan kejelasan, pemeliharaan, dan keselamatan kode Anda.
 */


// ------------------------||-----------------------------------||------------------------------------||----------------------------

// MARK:  Soal Soal Computed Properties: 🏔️⛰️

/*
 Computed Properties:
 MARK: Kesulitan 5:
 Apa yang membedakan computed properties dengan stored properties dalam hal implementasi dan kapan sebaiknya Anda memilih computed properties?

 MARK: Kesulitan 10:
 Jelaskan perbedaan antara setter dan getter dalam computed properties. Berikan contoh penggunaan keduanya.

 MARK: Kesulitan 15:
 Bagaimana cara mengimplementasikan dependency antara beberapa computed properties dalam satu tipe data?

 */


// MARK: JAWABAN Soal 1

/*
 Perbedaan utama antara computed properties dan stored properties adalah cara nilai diproses dan disimpan.

 Computed properties tidak menyimpan nilai secara langsung di memori; sebaliknya, mereka menghitung nilai setiap kali properti tersebut diakses. Implementasi computed properties terdiri dari getter untuk mengambil nilai dan opsional setter untuk mengatur nilai.
 Stored properties, di sisi lain, menyimpan nilai secara langsung di memori dan dapat diakses langsung tanpa perhitungan tambahan setiap kali diakses.
 Anda sebaiknya memilih computed properties ketika Anda perlu menghitung atau memproses nilai berdasarkan nilai properti lain atau logika tertentu setiap kali properti tersebut diakses. Ini memungkinkan Anda untuk menyediakan nilai dinamis yang dapat berubah sesuai dengan kondisi atau perubahan dalam objek.
 */

// MARK: JAWABAN Soal 2

/*
 Perbedaan antara setter dan getter dalam computed properties adalah:

 MARK: Getter:
 digunakan untuk mengambil nilai computed property. Ini adalah blok kode yang mengembalikan nilai properti yang dihitung.
 MARK: Setter:
 digunakan untuk mengatur nilai computed property. Ini memungkinkan Anda untuk menetapkan nilai baru ke properti yang dihitung.
 */

struct Circle {
    var radius: Double

    // Computed property dengan getter dan setter
    var diameter: Double {
        get {
            return radius * 2
        }
        set(newDiameter) {
            radius = newDiameter / 2
        }
    }
}

var myCircle = Circle(radius: 5)
print(myCircle.diameter) // Output: 10

myCircle.diameter = 14
print(myCircle.radius) // Output: 7


// MARK: JAWABAN Soal 3
/*
 Untuk mengimplementasikan ketergantungan antara beberapa computed properties dalam satu tipe data, Anda dapat menggunakan properti yang satu sebagai bagian dari komputasi properti lainnya. Ini akan menyebabkan properti yang tergantung dihitung ulang setiap kali properti yang digunakan dalam komputasi berubah.
 */

struct Rectangle {
    var width: Double
    var height: Double

    // Computed property yang bergantung pada properti width dan height
    var area: Double {
        return width * height
    }

    // Computed property yang bergantung pada properti area
    var perimeter: Double {
        return 2 * (width + height)
    }
}

var myRectangle = Rectangle(width: 5, height: 3)
print("Luas: \(myRectangle.area)") // Output: 15
print("Keliling: \(myRectangle.perimeter)") // Output: 16


// ------------------------||-----------------------------------||------------------------------------

// MARK:  Soal Soal Properties Observer :🏖️🏖️

/*
MARK: Kesulitan 5:
 Apa tujuan dari menggunakan property observer seperti willSet dan didSet dalam sebuah stored property?

MARK:  Kesulitan 10:
 Bagaimana property observer dapat membantu dalam validasi dan tindakan tambahan saat nilai sebuah property berubah?

MARK: Kesulitan 15:
 Dalam kasus penggunaan property observer, apakah mungkin terjadi rekursi tak terbatas, dan bagaimana cara menghindarinya?

 */


// MARK: JAWABAN Soal 1
/*
 Tujuan dari menggunakan property observer seperti willSet dan didSet dalam sebuah stored property adalah untuk memberikan kemampuan untuk merespons dan bereaksi terhadap perubahan nilai properti sebelum dan setelah nilainya diatur.

MARK: willSet:
 Diaktifkan sebelum nilai properti diatur. Ini memberi kesempatan untuk memeriksa nilai yang akan diatur atau melakukan tindakan lain sebelum nilainya berubah.
MARK: didSet:
 Diaktifkan setelah nilai properti diatur. Ini memberi kesempatan untuk bereaksi terhadap perubahan nilai, seperti melakukan validasi, memperbarui UI, atau menjalankan tindakan tambahan setelah nilai properti berubah.
 */

// MARK: JAWABAN Soal 2
/*
 Property observer dapat membantu dalam validasi dan tindakan tambahan saat nilai sebuah properti berubah dengan memungkinkan Anda untuk menjalankan blok kode khusus sebelum dan setelah nilai properti diatur.

 Contoh validasi menggunakan property observer:
 */

class User {
    var age: Int {
        didSet {
            if age < 0 {
                print("Usia tidak boleh negatif. Mengatur kembali ke nilai sebelumnya.")
                age = oldValue // Mengembalikan nilai ke nilai sebelumnya
            }
        }
    }

    init(age: Int) {
        self.age = age
    }
}

var user = User(age: 25)
user.age = -5 // Output: Usia tidak boleh negatif. Mengatur kembali ke nilai sebelumnya.
print(user.age) // Output: 25 (nilai sebelumnya dipertahankan)


// MARK: JAWABAN Soal 3
/*
 Dalam kasus penggunaan property observer, terjadi rekursi tak terbatas jika Anda memanggil setter atau getter dari properti yang sama di dalam blok willSet atau didSet. Ini bisa terjadi ketika Anda mencoba mengatur atau mengakses nilai properti itu sendiri di dalam blok observer, menyebabkan pengulangan tak terbatas.

 Untuk menghindari rekursi tak terbatas, Anda dapat menggunakan self.propertyName untuk merujuk ke properti tersebut secara eksplisit di dalam blok observer, atau lebih baik lagi, hindari memanggil setter atau getter dari properti yang sama di dalam blok observer.gunakan willSet untuk menetapkan nilai baru, dan didSet untuk merespons perubahan nilai, daripada mencoba untuk mengatur atau mengakses properti itu sendiri di dalam blok observer.
 */
//: [Next](@next)
