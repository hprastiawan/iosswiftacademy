//: [Previous](@previous)

import Foundation

// MARK: Advanced Automatic Reference Counting (ARC) Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 5 Poin :

/*
 MARK: Soal 1: Weak Reference (Poin: 5)

 Jelaskan apa itu weak reference dalam Swift.
 Mengapa kita menggunakan weak reference dalam kasus tertentu?
 Bagaimana cara mendeklarasikan weak reference dalam sebuah class di Swift?
 Apa yang terjadi jika objek referensi dari weak reference dilepaskan dari memori?
 Apa perbedaan antara weak dan unowned reference?


 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*

 MARK: Weak Reference dalam Swift:
 Weak reference adalah tipe referensi yang tidak menambah jumlah referensi yang dimiliki suatu objek. Ini berarti bahwa objek yang dipegang oleh weak reference tidak akan mencegah objek tersebut untuk dihapus dari memori jika tidak ada strong reference lain yang memegangnya. Weak reference sering digunakan untuk mencegah siklus referensi dan kebocoran memori dalam situasi di mana dua objek saling merujuk satu sama lain.
 
 MARK: Penggunaan Weak Reference:
 Kita menggunakan weak reference untuk mengatasi siklus referensi di mana dua atau lebih objek saling merujuk satu sama lain menggunakan strong reference. Dengan menggunakan weak reference, kita memastikan bahwa tidak ada siklus referensi yang terbentuk, sehingga memungkinkan pengumpulan sampah untuk membebaskan memori yang tidak lagi digunakan.
 

 MARK: Deklarasi Weak Reference:
 Weak reference dideklarasikan dengan menandainya sebagai weak di depan tipe referensi. Misalnya, dalam sebuah class, properti yang digunakan sebagai weak reference dideklarasikan dengan menambahkan kata kunci weak sebelum tipe referensi. Contoh: weak var object: ClassName?.

 MARK: Aksi saat Objek Referensi Dilepaskan dari Memori:
 Ketika objek referensi dari weak reference dilepaskan dari memori, nilai dari weak reference tersebut akan secara otomatis diatur menjadi nil. Ini berarti bahwa kita harus selalu memeriksa apakah weak reference masih memiliki nilai sebelum menggunakannya untuk menghindari crash aplikasi yang disebabkan oleh akses ke objek yang telah dihapus.
 Perbedaan antara Weak dan Unowned Reference:
 
 MARK: Weak Reference:
 Nilai weak reference dapat diubah menjadi nil ketika objek yang dipegangnya sudah dihapus dari memori.
 Digunakan untuk mencegah siklus referensi.
 Aman digunakan dalam situasi di mana objek referensi mungkin dihapus dari memori selama aplikasi berjalan.
 
 MARK: Unowned Reference:
 Nilai unowned reference tidak pernah diubah menjadi nil.
 Digunakan ketika kita yakin bahwa objek referensi akan tetap ada selama objek yang memegang referensi tersebut masih ada.
 Tidak aman digunakan jika objek referensi mungkin dihapus dari memori selama aplikasi berjalan, karena dapat menyebabkan crash aplikasi jika diakses setelah objek referensi dihapus.
 */





// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal 2: Unowned Reference (Poin: 10)

 Apa itu unowned reference dan kapan kita menggunakannya?
 Bagaimana cara mendeklarasikan unowned reference dalam sebuah closure di Swift?
 Apa yang terjadi jika objek referensi dari unowned reference dilepaskan dari memori?
 Apakah ada perbedaan antara unowned reference dan implicitly unwrapped optional?
 Kapan sebaiknya kita menggunakan unowned reference daripada weak reference?



 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: Unowned Reference:
 Unowned reference adalah tipe referensi yang menunjuk ke objek yang tidak pernah diatur menjadi nil dan diasumsikan selalu ada selama unowned reference tersebut digunakan. Berbeda dengan weak reference, unowned reference tidak aman digunakan jika objek referensi yang dituju telah dihapus dari memori, karena hal ini dapat menyebabkan crash aplikasi.

 MARK: Deklarasi Unowned Reference dalam Closure:
 Untuk mendeklarasikan unowned reference dalam sebuah closure di Swift, Anda bisa menggunakan kata kunci unowned di depan variabel yang menjadi referensi. Contoh:
 */

