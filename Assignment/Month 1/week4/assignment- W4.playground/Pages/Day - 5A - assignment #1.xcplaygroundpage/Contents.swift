//: [Previous](@previous)

import Foundation

// MARK: Assignment 1 Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Structure & Classes :

/*
 MARK: Soal 1:  Structure & Classes


 MARK: Penerapan Struktur dan Kelas (20 points):

    - Keakuratan dalam mendefinisikan model data dengan struktur dan kelas.
    - Penggunaan inheritance yang efektif untuk mengelola berbagai tipe pengguna.


 TODO: Soal Structure & Classes  Swift | Pilih Salah Satu

 1. Implementasikan sebuah struktur Point dalam Swift yang merepresentasikan koordinat X dan Y dalam sebuah ruang dua dimensi. Berikan properti untuk masing-masing koordinat dan tambahkan sebuah metode untuk menghitung jarak antara titik saat ini dengan titik lainnya.


 2. Buatlah sebuah kelas Person yang merepresentasikan seseorang dalam sebuah aplikasi manajemen kontak. Kelas tersebut harus memiliki properti untuk nama, usia, dan alamat email. Tambahkan metode untuk mencetak informasi lengkap tentang seseorang tersebut.


 3. Anda sedang mengembangkan aplikasi toko daring. Implementasikan sebuah kelas Product untuk merepresentasikan produk yang dijual di toko tersebut. Setiap produk memiliki properti untuk nama, harga, dan jumlah stok. Tambahkan metode untuk mengurangi stok ketika produk dibeli.

 4. Implementasikan sebuah protokol Container yang menggunakan generics untuk merepresentasikan kontainer yang dapat menyimpan sejumlah nilai. Buatlah sebuah kelas Box yang mengadopsi protokol tersebut dan memiliki kemampuan untuk menyimpan sebuah array dari tipe data yang ditentukan oleh generic. Tambahkan metode untuk menambah dan mengambil nilai dari kontainer tersebut.


 5. Buatlah sebuah protokol Drawable yang mendefinisikan sebuah metode draw() untuk menggambar objek tertentu. Implementasikan kelas Circle dan Rectangle yang mewarisi protokol Drawable dan memiliki properti yang diperlukan serta implementasi untuk metode draw() untuk menggambar bentuk lingkaran dan persegi panjang.


 6. Anda sedang mengembangkan aplikasi manajemen tugas. Implementasikan sebuah kelas generik TaskManager<T> yang menggunakan generics untuk mengelola daftar tugas dengan tipe data yang bervariasi. Tambahkan metode untuk menambah, menghapus, dan menampilkan daftar tugas. Selain itu, buatlah sebuah extension untuk TaskManager yang menambahkan fungsi untuk mengurutkan daftar tugas berdasarkan tanggal jatuh tempo.


 */


// MARK: JAWABAN SOAL  🤚🤚🤚


// Berikut adalah implementasi untuk masing-masing soal:

// MARK: Struktur Point dalam Swift:

struct Point {
    var x: Double
    var y: Double

    func distance(to point: Point) -> Double {
        let deltaX = point.x - self.x
        let deltaY = point.y - self.y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
}

// MARK: Kelas Person untuk manajemen kontak:

class Person {
    var name: String
    var age: Int
    var email: String

    init(name: String, age: Int, email: String) {
        self.name = name
        self.age = age
        self.email = email
    }

    func printInfo() {
        print("Name: \(name), Age: \(age), Email: \(email)")
    }
}

// MARK: Kelas Product untuk merepresentasikan produk di toko daring:

class Product {
    var name: String
    var price: Double
    var stock: Int

    init(name: String, price: Double, stock: Int) {
        self.name = name
        self.price = price
        self.stock = stock
    }

    func purchase(quantity: Int) {
        guard stock >= quantity else {
            print("Not enough stock available")
            return
        }
        stock -= quantity
        print("\(quantity) \(name)(s) purchased successfully")
    }
}

// MARK: Protokol Container dan kelas Box:

protocol Container {
    associatedtype Item
    mutating func addItem(_ item: Item)
    func getItem() -> Item?
}

class Box<T>: Container {
    var items = [T]()

