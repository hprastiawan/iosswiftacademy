//: [Previous](@previous)
/*
 Keamanan Tipe Data (Type Safety)
 Kesulitan 5:
 1. Apa yang dimaksud dengan Null Safety?
 2. Mengapa keamanan tipe data (Type Safety) penting dalam pengembangan perangkat lunak?
 3. Bagaimana Swift mengatasi masalah Null Pointer Exception?

 */

/*
 Jawaban:

 1. Null Safety adalah konsep dalam pemrograman yang bertujuan untuk mencegah kesalahan yang disebabkan oleh penggunaan nilai null atau tidak terdefinisi.
 2. Keamanan tipe data penting karena dapat mencegah kesalahan yang disebabkan oleh tipe data yang salah atau nilai yang tidak valid, sehingga meningkatkan keandalan dan keamanan perangkat lunak.
 3 .Swift mengatasi masalah Null Pointer Exception dengan menerapkan konsep Optional, di mana nilai yang dapat bernilai null didefinisikan secara eksplisit menggunakan tipe data Optional.
 */



// Berikut adalah 5 soal tentang implementasi kode sintaks dasar Swift:

/*
 1.Diberikan sebuah array yang berisi nama-nama buah, tuliskan sebuah program dalam Swift untuk menampilkan semua nama buah yang memiliki lebih dari lima huruf.
 */

// Jawaban
let fruits = ["apel", "jeruk", "pisang", "semangka", "nanas"]

for fruit in fruits {
    if fruit.count > 5 {
        print(fruit)
    }
}

/*
 2. Buatlah sebuah fungsi dalam Swift yang menerima dua parameter bertipe integer dan mengembalikan hasil penjumlahan kedua parameter tersebut.
 */

// Jawaban
func tambah(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let hasil = tambah(5, 3)
print("Hasil penjumlahan: \(hasil)")

/*
3.Tuliskan sebuah program dalam Swift yang meminta pengguna untuk memasukkan dua angka, lalu mencetak hasil perkalian kedua angka tersebut.
*/

//Jawaban
print("Masukkan dua angka:")
if let angka1 = Int(readLine() ?? ""), let angka2 = Int(readLine() ?? "") {
    let hasil = angka1 * angka2
    print("Hasil perkalian: \(hasil)")
} else {
    print("Input tidak valid.")
}

/*
 4. Diberikan sebuah array berisi angka-angka, tuliskan sebuah program dalam Swift untuk menghitung jumlah semua angka genap dalam array tersebut.
 */

//Jawaban
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var totalGenap = 0

for number in numbers {
    if number % 2 == 0 {
        totalGenap += number
    }
}

print("Jumlah semua angka genap: \(totalGenap)")


/*
 5. Buatlah sebuah program dalam Swift yang mencetak deret bilangan Fibonacci hingga n kali, dengan n merupakan bilangan bulat yang dimasukkan oleh pengguna.
 */

//Jawaban
func fibonacci(_ n: Int) -> [Int] {
    var sequence = [0, 1]

    if n <= 1 {
        return sequence.prefix(n)
    }

    for _ in 2..<n {
        let nextNumber = sequence.last! + sequence[sequence.count - 2]
        sequence.append(nextNumber)
    }

    return sequence
}

print("Masukkan jumlah deret Fibonacci yang ingin ditampilkan:")
if let n = Int(readLine() ?? "") {
    let fibonacciSequence = fibonacci(n)
    print("Deret Fibonacci: \(fibonacciSequence)")
} else {
    print("Input tidak valid.")
}






//: [Next](@next)
