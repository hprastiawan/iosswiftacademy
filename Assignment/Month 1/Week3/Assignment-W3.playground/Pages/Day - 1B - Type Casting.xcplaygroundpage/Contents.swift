//: [Previous](@previous)

import Foundation

// MARK: Type Casting Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal Soal
 Apa yang dimaksud dengan upcasting dalam konteks type casting di Swift?
 Berikan contoh sederhana penggunaan upcasting.
 Apa itu operator is dalam Swift dan bagaimana penggunaannya?
 Berikan contoh penggunaan operator is untuk melakukan type checking.
 */


// MARK: JAWABAN 1 & 2

/*
 Upcasting dalam konteks type casting di Swift merujuk pada proses mengubah sebuah objek dari tipe turunan menjadi tipe induknya.
 Dalam hierarki pewarisan kelas, upcasting memungkinkan Anda untuk mengkonversi objek dari tipe turunan menjadi tipe superclass atau tipe protokol yang lebih umum.

 Contoh sederhana penggunaan upcasting adalah sebagai berikut:

 */

class Animal {
    func makeSound() {
        print("Animal makes a sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Dog barks")
    }
}

// Upcasting: Mengubah objek dari tipe turunan (Dog) menjadi tipe induknya (Animal)
let myDog: Animal = Dog()
myDog.makeSound() // Output: "Dog barks"


// MARK: JAWABAN 3 & 4

/*
 Operator is digunakan dalam Swift untuk melakukan type checking, yaitu memeriksa apakah sebuah objek memiliki tipe tertentu. Operator ini mengembalikan nilai true jika objek sesuai dengan tipe yang ditentukan, dan false jika tidak.

 Contoh penggunaan operator is:
 */

let myAnimal = Dog()

if myAnimal is Animal {
    print("myAnimal is an instance of Animal")
} else {
    print("myAnimal is not an instance of Animal")
}

/*
 Dalam contoh di atas, jika myAnimal adalah sebuah instance dari kelas Animal atau subclassnya, maka kondisi akan bernilai true, dan pesan "myAnimal is an instance of Animal" akan dicetak.
 Jika tidak, maka kondisi akan bernilai false, dan pesan "myAnimal is not an instance of Animal" akan dicetak.
 */

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||--------------------------

// MARK: Soal Soal Poin 10  :

/*
MARK: Soal Soal
 Jelaskan perbedaan antara operator as? dan as! dalam konteks downcasting.
 Mengapa disarankan untuk menggunakan as? daripada as! ketika melakukan downcasting?
 Buatlah kelas abstrak Shape dan turunannya Circle, Square, dan Triangle.
 Gunakan type casting untuk memanipulasi objek-objek ini dalam sebuah array.
 */


// MARK: JAWABAN

/*
 MARK: Perbedaan antara as? dan as! dalam konteks downcasting:

 MARK: as?:
 Menggunakan as? untuk downcasting akan mencoba melakukan downcasting objek ke tipe yang ditentukan.
 Jika downcasting berhasil, nilai akan diberikan sebagai opsional dari tipe yang ditentukan.
 Jika downcasting gagal, nilai akan menjadi nil tanpa menyebabkan runtime error.
 Ini aman digunakan ketika Anda tidak yakin apakah downcasting akan berhasil.
 MARK: as!:
 Menggunakan as! untuk downcasting akan secara paksa mencoba untuk downcast objek ke tipe yang ditentukan.
 Jika downcasting berhasil, nilai akan diberikan sebagai tipe yang ditentukan.
 Jika downcasting gagal, ini akan menyebabkan runtime error.
 Ini harus digunakan hanya ketika Anda yakin bahwa downcasting akan berhasil.
 */

/*
 MARK: Disarankan menggunakan as? daripada as!
 ketika melakukan downcasting karena as? lebih aman digunakan. Jika downcasting gagal, as? hanya akan menghasilkan nilai nil tanpa menyebabkan runtime error, yang memungkinkan kode untuk terus berjalan.
 Sementara itu, jika downcasting gagal dengan as!, itu akan menyebabkan runtime error, yang dapat menyebabkan crash aplikasi.
 */