    func addItem(_ item: T) {
        items.append(item)
    }

    func getItem() -> T? {
        return items.isEmpty ? nil : items.removeFirst()
    }
}

// MARK: Protokol Drawable, dan kelas Circle dan Rectangle:

protocol Drawable {
    func draw()
}

class Circle: Drawable {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func draw() {
        print("Drawing a circle with radius \(radius)")
    }
}

class Rectangle: Drawable {
    var width: Double
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func draw() {

        print("Drawing a rectangle with width \(width) and height \(height)")
    }
}


// MARK: Kelas generik TaskManager<T> untuk manajemen tugas:

class TaskManager<T> {
    var tasks = [T]()

    func addTask(_ task: T) {
        tasks.append(task)
    }

    func removeTask(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks.remove(at: index)
    }

    func displayTasks() {
        print("Tasks:")
        for (index, task) in tasks.enumerated() {
            print("\(index + 1). \(task)")
        }
    }
}

// Extension untuk mengurutkan daftar tugas berdasarkan tanggal jatuh tempo
extension TaskManager where T: Comparable {
    func sortTasksByDeadline() {
        tasks.sort(by: { ($0 as! Comparable) < ($1 as! Comparable) })
    }
}



// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Optional Chaining:

/*
 MARK: Soal 1:  Optional Chaining


 MARK: Penerapan Optional Chaining (20 points):

 - Kemampuan untuk menggunakan optional chaining dalam mengakses data pesanan.
 - Keefektifan dalam menghindari crash akibat nilai-nilai yang mungkin nil.



 TODO: Soal Optional Chaining Swift | Pilih Salah Satu

 1. Anda sedang mengembangkan sebuah aplikasi untuk mengelola data pengguna. Salah satu fiturnya adalah menampilkan nama lengkap pengguna, tetapi beberapa pengguna mungkin tidak memiliki nama tengah. Implementasikan cara menggunakan optional chaining untuk mengakses dan mencetak nama lengkap pengguna dengan format "Nama Depan Nama Tengah Nama Belakang" jika nama tengah tersedia, atau "Nama Depan Nama Belakang" jika nama tengah tidak tersedia.


 2. Dalam pengembangan aplikasi e-commerce, Anda memiliki sebuah struktur data yang merepresentasikan produk-produk di toko Anda. Setiap produk memiliki opsi untuk memiliki diskon. Implementasikan optional chaining untuk mengakses diskon produk tertentu. Jika produk memiliki diskon, cetak persentase diskonnya; jika tidak, cetak pesan bahwa produk tidak memiliki diskon.


 3. Anda sedang mengembangkan aplikasi cuaca yang menggunakan layanan web untuk mengambil data cuaca terkini dari berbagai kota. Implementasikan optional chaining untuk mengakses nilai suhu saat ini dari data cuaca yang diterima dari server. Jika suhu tersedia, cetak suhu saat ini; jika tidak, cetak pesan bahwa data suhu tidak tersedia.

 4. Anda sedang mengembangkan aplikasi manajemen proyek yang memiliki struktur data berhierarki, di mana setiap proyek memiliki subproyek dan setiap subproyek dapat memiliki tugas yang terkait. Implementasikan optional chaining untuk mengakses dan mencetak daftar tugas dari subproyek tertentu dalam proyek induk. Pastikan untuk menangani kasus di mana subproyek tidak memiliki tugas.


 5. Dalam pengembangan aplikasi penyedia layanan kesehatan, Anda memiliki model untuk merepresentasikan rekam medis pasien. Setiap pasien memiliki daftar riwayat penyakit yang dapat berupa diagnosa atau null jika pasien tersebut tidak memiliki riwayat penyakit. Implementasikan optional chaining untuk mengakses dan mencetak diagnosa terakhir dari pasien tertentu. Jika pasien tidak memiliki riwayat penyakit, cetak pesan yang sesuai.


 6. Anda sedang mengembangkan permainan petualangan di mana karakter pemain dapat berinteraksi dengan berbagai objek dalam lingkungan. Setiap objek memiliki kemungkinan untuk memiliki deskripsi atau null jika tidak ada deskripsi yang tersedia. Implementasikan optional chaining untuk mengakses dan mencetak deskripsi dari objek yang diinteraksikan oleh karakter pemain. Jika deskripsi tidak tersedia, cetak pesan yang sesuai.

 */


// MARK: JAWABAN SOAL  🤚🤚🤚


// Berikut adalah implementasi untuk masing-masing soal:

// MARK: Optional chaining untuk menampilkan nama lengkap pengguna:

struct User {
    var firstName: String
    var middleName: String?
    var lastName: String