let closure = { [unowned self] in
    // Gunakan self di sini
}

/*
 MARK: Aksi saat Objek Referensi Dilepaskan dari Memori:
 Jika objek referensi dari unowned reference dilepaskan dari memori, dan kemudian unowned reference tersebut diakses, maka aplikasi akan mengalami crash karena mencoba mengakses objek yang tidak lagi ada dalam memori.
 

 MARK: Perbedaan antara Unowned Reference dan Implicitly Unwrapped Optional:

 MARK: Unowned Reference:
 Unowned reference adalah referensi yang tidak diatur menjadi nil.
 Jika objek referensi telah dihapus dari memori dan unowned reference diakses, akan menyebabkan crash aplikasi.
 
 MARK: Implicitly Unwrapped Optional:
 Implicitly unwrapped optional adalah tipe opsional yang secara otomatis di-unwrapped ketika diakses.
 Jika nilai dari implicitly unwrapped optional adalah nil dan diakses, akan menyebabkan runtime error.
 
 MARK: Kapan Menggunakan Unowned Reference daripada Weak Reference:
 Unowned reference cocok digunakan ketika Anda yakin bahwa objek referensi akan tetap ada selama objek yang memegang referensi tersebut masih ada. 
 Penggunaan unowned reference lebih disarankan daripada weak reference jika Anda yakin bahwa objek referensi tidak akan dihapus selama objek yang memegangnya masih ada. Misalnya, dalam hubungan parent-child di antara dua objek, di mana parent selalu ada selama child masih ada. Jika tidak yakin bahwa objek referensi akan tetap ada, lebih aman menggunakan weak reference untuk menghindari crash aplikasi.
 */


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 15 Poin :

/*
 MARK: Soal 3: Closure Reference dengan Weak Reference (Poin: 15)

 Jelaskan apa itu closure reference dalam konteks Swift.
 Bagaimana cara menggunakan weak reference dalam sebuah closure di Swift?
 Mengapa penting untuk menggunakan weak reference dalam closure, terutama saat menangani delegasi?
 Apa yang terjadi jika kita tidak menggunakan weak reference dalam closure saat menangani delegasi?
 Berikan contoh kode sederhana yang menggunakan weak reference dalam closure, dan jelaskan alur eksekusinya.
rence?



 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: Closure Reference dalam Konteks Swift:
 Closure reference adalah kemampuan closure untuk menangkap dan menyimpan referensi ke nilai-nilai di lingkungan sekitarnya di mana closure tersebut didefinisikan. Dalam Swift, closure dapat menangkap dan menggunakan nilai dari variabel atau konstanta yang berada di lingkungan sekitarnya, bahkan setelah lingkungan tersebut keluar dari ruang lingkup.
 
 MARK: Menggunakan Weak Reference dalam Closure:
 Untuk menggunakan weak reference dalam sebuah closure di Swift, Anda bisa menggunakan kata kunci weak di depan variabel atau konstanta yang menjadi referensi. Contoh:
 */

someObject.someClosure = { [weak self] in
    // Gunakan self secara aman di sini
}

/*
 MARK: Pentingnya Weak Reference dalam Closure, Terutama saat Menangani Delegasi:
 Pentingnya menggunakan weak reference dalam closure, terutama saat menangani delegasi, adalah untuk mencegah terjadinya siklus referensi yang dapat menyebabkan kebocoran memori. Jika sebuah objek memiliki referensi yang kuat (strong reference) ke closure, dan closure tersebut juga memiliki referensi yang kuat ke objek tersebut, maka kedua objek tersebut akan saling menahan satu sama lain di memori, sehingga tidak akan pernah dihapus meskipun seharusnya tidak lagi digunakan. Dengan menggunakan weak reference, objek yang tidak lagi digunakan dapat dihapus dari memori, mencegah kebocoran memori.
 
 MARK: Konsekuensi Jika Tidak Menggunakan Weak Reference dalam Closure saat Menangani Delegasi:
 Jika tidak menggunakan weak reference dalam closure saat menangani delegasi, maka akan terjadi siklus referensi, di mana objek yang memiliki referensi ke closure dan closure itu sendiri saling menahan satu sama lain di memori. Hal ini menyebabkan objek tersebut tidak akan pernah dihapus dari memori meskipun sudah tidak lagi digunakan.
 
 MARK: Contoh Kode dengan Weak Reference dalam Closure:

 */

