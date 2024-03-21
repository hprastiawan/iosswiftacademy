//: [Previous](@previous)

import Foundation

// MARK: Access Control Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 5 Poin :

/*
 MARK: Soal  Access Control open

 1. Apa yang membedakan access control open dari access control public di Swift?
 
 2. Apa keuntungan dari menggunakan access control open dalam pengembangan framework atau library Swift?
 
 3. Dapatkah Anda memberikan contoh sebuah kelas yang dideklarasikan dengan access control open dan menjelaskan bagaimaimana subclass dari luar modul dapat mewarisi dan mengubahnya?
 
 4. Buat implementasi class menggunakan open acces control

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: Jawaban:

 MARK: Perbedaan antara open dan public Access Control:
 open memungkinkan entitas (kelas, metode, atau properti) untuk diakses, diwarisi, dan diubah oleh kode di luar modul di mana entitas tersebut didefinisikan. Ini berlaku terutama untuk subclassing dan overriding.
 public memungkinkan entitas untuk diakses dari kode di luar modul di mana entitas tersebut didefinisikan, tetapi tidak memungkinkan subclassing atau overriding dari luar modul. Ini berfungsi sebagai antarmuka untuk pengguna luar tetapi tidak memungkinkan modifikasi yang lebih dalam.

 MARK: Keuntungan Menggunakan Access Control open:
 Memfasilitasi penggunaan framework atau library dalam pengembangan aplikasi.
 Mengizinkan subclassing dan overriding dari luar modul, sehingga memungkinkan kustomisasi yang lebih dalam untuk pengguna framework.

 MARK: Contoh Kelas dengan Access Control open:

 */

open class Vehicle {
    open func start() {
        print("Vehicle started")
    }
}

// Subclassing dari luar modul
class Car: Vehicle {
    override func start() {
        print("Car started")
    }
}
/*
  Dalam contoh ini, Vehicle dideklarasikan dengan access control open, sehingga kelas Car dari luar modul dapat mewarisi kelas Vehicle dan mengubah metodenya.

  MARK: Implementasi Kelas dengan Access Control open:
*/

open class Animal {
    open func makeSound() {
        print("Animal makes a sound")
    }
}

/*
 Dalam contoh di atas, kelas Animal dideklarasikan dengan access control open, sehingga dapat diwarisi dan diubah oleh subclass dari luar modul. Metode makeSound() juga dideklarasikan dengan access control open, memungkinkan subclass untuk melakukan overriding dari luar modul.
 */




// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal Access Control public
 
 1. Bagaimana cara akses entitas yang dideklarasikan dengan access control public dari luar modul tempat entitas tersebut dideklarasikan?
 
 2. Apakah properti yang dideklarasikan dengan access control public dapat diubah nilainya dari luar modul tempat properti tersebut dideklarasikan?
 
 3. Dapatkah Anda memberikan contoh penggunaan access control public dalam sebuah framework Swift yang dibuat untuk penggunaan publik?

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: Jawaban:
 
 MARK: Cara Akses Entitas dengan Access Control public:
 Entitas yang dideklarasikan dengan access control public dapat diakses dari luar modul tempat entitas tersebut dideklarasikan dengan cara menggunakan nama modul diikuti oleh tanda titik (.) dan kemudian nama entitas tersebut. Contoh: ModuleName.EntityName.
 
 MARK: Properti dengan Access Control public dan Kemampuan Perubahan Nilai:
 Properti yang dideklarasikan dengan access control public dapat diakses dari luar modul tempat properti tersebut dideklarasikan. Namun, kemampuan untuk mengubah nilai properti tersebut tergantung pada apakah properti tersebut di-deklarasikan sebagai var (mutable) atau let (immutable). Jika properti di-deklarasikan sebagai var, nilai properti dapat diubah dari luar modul.
 
 MARK: Contoh Penggunaan Access Control public dalam Framework Swift:
 Misalkan kita membuat sebuah framework Swift bernama MyFramework yang berisi kelas MyClass dengan beberapa metode dan properti yang kita ingin jadikan publik. Berikut adalah contoh penggunaannya:
 */

// Dalam framework MyFramework

public class MyClass {
    public var publicProperty: String = "Public Property"
    internal var internalProperty: String = "Internal Property"

    public init() {
        // Constructor
    }

    public func publicMethod() {
        print("Public method")
    }

    internal func internalMethod() {
        print("Internal method")
    }
}

/*
 Dengan deklarasi seperti di atas, pengguna luar modul (dalam aplikasi yang menggunakan framework MyFramework) dapat mengakses dan menggunakan kelas MyClass serta properti dan metodenya yang dideklarasikan dengan access control public.
 */


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal Access Control private

 1. Bagaimana akses terhadap entitas yang dideklarasikan dengan access control private dalam Swift?

 2. Apa keuntungan dari menggunakan access control private dalam membatasi akses ke properti atau metode tertentu?

 3. Apakah entitas yang dideklarasikan dengan access control private dapat diakses dari luar blok deklarasi yang sama?

 4. Dapatkah Anda memberikan contoh penggunaan access control private dalam sebuah project Swift ?

 */