/*
 MARK: Contoh implementasi:

 */

class Shape {
    func draw() {
        print("Drawing a shape")
    }
}

class Circle: Shape {
    override func draw() {
        print("Drawing a circle")
    }
}

class Square: Shape {
    override func draw() {
        print("Drawing a square")
    }
}

class Triangle: Shape {
    override func draw() {
        print("Drawing a triangle")
    }
}

let shapes: [Shape] = [Circle(), Square(), Triangle()]

for shape in shapes {
    if let circle = shape as? Circle {
        circle.draw()
    } else if let square = shape as? Square {
        square.draw()
    } else if let triangle = shape as? Triangle {
        triangle.draw()
    } else {
        print("Unknown shape")
    }
}

/*
 Dalam contoh di atas, kita memiliki array shapes yang berisi objek-objek berbagai jenis bentuk (Circle, Square, dan Triangle). Kita menggunakan as? untuk melakukan downcasting dari setiap objek dalam array ke tipe bentuk spesifiknya (Circle, Square, atau Triangle). Jika downcasting berhasil, metode draw() dari bentuk yang sesuai akan dipanggil.
 Jika downcasting gagal, pesan "Unknown shape" akan dicetak.
 */

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||--------------------------

// MARK: Soal Soal Poin 15  :

/*
MARK: Soal Soal
 1. Buatlah contoh kasus di mana Anda memiliki array objek dengan tipe dasar Any dan lakukan type casting untuk mengakses metode atau properti khusus dari objek-objek tersebut.

 2. Apa peran type casting dalam pemrograman berorientasi objek?

 3. Bagaimana type casting memfasilitasi polimorfisme dan fleksibilitas dalam pengelolaan objek?

 */


// MARK: JAWABAN

/*
 MARK: Contoh Kasus:

 Misalkan kita memiliki array objek dengan tipe dasar Any, yang mungkin berisi berbagai jenis objek. Kita ingin mengakses metode atau properti khusus dari objek-objek tersebut menggunakan type casting.
 */

class Animal1 {
    func makeSound() {
        print("Making a sound")
    }
}

class Dog1: Animal {
    override func makeSound() {
        print("Barking")
    }

    func fetch() {
        print("Fetching")
    }
}

class Cat: Animal1 {
    override func makeSound() {
        print("Meowing")
    }

    func jump() {
        print("Jumping")
    }
}

let objects: [Any] = [Dog1(), Cat()]

for object in objects {
    if let animal = object as? Animal1 {
        animal.makeSound()

        if let dog = animal as? Dog1 {
            dog.fetch()
        } else if let cat = animal as? Cat {
            cat.jump()
        }
    }
}

/*
 Dalam contoh di atas, kita memiliki array objects yang berisi objek dengan tipe dasar Any, yang bisa berisi objek Dog atau Cat. Kita menggunakan type casting (as?) untuk mengakses metode khusus dari objek-objek tersebut. Jika objek adalah Dog, kita memanggil metode fetch(), dan jika objek adalah Cat, kita memanggil metode jump().
 */

/*
 MARK: Peran Type Casting dalam Pemrograman Berorientasi Objek:

 Type casting memungkinkan kita untuk mengkonversi atau mengubah tipe satu objek menjadi tipe lain, baik secara aman (dengan as?) maupun secara paksa (dengan as!).
 Ini memungkinkan aplikasi untuk mengelola dan memanipulasi objek dengan tipe yang berbeda-beda dalam konteks yang sama.
 */

/*
 MARK: Bagaimana Type Casting Memfasilitasi Polimorfisme dan Fleksibilitas:

 Dengan type casting, kita dapat mengakses metode atau properti khusus dari objek yang mewarisi dari kelas yang sama atau yang mengimplementasikan protokol yang sama.
 Ini memungkinkan polimorfisme, di mana kita dapat memperlakukan objek yang berbeda-beda secara seragam dalam suatu hierarki pewarisan atau protokol.
 Ini memberikan fleksibilitas dalam pengelolaan objek, karena kita dapat bekerja dengan objek dengan tipe yang berbeda-beda secara dinamis tergantung pada kebutuhan aplikasi.
 */


//: [Next](@next)
