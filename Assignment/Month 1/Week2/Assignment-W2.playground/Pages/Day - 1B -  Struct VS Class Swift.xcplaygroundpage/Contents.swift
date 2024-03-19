//: [Previous](@previous)

import Foundation

// MARK: Struct VS Class Swift ☀️😃🥳


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal Poin 5 :

/*
 MARK: Struct Basic:
 Buatlah sebuah struct bernama Person dengan dua properti: name (String) dan age (Int). Inisialisasi struct dengan nilai default dan buat instance john dengan nama "John" dan usia 25.

 MARK: Struct Method:
 Tambahkan metode ke struct Circle untuk menghitung luasnya (pi * radius^2). Buat instance myCircle dengan radius 5 dan cetak luasnya.

 MARK: Struct Memberwise Initializer:
 Buat struct Book dengan properti title (String) dan pages (Int). Gunakan memberwise initializer untuk membuat instance myBook dengan judul "Swift Programming" dan 300 halaman.


 */


// MARK: JAWABAN Struct Basic

struct Person {
    var name: String
    var age: Int

    init(name: String = "John", age: Int = 25) {
        self.name = name
        self.age = age
    }
}

// Inisialisasi struct dengan nilai default
let john = Person()


// MARK: JAWABAN Struct Method

struct Circle {
    var radius: Double

    func calculateArea() -> Double {
        let pi = 3.14 // Atau bisa menggunakan Double.pi
        return pi * radius * radius
    }
}

// Buat instance myCircle dengan radius 5 dan cetak luasnya
let myCircle = Circle(radius: 5)
print("Luas lingkaran:", myCircle.calculateArea())


// MARK: Struct Memberwise Initializer

struct Book {
    var title: String
    var pages: Int
}

// Gunakan memberwise initializer untuk membuat instance myBook
let myBook = Book(title: "Swift Programming", pages: 300)
print("Judul buku:", myBook.title)
print("Jumlah halaman:", myBook.pages)

// ------------------------||-----------------------------------||-------------------------------------------||----------
// ------------------------||-----------------------------------||-------------------------------------------||----------

// MARK: Soal Soal Poin 10 :

/*
 MARK: Struct Inheritance:
 Buatlah struct dasar Vehicle dengan properti brand (String) dan year (Int). Selanjutnya, buat struct anak Car yang mewarisi dari Vehicle dengan tambahan properti model (String). Buat instance myCar dengan brand "Toyota", model "Camry", dan tahun 2022.

 MARK: Struct Method Overriding:
 Buat struct Employee dengan properti name (String) dan salary (Double). Tambahkan metode calculateBonus() yang mengembalikan 10% dari gaji. Buat struct anak Manager yang mewarisi dari Employee dan override metode calculateBonus() untuk memberikan bonus sebesar 20%. Buat instance manager1 dengan nama "Alice" dan gaji 5000.


 */


// MARK: JAWABAN Struct Inheritance:

// Struct Inheritance
struct Vehicle {
    var brand: String
    var year: Int
}

struct Car: Vehicle {
    var model: String
}

// Buat instance myCar dengan brand "Toyota", model "Camry", dan tahun 2022
let myCar = Car(brand: "Toyota", year: 2022, model: "Camry")
print("Mobil: \(myCar.brand) \(myCar.model) tahun \(myCar.year)")



// MARK: JAWABAN Struct Method Overriding:

// Struct Method Overriding
struct Employee {
    var name: String
    var salary: Double

    func calculateBonus() -> Double {
        return salary * 0.1 // Bonus 10% dari gaji
    }
}

struct Manager: Employee {
    override func calculateBonus() -> Double {
        return salary * 0.2 // Bonus 20% dari gaji
    }
}

// Buat instance manager1 dengan nama "Alice" dan gaji 5000
let manager1 = Manager(name: "Alice", salary: 5000)
print("Bonus yang diterima oleh \(manager1.name): $\(manager1.calculateBonus())")


// ------------------------||-----------------------------------||-------------------------------------------||----------
// ------------------------||-----------------------------------||-------------------------------------------||----------

// MARK: Soal Soal Poin 15 :

/*
 MARK: Struct Enum and Associated Values:
 Buatlah enum Measurement dengan kasus length(Double), width(Double), dan height(Double). Selanjutnya, buat struct Box dengan properti label (String) dan array yang berisi nilai-nilai Measurement. Hitung dan kembalikan volume dari Box berdasarkan nilai-nilai tersebut.

 MARK: Struct Advanced Initialization:
 Buat struct Color dengan properti red, green, dan blue (semuanya bertipe Double). Implementasikan metode khusus (initializer) yang memastikan bahwa nilai-nilai warna berada dalam rentang 0 hingga 1. Buat instance myColor dengan nilai red 1.5, green 0.8, dan blue 0.2.

 MARK: Struct Custom Protocol Conformance:
 Buat protokol Shape dengan metode area() yang mengembalikan luas bentuk. Implementasikan protokol tersebut pada struct Rectangle dengan properti length dan width. Buat instance myRectangle dan hitung luasnya

 */

// MARK: JAWABAN Struct Enum and Associated Values:

// Struct Enum and Associated Values
enum Measurement {
    case length(Double)
    case width(Double)
    case height(Double)
}

struct Box {
    var label: String
    var measurements: [Measurement]

    func calculateVolume() -> Double {
        var length: Double?
        var width: Double?
        var height: Double?

        for measurement in measurements {
            switch measurement {
            case .length(let value):
                length = value
            case .width(let value):
                width = value
            case .height(let value):
                height = value
            }
        }

        guard let l = length, let w = width, let h = height else {
            return 0
        }

        return l * w * h
    }
}

// Buat instance myBox dengan properti label "Box1" dan array nilai-nilai Measurement
let myBox = Box(label: "Box1", measurements: [.length(2.0), .width(3.0), .height(4.0)])
print("Volume dari \(myBox.label) adalah \(myBox.calculateVolume())")



// MARK: JAWABAN Struct Advanced Initialization:

// Struct Advanced Initialization
struct Color {
    var red: Double
    var green: Double
    var blue: Double

    init(red: Double, green: Double, blue: Double) {
        self.red = max(0, min(1, red))
        self.green = max(0, min(1, green))
        self.blue = max(0, min(1, blue))
    }
}

// Buat instance myColor dengan nilai-nilai red 1.5, green 0.8, dan blue 0.2
let myColor = Color(red: 1.5, green: 0.8, blue: 0.2)
print("Warna: R(\(myColor.red)), G(\(myColor.green)), B(\(myColor.blue))")



// MARK: JAWABAN Struct Custom Protocol Conformance:

// Struct Custom Protocol Conformance
protocol Shape {
    func area() -> Double
}

struct Rectangle: Shape {
    var length: Double
    var width: Double

    func area() -> Double {
        return length * width
    }
}

// Buat instance myRectangle dan hitung luasnya
let myRectangle = Rectangle(length: 5.0, width: 3.0)
print("Luas dari persegi panjang adalah \(myRectangle.area())")

// MARK: OUTPUT:
/*
 Volume dari Box1 adalah 24.0
 Warna: R(1.0), G(0.8), B(0.2)
 Luas dari persegi panjang adalah 15.0
 */
//: [Next](@next)