// MARK: JAWABAN SOAL  🤚🤚🤚


/*
 MARK: Jawaban:

 MARK: Akses terhadap Entitas dengan Access Control private:
 Entitas yang dideklarasikan dengan access control private hanya dapat diakses dari dalam blok deklarasi yang sama atau dari ekstensi dari blok deklarasi tersebut. Entitas dengan access control private tidak dapat diakses dari luar blok deklarasinya, bahkan oleh tipe yang sama di dalam modul yang sama.
 
 MARK: Keuntungan dari Menggunakan Access Control private:
 Penggunaan access control private membantu dalam membatasi akses ke properti atau metode tertentu agar hanya dapat diakses dari dalam blok deklarasi yang sama. Ini memungkinkan kita untuk menjaga keamanan dan integritas kode dengan membatasi bagian-bagian yang tidak perlu diakses oleh komponen lain dalam kode atau modul tersebut.
 
 MARK: Akses dari Luar Blok Deklarasi yang Sama:
 Entitas yang dideklarasikan dengan access control private tidak dapat diakses dari luar blok deklarasi yang sama, termasuk dari tipe yang sama di dalam modul yang sama.
 
 MARK: Contoh Penggunaan Access Control private dalam Project Swift:
 Misalkan kita memiliki sebuah struktur dalam project Swift yang mengimplementasikan linked list sederhana dan kita ingin membatasi akses ke node di dalamnya. Berikut adalah contoh penggunaan access control private dalam project tersebut:
 */

struct LinkedList {
    private class Node {
        var value: Int
        var next: Node?

        init(value: Int) {
            self.value = value
            self.next = nil
        }
    }

    private var head: Node?
    private var tail: Node?

    func addToTail(value: Int) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }

    func printList() {
        var current = head
        while current != nil {
            print(current!.value, terminator: " ")
            current = current?.next
        }
        print()
    }
}



/*
 Dalam contoh di atas, entitas Node dan properti head dan tail dideklarasikan dengan access control private untuk membatasi akses ke internal struktur linked list. Ini memastikan bahwa hanya metode yang didefinisikan dalam LinkedList yang dapat mengakses dan mengubah struktur internal linked list tersebut.
 */




// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal 10 Poin :

/*
 MARK: Soal Access Control internal

 1. Apa arti dari access control internal dalam Swift?

 2. Bagaimana cara mengakses entitas yang dideklarasikan dengan access control internal dalam modul yang sama?

 3. Dapatkah entitas yang dideklarasikan dengan access control internal diakses dari luar modul tempat entitas tersebut dideklarasikan?
 4. Buat implementasi class menggunakan internal acces control

 */


// MARK: JAWABAN SOAL  🤚🤚🤚

/*
 MARK: Jawaban:
 
 MARK: Arti dari Access Control internal dalam Swift:
 Access control internal dalam Swift berarti bahwa entitas yang dideklarasikan dengan access control ini dapat diakses dari dalam modul yang sama di mana entitas tersebut dideklarasikan, tetapi tidak dapat diakses dari luar modul tersebut.
 
 MARK: Cara Mengakses Entitas dengan Access Control internal:
 Entitas yang dideklarasikan dengan access control internal dapat diakses dari mana saja di dalam modul yang sama. Ini berarti bahwa entitas tersebut dapat diakses dari setiap bagian dari kode di dalam modul yang sama, termasuk dari kelas, struktur, enumerasi, atau fungsi lain di dalam modul tersebut.
 
 MARK: Akses dari Luar Modul Tempat Deklarasi:
 Entitas yang dideklarasikan dengan access control internal tidak dapat diakses dari luar modul tempat entitas tersebut dideklarasikan. Ini membatasi akses ke entitas tersebut hanya untuk kode di dalam modul yang sama.
 
 MARK: Implementasi Class Menggunakan Access Control internal:
 Berikut adalah contoh implementasi class menggunakan access control internal:
 */

internal class MyClass {
    var property: Int

    init(property: Int) {
        self.property = property
    }

    internal func myMethod() {
        print("This is an internal method")
    }
}

/*
 Dalam contoh di atas, kelas MyClass dideklarasikan dengan access control internal. Artinya, kelas ini dapat diakses dari dalam modul yang sama di mana kelas tersebut dideklarasikan. Metode myMethod() juga dideklarasikan dengan access control internal, yang berarti metode tersebut dapat diakses dari mana saja di dalam modul yang sama.
 */
//: [Next](@next)
