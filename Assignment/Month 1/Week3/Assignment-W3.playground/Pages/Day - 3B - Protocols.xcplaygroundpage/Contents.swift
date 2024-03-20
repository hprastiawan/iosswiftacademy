//: [Previous](@previous)

import Foundation

// MARK: Protocols Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal Soal Property Protokol Sederhana:
1. Buat sebuah protokol Printable yang memiliki satu properti { get } bernama description bertipe String.

2. Implementasikan protokol tersebut pada sebuah struktur Book dengan memberikan nilai awal pada properti description.

 */


// MARK: JAWABAN SOAL  ⚽︎

// Protocol definition
protocol Printable {
    var description: String { get }
}

// Struct implementing the protocol
struct Book: Printable {
    var title: String
    var author: String
    var description: String {
        return "Title: \(title), Author: \(author)"
    }
}

// Example usage
let book = Book(title: "Swift Programming", author: "John Doe")
print(book.description)

/*
 Printable adalah sebuah protokol yang memiliki satu properti yang dapat dibaca (get) bernama description bertipe String.
 Struktur Book mengimplementasikan protokol Printable dengan menambahkan properti title dan author. Properti description diimplementasikan sesuai dengan nilai dari title dan author.
 Ketika membuat instance dari Book, kita dapat menggunakan properti description untuk mendapatkan deskripsi buku tersebut.
 */


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 10  :

/*
MARK: Soal Soal  Metode dan Properti Protokol:
1. Buat protokol Shape dengan satu properti { get } bertipe Double bernama area, dan satu metode { get } dengan nama printDescription().

2. Implementasikan protokol tersebut pada kelas Circle dengan memberikan implementasi untuk kalkulasi area lingkaran dan print deskripsi.


 */


// MARK: JAWABAN SOAL  ⚽︎

// Protocol definition
protocol Shape {
    var area: Double { get }
    func printDescription()
}

// Class implementing the protocol
class Circle: Shape {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    var area: Double {
        return Double.pi * radius * radius
    }

    func printDescription() {
        print("Circle - Radius: \(radius), Area: \(area)")
    }
}

// Example usage
let circle = Circle(radius: 5.0)
circle.printDescription()

/*
 Pada kode di atas:

 Shape adalah sebuah protokol yang memiliki satu properti area bertipe Double dan satu metode printDescription().
 Kelas Circle mengimplementasikan protokol Shape dengan menambahkan properti radius. Properti area dihitung berdasarkan rumus luas lingkaran, sedangkan metode printDescription() menampilkan deskripsi lingkaran berdasarkan nilai radius dan area.
 Ketika membuat instance dari Circle, kita dapat memanggil metode printDescription() untuk mencetak deskripsi lingkaran tersebut.
 */


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 15  :

/*
MARK: Soal Soal  Protokol dengan Inheritance:
1. Buat protokol induk Animal dengan properti { get } bernama name bertipe String dan satu metode { get } dengan nama makeSound().
2. Buat protokol anak Mammal yang mewarisi dari Animal dengan menambahkan properti { get } bernama numberOfLegs bertipe Int.

3. Implementasikan kedua protokol tersebut pada kelas Dog dengan memberikan nilai untuk name dan numberOfLegs, dan memberikan implementasi untuk makeSound().


 */


// MARK: JAWABAN SOAL  ⚽︎

// Parent protocol
protocol AnimalProtocol {
    var name: String { get }
    func makeSound()
}

// Child protocol inheriting from Animal
protocol MammalProtocol: AnimalProtocol {
    var numberOfLegs: Int { get }
}

// Class implementing both protocols
class Dog: MammalProtocol {
    var name: String
    var numberOfLegs: Int

    init(name: String, numberOfLegs: Int) {
        self.name = name
        self.numberOfLegs = numberOfLegs
    }

    func makeSound() {
        print("Woof!")
    }
}

// Example usage
let dog = Dog(name: "Buddy", numberOfLegs: 4)
print("Name: \(dog.name), Number of Legs: \(dog.numberOfLegs)")
dog.makeSound()

/*
 Pada contoh di atas:

 Protokol Animal didefinisikan dengan properti name bertipe String dan metode makeSound().
 Protokol Mammal didefinisikan sebagai anak protokol dari Animal, menambahkan properti numberOfLegs bertipe Int.
 Kelas Dog mengimplementasikan kedua protokol tersebut, dengan properti name dan numberOfLegs serta metode makeSound().
 Ketika membuat instance dari Dog, properti name dan numberOfLegs dapat diatur, dan metode makeSound() dapat dipanggil untuk membuat suara anjing.
 */
//: [Next](@next)
