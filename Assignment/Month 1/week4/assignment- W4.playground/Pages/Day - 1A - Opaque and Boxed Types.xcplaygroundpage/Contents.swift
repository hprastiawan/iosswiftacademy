//: [Previous](@previous)

import Foundation


// MARK: Opaque & Boxed Types Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal 1: Opaque Types (10 poin)
 1. Buatlah sebuah protokol Shape dengan metode draw yang mengembalikan string.
 2. Implementasikan dua tipe struktur, Circle dan Rectangle, yang mengikuti protokol Shape dengan mengimplementasikan metode draw.
 3. Buatlah fungsi createShape yang mengembalikan tipe data opak sesuai dengan protokol Shape.
 4. Implementasikan dua kasus penggunaan dari fungsi createShape, satu menggunakan Circle dan yang lain menggunakan Rectangle.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

// Definisi protokol Shape
protocol Shape {
    func draw() -> String
}

// Struktur Circle yang mengikuti protokol Shape
struct Circle: Shape {
    func draw() -> String {
        return "Drawing a circle"
    }
}

// Struktur Rectangle yang mengikuti protokol Shape
struct Rectangle: Shape {
    func draw() -> String {
        return "Drawing a rectangle"
    }
}

func createShape(isCircle: Bool) -> Shape {
    if isCircle {
        return Circle() // Kembalikan nilai dengan tipe yang sama dengan protokol Shape
    } else {
        return Rectangle() // Kembalikan nilai dengan tipe yang sama dengan protokol Shape
    }
}


// Contoh penggunaan fungsi createShape
let shape1 = createShape(isCircle: true)
print(shape1.draw()) // Output: Drawing a circle

let shape2 = createShape(isCircle: false)
print(shape2.draw()) // Output: Drawing a rectangle

/*
 Dalam contoh di atas, kita memiliki protokol Shape yang memiliki metode draw(). Kemudian, dua struktur Circle dan Rectangle diimplementasikan untuk mengikuti protokol Shape.
 Fungsi createShape mengembalikan tipe data opak sesuai dengan protokol Shape, yang bisa berupa Circle atau Rectangle tergantung pada parameter yang diberikan.
 */


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 15 Poin :

/*
 MARK: Soal 2: Existential Types (15 poin)
 1. Buatlah protokol Vehicle dengan atribut model dan metode startEngine, yang mengembalikan string.

 2. Implementasikan dua tipe struktur, Car dan Motorcycle, yang mengikuti protokol Vehicle.

 3. Buatlah wadah eksistensial (existential container) untuk menyimpan nilai-nilai yang sesuai dengan protokol Vehicle.

 4. Implementasikan fungsi operateVehicle yang menerima parameter wadah eksistensial dan memanggil metode startEngine dari nilai di dalam wadah tersebut.
 5. Demonstrasikan penggunaan fungsi operateVehicle dengan membuat beberapa objek Car dan Motorcycle, menempatkannya dalam wadah eksistensial, dan memanggil fungsi operateVehicle untuk masing-masingnya.


 MARK: Catatan:
 Berikan penjelasan atau komentar di setiap bagian kode untuk menjelaskan implementasi Anda.
 Gunakan Opaque Types pada Soal 1 dan Existential Types pada Soal 2.
 Nilai kesulitan poin 5, 10, dan 15 diberikan berdasarkan kompleksitas tugas dan kreativitas dalam penerapan konsep.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚


// MARK: Definisi protokol Vehicle
protocol Vehicle {
    var model: String { get }
    func startEngine() -> String
}

// MARK: Implementasi tipe struktur Car yang mengikuti protokol Vehicle
struct Car: Vehicle {
    var model: String

    func startEngine() -> String {
        return "Starting the engine of \(model)"
    }
}

// MARK: Implementasi tipe struktur Motorcycle yang mengikuti protokol Vehicle
struct Motorcycle: Vehicle {
    var model: String

    func startEngine() -> String {
        return "Starting the engine of \(model)"
    }
}

// MARK: Wadah eksistensial untuk menyimpan nilai-nilai yang sesuai dengan protokol Vehicle
// MARK: Existential container menggunakan keyword 'Any' di sini
typealias AnyVehicle = Vehicle

// MARK: Implementasi fungsi operateVehicle untuk memanggil metode startEngine dari nilai di dalam wadah eksistensial
func operateVehicle(_ vehicle: AnyVehicle) {
    print(vehicle.startEngine())
}

// MARK: Demonstrasi penggunaan fungsi operateVehicle
let car = Car(model: "Toyota Camry")
let motorcycle = Motorcycle(model: "Honda CBR")

let vehicle1: AnyVehicle = car
operateVehicle(vehicle1) // Output: Starting the engine of Toyota Camry

let vehicle2: AnyVehicle = motorcycle
operateVehicle(vehicle2) // Output: Starting the engine of Honda CBR


/*

MARK:  Penjelasan:

 Pertama, kita mendefinisikan protokol Vehicle dengan atribut model dan metode startEngine().
 Kemudian, kita mengimplementasikan dua tipe struktur Car dan Motorcycle yang mengikuti protokol Vehicle.
 Selanjutnya, kita mendefinisikan wadah eksistensial AnyVehicle menggunakan tipe protokol Vehicle.
 Setelah itu, kita mengimplementasikan fungsi operateVehicle yang menerima parameter wadah eksistensial dan memanggil metode startEngine() dari nilai di dalam wadah tersebut.
 Terakhir, kita mendemonstrasikan penggunaan fungsi operateVehicle dengan membuat beberapa objek Car dan Motorcycle, menempatkannya dalam wadah eksistensial, dan memanggil fungsi operateVehicle untuk masing-masingnya.
 */

//: [Next](@next)