class MyClass {
    var completionBlock: (() -> Void)?

    func doSomethingAsync() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            // Gunakan self secara aman di sini
            self.completionBlock?()
        }
    }
}

/*
 Dalam contoh ini, closure yang dijalankan secara asinkron menggunakan weak reference self untuk mencegah siklus referensi. Ketika closure dijalankan, ia memeriksa apakah self masih ada di memori sebelum menggunakan objek tersebut. Jika tidak, maka tidak ada tindakan lebih lanjut yang diambil untuk mencegah penggunaan objek yang sudah dihapus dari memori.
 */


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 15 Poin :

/*
 MARK: Soal 4: Closure Reference dengan Unowned Reference (Poin: 15)

 Apa perbedaan antara unowned reference dan weak reference dalam konteks closure?
 Kapan sebaiknya kita menggunakan unowned reference dalam closure daripada weak reference?
 Bagaimana cara menggunakan unowned reference dalam sebuah closure di Swift?
 Apa yang harus dipertimbangkan saat menggunakan unowned reference dalam closure?
 Berikan contoh kode sederhana yang menggunakan unowned reference dalam closure, dan jelaskan keuntungan menggunakan unowned reference dalam kasus tersebut.



 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: Perbedaan antara Unowned Reference dan Weak Reference dalam Konteks Closure:
 Unowned Reference: Merupakan referensi non-opsional yang tidak menambah jumlah ARC (Automatic Reference Counting) dari objek yang direferensikan, dan diasumsikan bahwa objek yang direferensikan akan selalu ada selama referensi tersebut ada. Jika objek yang direferensikan sudah dihapus dari memori, maka unowned reference akan menjadi nil, dan mencoba mengaksesnya akan menyebabkan crash aplikasi.
 Weak Reference: Merupakan referensi opsional yang juga tidak menambah jumlah ARC dari objek yang direferensikan. Namun, berbeda dengan unowned reference, weak reference dapat menjadi nil ketika objek yang direferensikan dihapus dari memori, sehingga mengaksesnya secara aman memerlukan pengecekan apakah reference tersebut masih valid.
 
 MARK: Kapan Sebaiknya Menggunakan Unowned Reference dalam Closure daripada Weak Reference:
 Sebaiknya menggunakan unowned reference dalam closure ketika Anda yakin bahwa objek yang direferensikan akan selalu ada selama closure tersebut ada, dan siklus referensi tidak akan terjadi. Penggunaan unowned reference memberikan performa yang lebih baik daripada weak reference karena tidak memerlukan pengecekan opsi untuk nil.
 Cara Menggunakan Unowned Reference dalam Closure di Swift:
 Untuk menggunakan unowned reference dalam sebuah closure di Swift, Anda dapat menambahkan kata kunci unowned di depan variabel atau konstanta yang menjadi referensi. Contoh:
 */

someObject.someClosure = { [unowned self] in
    // Gunakan self secara aman di sini
}

/*
MARK:  Hal yang Harus Dipertimbangkan saat Menggunakan Unowned Reference dalam Closure:
 Pastikan bahwa objek yang direferensikan akan selalu ada selama referensi unowned tersebut ada. Jika tidak, maka penggunaan unowned reference dapat menyebabkan crash aplikasi.
 Hindari menggunakan unowned reference dalam situasi di mana objek yang direferensikan dapat dihapus sebelum closure dieksekusi.
 
 Contoh Kode dengan Unowned Reference dalam Closure:
 */

class MyClass {
    var closure: (() -> Void)?

    func setupClosure() {
        let object = SomeObject()
        self.closure = { [unowned object] in
            // Gunakan object secara aman di sini
            object.doSomething()
        }
    }
}

/*
 Dalam contoh ini, closure menyimpan unowned reference ke objek object. Karena kita yakin bahwa object akan ada selama closure tersebut ada, maka menggunakan unowned reference merupakan pilihan yang tepat. Dengan menggunakan unowned reference, kita menghindari kebocoran memori yang mungkin terjadi jika menggunakan strong reference atau crash aplikasi jika menggunakan weak reference.
 */
//: [Next](@next)
