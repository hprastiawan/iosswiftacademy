//: [Previous](@previous)

import Foundation

// MARK: Nested Type Swift ☀️😃🥳

// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 5  :

/*
MARK: Soal Soal
 1. Buatlah sebuah struct bernama Team yang memiliki nested type Player yang memiliki properti name dan age. Buatlah instance dari Team dan tambahkan beberapa Player. Kemudian, akses informasi tentang salah satu pemain dari luar Team.


 2. Dalam tipe koleksi sederhana yang disebut Playlist, buatlah nested type Song yang memiliki properti title dan duration. Buatlah instance dari Playlist dan tambahkan beberapa Song. Kemudian, tampilkan informasi tentang salah satu lagu di luar Playlist.


 3. Buat sebuah enum untuk merepresentasikan jenis barang yang ada di suatu toko. Dalam enum tersebut, buatlah nested type Detail yang memiliki properti description dan price. Buat instance dari jenis barang tertentu dan akses informasi tentang detail barang tersebut dari luar enum.

 */


// MARK: JAWABAN

// Struct Team with nested type Player
struct Team {
    struct Player {
        var name: String
        var age: Int
    }

    var players: [Player] = []

    mutating func addPlayer(_ name: String, _ age: Int) {
        players.append(Player(name: name, age: age))
    }
}

// Create an instance of Team and add players
var myTeam = Team()
myTeam.addPlayer("John", 25)
myTeam.addPlayer("Emma", 28)

// Access information about a player from outside the Team
if let firstPlayer = myTeam.players.first {
    print("Player name: \(firstPlayer.name), Age: \(firstPlayer.age)")
}

// Nested type Song within Playlist
struct Playlist {
    struct Song {
        var title: String
        var duration: Int
    }

    var songs: [Song] = []

    mutating func addSong(_ title: String, _ duration: Int) {
        songs.append(Song(title: title, duration: duration))
    }
}

// Create an instance of Playlist and add songs
var myPlaylist = Playlist()
myPlaylist.addSong("Song 1", 180)
myPlaylist.addSong("Song 2", 240)

// Display information about a song from outside the Playlist
if let firstSong = myPlaylist.songs.first {
    print("Song title: \(firstSong.title), Duration: \(firstSong.duration) seconds")
}

// Enum representing types of items in a store
enum StoreItem {
    case book(Detail)
    case clothing(Detail)
    case electronic(Detail)

    struct Detail {
        var description: String
        var price: Double
    }
}

// Create an instance of StoreItem and access information about its detail
let book = StoreItem.book(StoreItem.Detail(description: "Book about Swift programming", price: 29.99))

if case let .book(detail) = book {
    print("Description: \(detail.description), Price: $\(detail.price)")
}


/*
 MARK: Ini adalah implementasi dari permintaan Anda:

 Struct Team memiliki nested type Player, di mana Anda dapat membuat instance dari Team dan menambahkan pemain ke dalamnya. Kemudian, Anda dapat mengakses informasi tentang pemain dari luar Team.

 Struct Playlist memiliki nested type Song, di mana Anda dapat membuat instance dari Playlist dan menambahkan lagu ke dalamnya. Kemudian, Anda dapat menampilkan informasi tentang lagu dari luar Playlist.

 Enum StoreItem mewakili jenis barang yang ada di toko, dan setiap kasus memiliki nested type Detail yang berisi deskripsi dan harga barang. Anda dapat membuat instance dari jenis barang tertentu dan mengakses informasi tentang detail barang dari luar enum.
 */


// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 10  :

/*
MARK: Soal Soal
 1. Definisikan sebuah class yang disebut School dengan nested type Student. Student harus memiliki properti name dan grade. Buat instance dari School dan tambahkan beberapa Student. Selanjutnya, akses informasi tentang satu siswa tertentu dari luar School.


 2. Dalam tipe geometri Triangle, buatlah nested type Vertex yang merepresentasikan sudut-sudut dari segitiga. Setiap sudut memiliki properti x dan y. Buat instance dari Triangle dan tampilkan informasi tentang salah satu sudut dari luar Triangle.


 3. Buat sebuah struct bernama Car dengan nested type Engine. Engine harus memiliki properti horsepower dan fuelType. Buat instance dari Car dan akses informasi tentang mesinnya dari luar Car.

 */


// MARK: JAWABAN 1

/*
 Kelas School memiliki nested type Student, di mana Anda dapat membuat instance dari School dan menambahkan siswa ke dalamnya. Kemudian, Anda dapat mengakses informasi tentang satu siswa tertentu dari luar School.
 */

// Defining a class School with nested type Student
class School {
    class Student {
        var name: String
        var grade: Int

        init(name: String, grade: Int) {
            self.name = name
            self.grade = grade
        }
    }

    var students: [Student] = []

    func addStudent(_ name: String, _ grade: Int) {
        students.append(Student(name: name, grade: grade))
    }
}

