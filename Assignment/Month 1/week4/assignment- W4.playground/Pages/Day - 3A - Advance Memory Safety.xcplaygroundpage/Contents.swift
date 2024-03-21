//: [Previous](@previous)

import Foundation

// MARK: Memory Safety Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 5 Poin :

/*
 MARK: Soal Soal (Poin: 5)

 Soal 1:
 Apa yang dimaksud dengan memory safety dalam konteks pemrograman Swift?
 Soal 2:
 Jelaskan perbedaan antara nilai-nilai yang dijalankan secara atomic dan non-atomic dalam Swift.
 Soal 3:
 Mengapa memory safety penting dalam pengembangan aplikasi Swift?
 Soal 4:
 Apa yang dimaksud dengan "dangling pointer" dalam konteks Swift? Bagaimana cara menghindari masalah tersebut?


 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*

 ### Jawaban:

MARK:  1. **Memory Safety dalam Konteks Pemrograman Swift:**
    Memory safety adalah konsep yang memastikan bahwa aplikasi tidak mengakses memori yang tidak valid atau tidak teralokasi secara tidak sengaja. Dalam konteks pemrograman Swift, ini berarti menghindari perilaku yang dapat menyebabkan kebocoran memori, konflik akses memori, atau masalah lainnya yang terkait dengan pengelolaan memori yang tidak benar.

MARK: 2. **Perbedaan antara Nilai yang Dijalankan Secara Atomic dan Non-Atomic dalam Swift:**
    - **Atomic:** Nilai-nilai yang diakses atau dimodifikasi atomically dijamin untuk melakukan operasi mereka tanpa terputus oleh thread lain. Ini berarti bahwa ketika satu thread sedang mengakses atau memodifikasi nilai tersebut, thread lain harus menunggu sampai operasi tersebut selesai sebelum mereka dapat mengakses atau memodifikasi nilainya.
    - **Non-Atomic:** Nilai-nilai yang tidak diakses atau dimodifikasi atomically tidak menjamin perilaku ini. Operasi yang dilakukan pada nilai non-atomic dapat diinterupsi atau tidak konsisten oleh thread lain.

MARK:  3. **Pentingnya Memory Safety dalam Pengembangan Aplikasi Swift:**
    - Memory safety penting dalam pengembangan aplikasi Swift karena dapat mencegah kebocoran memori, konflik akses, dan masalah lain yang dapat menyebabkan aplikasi crash atau perilaku yang tidak diinginkan.
    - Dengan menjaga memory safety, pengembang dapat meningkatkan keandalan, stabilitas, dan keamanan aplikasi mereka.

MARK:  4. **Dangling Pointer dalam Konteks Swift:**
    - Dangling pointer adalah pointer yang masih merujuk ke lokasi memori yang telah dibebaskan (didealokasikan). Dalam konteks Swift, ini terjadi ketika sebuah objek dihapus dari memori, tetapi masih ada referensi (pointer) yang merujuk ke objek tersebut.
    - Untuk menghindari masalah dangling pointer, pastikan untuk mengatur referensi ke objek yang dibebaskan menjadi `nil` setelah objek tersebut didealokasikan. Gunakan opsi seperti weak reference atau unowned reference untuk referensi yang tidak mempertahankan objek dalam memori. Selain itu, hindari mengeksekusi operasi atau mengakses data melalui pointer yang tidak valid.
 */



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal Soal (Poin: 10)

 Soal 5:
 Jelaskan konsep retain cycle dalam ARC (Automatic Reference Counting) dan mengapa hal ini bisa menjadi masalah dalam pengembangan aplikasi Swift.
 Soal 6:
 Apa itu "unowned reference" dalam Swift? Berikan contoh penggunaannya dan kapan Anda akan memilih unowned reference daripada weak reference.
 Soal 7:
 Bagaimana cara menangani race condition dalam konkurensi Swift? Jelaskan setidaknya dua metode yang dapat digunakan.

 Soal 8:
 Mengapa menggunakan operasi atomik dalam pengembangan aplikasi Swift dapat membantu menghindari race condition? Berikan contoh penggunaan operasi atomik dalam Swift.
 Soal 9:
 Jelaskan penggunaan DispatchQueue dalam Swift untuk memastikan akses thread-safe terhadap sumber daya bersama. Berikan contoh penggunaannya.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚


/*

 MARK: Jawaban:
 MARK: Retain Cycle dalam ARC dan Mengapa Ini Menjadi Masalah:
 Retain cycle terjadi ketika dua atau lebih objek saling memiliki strong reference satu sama lain, sehingga tidak ada yang bisa didealokasikan oleh ARC karena referensi yang saling menahan objek tersebut terus berlanjut.
 Ini menjadi masalah dalam pengembangan aplikasi Swift karena dapat menyebabkan kebocoran memori. Jika siklus referensi tidak dipecahkan, objek akan tetap ada di memori bahkan ketika tidak lagi dibutuhkan, yang mengakibatkan memori yang tidak terpakai dan kinerja aplikasi yang menurun.

 MARK: Unowned Reference dalam Swift:
 Unowned reference adalah referensi yang tidak memegang nilai objek dengan kuat, tetapi mengasumsikan bahwa objek yang dirujuk akan tetap ada selama referensi tersebut masih digunakan.
 Contoh penggunaannya adalah dalam situasi di mana kita yakin objek yang dirujuk akan selalu ada selama referensi itu masih digunakan, dan kita ingin menghindari opsional wrapping atau siklus referensi yang tidak diinginkan.
 Kita memilih unowned reference daripada weak reference ketika kita yakin objek yang dirujuk akan ada selama referensi masih digunakan, dan kita ingin menghindari opsional wrapping.

 MARK: Penanganan Race Condition dalam Konkurensi Swift:
 Serial Dispatch Queue: Gunakan serial dispatch queue untuk menjalankan tugas secara berurutan, menghindari konflik antar-thread.
 Dispatch Semaphores: Gunakan dispatch semaphores untuk mengontrol akses ke sumber daya bersama dengan cara yang thread-safe.

 MARK: Menggunakan Operasi Atomik dalam Pengembangan Aplikasi Swift:
 Operasi atomik memastikan bahwa operasi tersebut dieksekusi secara utuh tanpa diinterupsi oleh thread lain, sehingga menghindari race condition.
 Contoh penggunaannya adalah dengan menggunakan operasi atomik seperti compareAndSwap pada tipe data seperti AtomicInteger untuk memastikan pengubahan nilai variabel hanya terjadi jika tidak ada konflik dengan operasi dari thread lain.

 MARK: Penggunaan DispatchQueue dalam Swift untuk Akses Thread-Safe:
 DispatchQueue digunakan untuk menjamin bahwa tugas-tugas (atau blok kode) dieksekusi secara thread-safe, baik secara serial (pada satu thread) atau paralel (pada beberapa thread).
 Contoh penggunaannya adalah dengan membuat serial dispatch queue untuk mengakses sumber daya bersama, seperti mengakses variabel yang dibagi di antara beberapa thread. Misalnya:
 */

let concurrentQueue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)
concurrentQueue.async {
    // Code that accesses shared resource
}



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 15 Poin :

/*
 MARK: Soal Soal (Poin: 15)

 Soal 1:
 Jelaskan konsep Automatic Reference Counting (ARC) dalam Swift dan bagaimana mekanisme ini membantu mencegah kebocoran memori dalam pengembangan aplikasi Swift.

 Soal 2:
 Dalam konteks pengembangan aplikasi Swift, apa yang dimaksud dengan "dangling pointer" dan bagaimana hal tersebut dapat terjadi? Berikan contoh dan jelaskan cara menghindari masalah tersebut.

 Soal 3:
 Bagaimana Anda akan mengatasi race condition dalam konkurensi Swift? Jelaskan setidaknya dua metode atau teknik yang dapat Anda gunakan untuk memastikan akses yang aman terhadap sumber daya bersama dalam lingkungan konkurensi.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*

 MARK: Jawaban:
 MARK: Automatic Reference Counting (ARC) dalam Swift:
 ARC adalah mekanisme pengelolaan memori yang digunakan oleh Swift untuk mengelola siklus referensi dan membebaskan memori yang tidak lagi digunakan. ARC menghitung jumlah referensi ke sebuah objek dan secara otomatis menghapusnya dari memori ketika tidak ada lagi referensi yang menunjuk ke objek tersebut. Ini membantu mencegah kebocoran memori dan masalah terkait dengan pengelolaan memori yang tidak tepat dalam pengembangan aplikasi Swift.

 MARK: Dangling Pointer dalam Konteks Swift:
 Dangling pointer adalah pointer yang masih merujuk ke lokasi memori yang telah dibebaskan atau didealokasikan. Ini dapat terjadi ketika objek yang ditunjuk oleh pointer telah didealokasikan, tetapi pointer masih ada.
 Contoh:

 var reference: MyClass? = MyClass()
 reference = nil // MyClass instance deallocated, but reference still exists


 Untuk menghindari masalah dangling pointer, pastikan untuk mengatur referensi ke objek yang dibebaskan menjadi nil setelah objek tersebut didealokasikan.

 MARK: Mengatasi Race Condition dalam Konkurensi Swift:

  MARK: Menggunakan Dispatch Queues:
  Dispatch queues dalam Swift memungkinkan Anda menjalankan tugas secara konkuren atau secara seri. Dengan menggunakan dispatch queues, Anda dapat mengatur akses ke sumber daya bersama dengan mengirim tugas ke antrian yang sesuai.

  MARK: Menggunakan Operasi Synchronize:
  Anda dapat menggunakan konsep penguncian (locking) atau operasi synchronize untuk mengamankan akses ke sumber daya bersama. Dengan cara ini, hanya satu thread yang dapat mengakses sumber daya pada satu waktu, mencegah race condition.

 Melalui langkah-langkah ini, Anda dapat memastikan akses yang aman terhadap sumber daya bersama dalam lingkungan konkurensi Swift.
 */
//: [Next](@next)
