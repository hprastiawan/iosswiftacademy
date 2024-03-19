//: [Previous](@previous)

import Foundation

// MARK: Class Swift


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 5:

/*
 MARK: Class dan Properties:
 Buatlah class Student dengan dua properti, yaitu name (nama siswa) dan age (usia siswa). Berikan nilai default untuk properti age (misalnya, 0). Kemudian, buat instance dari class Student dengan nama "Alice" dan usia 20.

 MARK: Initializer:
 Tambahkan initializer pada class Person yang menerima nama dan usia sebagai parameter dan menginisialisasi propertinya. Buat instance baru dengan menggunakan initializer tersebut dan berikan nama "Bob" dan usia 25.

 */

// MARK: Jawaban Class dan Properties

// Deklarasi class Student

class Student {
    var name: String
    var age: Int

    // Inisialisasi properti age dengan nilai default 0
    init(name: String, age: Int = 0) {
        self.name = name
        self.age = age
    }
}

// Buat instance dari class Student dengan nama "Alice" dan usia 20
let alice = Student(name: "Alice", age: 20)


// MARK: Jawaban Initializer Class

// Deklarasi class Person dengan initializer
class Person {
    var name: String
    var age: Int

    // Initializer dengan dua parameter
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// Buat instance baru dengan menggunakan initializer dan berikan nama "Bob" dan usia 25
let bob = Person(name: "Bob", age: 25)



// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 10:

/*
 MARK: Method dan Mutating:
 Tambahkan method birthday pada class Person yang akan menambahkan satu tahun pada usia seseorang. Pastikan method tersebut bersifat mutating. Buat instance baru dari class Person dengan nama "Charlie" dan usia 30, kemudian panggil method birthday dan cetak usia setelah metode tersebut dipanggil.

 MARK: Properties dan Computed Properties:
 Tambahkan computed property isAdult pada class Person yang mengembalikan true jika usia seseorang lebih dari atau sama dengan 18, dan false jika sebaliknya. Buat instance baru dengan nama "David" dan usia 17, lalu cetak hasil dari computed property isAdult.


 */

// MARK: Jawaban Method dan Mutating:

// Deklarasi class Person
class Person {
    var name: String
    var age: Int

    // Initializer dengan dua parameter
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    // Method birthday untuk menambahkan satu tahun pada usia seseorang (bersifat mutating)
    func birthday() {
        age += 1
    }

    // Computed property isAdult untuk mengecek apakah seseorang sudah dewasa atau tidak
    var isAdult: Bool {
        return age >= 18
    }
}

// Buat instance baru dari class Person dengan nama "Charlie" dan usia 30
var charlie = Person(name: "Charlie", age: 30)

// Panggil method birthday dan cetak usia setelah metode tersebut dipanggil
charlie.birthday()
print("Usia setelah ulang tahun: \(charlie.age)")

// MARK: Jawaban Properties dan Computed Properties:


// Buat instance baru dengan nama "David" dan usia 17
let david = Person(name: "David", age: 17)

// Cetak hasil dari computed property isAdult
print("Apakah David sudah dewasa? \(david.isAdult)")


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 15:

/*
 MARK: Inheritance dan Overriding:
 Buat class induk Shape dengan properti name dan method area yang mengembalikan nilai 0. Buat class anak Rectangle yang merupakan subclass dari Shape dengan tambahan properti width dan height. Override method area di class Rectangle untuk menghitung luas persegi panjang. Buat instance dari Rectangle dengan lebar 5 dan tinggi 10, lalu cetak luasnya.

 MARK: Static Method dan Properties:
 Tambahkan static property totalStudents pada class Student untuk melacak total siswa yang telah dibuat. Tambahkan static method printTotalStudents yang mencetak total siswa. Buat beberapa instance dari class Student dengan nama dan usia yang berbeda, panggil printTotalStudents dan lihat hasilnya.

 */

// MARK: JAWABAN Inheritance dan Overriding:

// Deklarasi class induk Shape
class Shape {
    var name: String

    init(name: String) {
        self.name = name
    }

    // Method area dengan implementasi default yang mengembalikan 0
    func area() -> Double {
        return 0
    }
}

// Deklarasi class anak Rectangle yang merupakan subclass dari Shape
class Rectangle: Shape {
    var width: Double
    var height: Double

    // Initializer untuk Rectangle dengan parameter width dan height
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(name: "Rectangle")
    }

    // Override method area untuk menghitung luas persegi panjang
    override func area() -> Double {
        return width * height
    }
}

// Buat instance dari Rectangle dengan lebar 5 dan tinggi 10
let rectangle = Rectangle(width: 5, height: 10)
// Cetak luasnya
print("Luas persegi panjang: \(rectangle.area())")


// MARK: JAWABAN Static Method dan Properties:

// Deklarasi class Student
class Student {
    var name: String
    var age: Int
    static var totalStudents: Int = 0

    init(name: String, age: Int) {
        self.name = name
        self.age = age
        // Increment totalStudents setiap kali instance baru dibuat
        Student.totalStudents += 1
    }

    // Static method untuk mencetak total siswa
    static func printTotalStudents() {
        print("Total students: \(totalStudents)")
    }
}

// Buat beberapa instance dari class Student dengan nama dan usia yang berbeda
let student1 = Student(name: "Alice", age: 20)
let student2 = Student(name: "Bob", age: 22)
let student3 = Student(name: "Charlie", age: 25)

// Panggil static method printTotalStudents
Student.printTotalStudents()
//: [Next](@next)
