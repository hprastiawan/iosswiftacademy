//: [Previous](@previous)

import Foundation

// MARK: Macros Swift ☀️😃🥳


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Seputar Macros  :

/*
MARK: Soal Soal
Jelaskan Apa itu Macros ?
Jelaskan untuk apa kegunaan Freestanding Macros dan berikan contohnya
Jelaskan untuk apa kegunaan Attached Macros dan berikan contohnya

 */


// MARK: JAWABAN

/*
 MARK: Apa itu Macros Swift?
 Macros dalam Swift adalah potongan kode yang digunakan untuk menggantikan atau memperluas teks secara otomatis dalam kode program. Macros digunakan dengan direktif praprosesor seperti #define dalam bahasa C, tetapi Swift tidak memiliki fitur makro seperti bahasa C.
 Namun, beberapa konsep mirip dengan makro, tetapi diimplementasikan dengan cara yang berbeda, seperti penggunaan generics, fungsi inline, atau atribut khusus.
 */

/*
 MARK: Freestanding Macros dan Kegunaannya:
 Freestanding Macros adalah makro yang didefinisikan secara independen dari kode program dan dapat digunakan di mana saja dalam kode tersebut.
 Kegunaannya adalah untuk menggantikan atau memperluas teks secara otomatis tanpa harus bergantung pada struktur atau lingkup tertentu. Contoh penggunaan Freestanding Macros dalam Swift mungkin melibatkan definisi konstanta global, seperti:
 */
#define PI 3.14159
let radius = 5.0
let circleArea = PI * radius * radius

/*
 MARK: Attached Macros dan Kegunaannya:
 Attached Macros adalah makro yang terikat atau terasosiasi dengan objek tertentu dalam kode program, seperti fungsi atau struktur data.
 Kegunaannya adalah untuk memodifikasi atau memperluas perilaku objek yang terkait dengan makro tersebut. Contoh penggunaan Attached Macros dalam Swift mungkin melibatkan modifikasi perilaku fungsi dengan menggunakan atribut:

 */

@IBAction func buttonTapped(sender: UIButton) {
    // Do something when the button is tapped
}

/*
 Di sini, @IBAction adalah sebuah Attached Macro yang mengubah perilaku fungsi buttonTapped, sehingga fungsi tersebut dapat dihubungkan ke antarmuka pengguna (UI) dalam aplikasi iOS.
 */

//: [Next](@next)