    func printFullName() {
        if let middleName = middleName {
            print("\(firstName) \(middleName) \(lastName)")
        } else {
            print("\(firstName) \(lastName)")
        }
    }
}

let user1 = User(firstName: "John", middleName: "Doe", lastName: "Smith")
let user2 = User(firstName: "Jane", middleName: nil, lastName: "Doe")

user1.printFullName() // Output: John Doe Smith
user2.printFullName() // Output: Jane Doe

// MARK: Optional chaining untuk mengakses diskon produk:

struct Product {
    var name: String
    var discount: Double?

    func printDiscount() {
        if let discount = discount {
            print("Discount: \(discount)%")
        } else {
            print("No discount available")
        }
    }
}

let product1 = Product(name: "iPhone", discount: 10.0)
let product2 = Product(name: "iPad", discount: nil)

product1.printDiscount() // Output: Discount: 10.0%
product2.printDiscount() // Output: No discount available

// MARK: Optional chaining untuk mengakses nilai suhu cuaca saat ini:


struct Weather {
    var temperature: Double?

    func printCurrentTemperature() {
        if let temperature = temperature {
            print("Current temperature: \(temperature)°C")
        } else {
            print("Temperature data not available")
        }
    }
}

let weather1 = Weather(temperature: 25.0)
let weather2 = Weather(temperature: nil)

weather1.printCurrentTemperature() // Output: Current temperature: 25.0°C
weather2.printCurrentTemperature() // Output: Temperature data not available

// MARK: Optional chaining untuk mengakses daftar tugas dari subproyek:

struct Task {
    var name: String
}

class Subproject {
    var tasks: [Task]?

    func printTasks() {
        if let tasks = tasks {
            print("Tasks:")
            for task in tasks {
                print("- \(task.name)")
            }
        } else {
            print("No tasks available")
        }
    }
}

let subproject1 = Subproject()
let subproject2 = Subproject()
subproject1.tasks = [Task(name: "Task 1"), Task(name: "Task 2")]
subproject2.tasks = nil

subproject1.printTasks() // Output: Tasks: - Task 1 - Task 2
subproject2.printTasks() // Output: No tasks available


// MARK: Optional chaining untuk mengakses diagnosa terakhir pasien:

struct MedicalRecord {
    var diagnoses: [String]?

    func printLastDiagnosis() {
        if let lastDiagnosis = diagnoses?.last {
            print("Last diagnosis: \(lastDiagnosis)")
        } else {
            print("No diagnosis available")
        }
    }
}

let patient1 = MedicalRecord(diagnoses: ["Cold", "Fever", "Flu"])
let patient2 = MedicalRecord(diagnoses: nil)

patient1.printLastDiagnosis() // Output: Last diagnosis: Flu
patient2.printLastDiagnosis() // Output: No diagnosis available


// MARK: Optional chaining untuk mengakses deskripsi objek:

struct GameObject {
    var description: String?

    func printDescription() {
        if let description = description {
            print("Description: \(description)")
        } else {
            print("No description available")
        }
    }
}

let object1 = GameObject(description: "A mysterious chest")
let object2 = GameObject(description: nil)

object1.printDescription() // Output: Description: A mysterious chest
object2.printDescription() // Output: No description available
//: [Next](@next)