// Creating an instance of School and adding students
let mySchool = School()
mySchool.addStudent("John", 8)
mySchool.addStudent("Emma", 9)

// Accessing information about a specific student from outside the School
if let firstStudent = mySchool.students.first {
    print("Student name: \(firstStudent.name), Grade: \(firstStudent.grade)")
}

// MARK: JAWABAN 2
/*
 Struct Triangle memiliki nested type Vertex yang mewakili sudut-sudut dari segitiga. Anda dapat membuat instance dari Triangle dan menambahkan sudut-sudut ke dalamnya. Kemudian, Anda dapat menampilkan informasi tentang salah satu sudut dari luar Triangle.
 */

// Nested type Vertex within Triangle representing vertices of the triangle
struct Triangle {
    struct Vertex {
        var x: Double
        var y: Double
    }

    var vertices: [Vertex] = []

    mutating func addVertex(_ x: Double, _ y: Double) {
        vertices.append(Vertex(x: x, y: y))
    }
}

// Creating an instance of Triangle and adding vertices
var myTriangle = Triangle()
myTriangle.addVertex(0, 0)
myTriangle.addVertex(1, 0)
myTriangle.addVertex(0, 1)

// Displaying information about a specific vertex from outside the Triangle
if let firstVertex = myTriangle.vertices.first {
    print("Vertex coordinates: (\(firstVertex.x), \(firstVertex.y))")
}

// MARK: JAWABAN 3
/*
 Struct Car memiliki nested type Engine, yang mewakili mesin mobil. Anda dapat membuat instance dari Car dan mengakses informasi tentang mesinnya dari luar Car.
 */

// Struct Car with nested type Engine
struct Car {
    struct Engine {
        var horsepower: Int
        var fuelType: String
    }

    var engine: Engine

    init(horsepower: Int, fuelType: String) {
        self.engine = Engine(horsepower: horsepower, fuelType: fuelType)
    }
}

// Creating an instance of Car and accessing information about its engine from outside
let myCar = Car(horsepower: 200, fuelType: "Petrol")
print("Engine horsepower: \(myCar.engine.horsepower), Fuel type: \(myCar.engine.fuelType)")




// 🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆||🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆🔆
// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK: Soal Soal Poin 15  :

/*
MARK: Soal Soal
 1. Dalam sistem manajemen proyek, buatlah tipe Project dengan nested type Task. Task harus memiliki properti name dan status. Buat instance dari Project dan tambahkan beberapa Task. Kemudian, akses informasi tentang satu tugas tertentu dari luar Project.

 2. Buat tipe Company yang memiliki nested type Employee. Employee harus memiliki properti name dan position. Buat instance dari Company dan tambahkan beberapa Employee. Selanjutnya, akses informasi tentang satu karyawan tertentu dari luar Company.

 3. Dalam konteks game, buat sebuah struct Game dengan nested type Player. Player harus memiliki properti username dan score. Buat instance dari Game dan tambahkan beberapa Player. Tampilkan informasi tentang satu pemain tertentu dari luar Game.

 */


// MARK: JAWABAN 1

// Defining a type Project with nested type Task
struct Project {
    struct Task {
        var name: String
        var status: String
    }

    var tasks: [Task] = []

    mutating func addTask(_ name: String, _ status: String) {
        tasks.append(Task(name: name, status: status))
    }
}

// Creating an instance of Project and adding tasks
var myProject = Project()
myProject.addTask("Task 1", "Incomplete")
myProject.addTask("Task 2", "Complete")

// Accessing information about a specific task from outside the Project
if let firstTask = myProject.tasks.first {
    print("Task name: \(firstTask.name), Status: \(firstTask.status)")
}

// MARK: JAWABAN 2

// Nested type Employee within Company representing employees
struct Company {
    struct Employee {
        var name: String
        var position: String
    }

    var employees: [Employee] = []

    mutating func addEmployee(_ name: String, _ position: String) {
        employees.append(Employee(name: name, position: position))
    }
}

// Creating an instance of Company and adding employees
var myCompany = Company()
myCompany.addEmployee("John Doe", "Manager")
myCompany.addEmployee("Emma Smith", "Developer")

// Accessing information about a specific employee from outside the Company
if let firstEmployee = myCompany.employees.first {
    print("Employee name: \(firstEmployee.name), Position: \(firstEmployee.position)")
}

// MARK: JAWABAN 3

// Struct Game with nested type Player representing players
struct Game {
    struct Player {
        var username: String
        var score: Int
    }

    var players: [Player] = []

    mutating func addPlayer(_ username: String, _ score: Int) {
        players.append(Player(username: username, score: score))
    }
}

// Creating an instance of Game and adding players
var myGame = Game()
myGame.addPlayer("Player1", 100)
myGame.addPlayer("Player2", 150)

// Displaying information about a specific player from outside the Game
if let firstPlayer = myGame.players.first {
    print("Player username: \(firstPlayer.username), Score: \(firstPlayer.score)")
}


//: [Next](@next)
