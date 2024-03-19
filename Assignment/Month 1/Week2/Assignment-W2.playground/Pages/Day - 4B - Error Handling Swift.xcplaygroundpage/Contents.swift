//: [Previous](@previous)

import Foundation

// MARK: Error Handling Swift ☀️

//------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 5: 🏖️🏖️

/*
MARK: Soal 1
 Jelaskan penggunaan do, try, dan catch dalam penanganan kesalahan di Swift.

 Berikan contoh sederhana penggunaan do, try, dan catch untuk menangani kesalahan.

 */

// MARK:  Jawaban Soal Poin 5:
/*
 Penggunaan do, try, dan catch adalah bagian dari mekanisme penanganan kesalahan di Swift. Mereka digunakan untuk menangani situasi di mana kode dapat menghasilkan kesalahan, seperti ketika melakukan operasi yang melibatkan pelemparan error.

 Berikut adalah penjelasan singkat tentang masing-masing bagian:

MARK: do:
 Blok do digunakan untuk mengelompokkan satu atau beberapa baris kode yang mungkin menyebabkan kesalahan. Ini memungkinkan kita untuk menangani kesalahan yang mungkin terjadi di dalam blok tersebut.
MARK: try:
 Kata kunci try digunakan sebelum pemanggilan fungsi atau metode yang mungkin melemparkan kesalahan. Ini menunjukkan bahwa kita menyadari kemungkinan kesalahan dan siap menangani mereka.
MARK: catch:
 Blok catch digunakan untuk menangkap dan menangani kesalahan yang dihasilkan oleh operasi yang dilakukan di dalam blok do. Kode yang ada di dalam blok catch akan dieksekusi jika ada kesalahan.
 Berikut adalah contoh sederhana penggunaan do, try, dan catch dalam Swift:
 */

enum CustomError: Error {
    case notFound
    case internalError
}

func fetchData() throws -> String {
    let random = Int.random(in: 0..<2)

    if random == 0 {
        throw CustomError.notFound
    }

    return "Data berhasil diambil"
}

do {
    let result = try fetchData()
    print(result)
} catch CustomError.notFound {
    print("Data tidak ditemukan")
} catch {
    print("Terjadi kesalahan lain: \(error)")
}
/*
 Dalam contoh di atas, kita memiliki sebuah fungsi fetchData() yang dapat melemparkan error.
 Kita menggunakan try sebelum pemanggilan fungsi tersebut karena kita menyadari bahwa fungsi tersebut dapat melemparkan error. Dalam blok do, kita melakukan pemanggilan fungsi tersebut dan menangkap kesalahan yang mungkin terjadi dengan menggunakan blok catch.
 Jika error yang dilemparkan adalah CustomError.notFound, pesan "Data tidak ditemukan" akan dicetak. Jika error lain terjadi, pesan kesalahan akan dicetak.
 */

//------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 10: 🏖️🏖️

/*
MARK: Soal 1
 Apa perbedaan antara throws dan rethrows dalam deklarasi fungsi?

 Berikan contoh penggunaan throws dan rethrows beserta penjelasan singkat untuk masing-masing.

 */

// MARK:  Jawaban Soal Poin 10:
/*
 Perbedaan antara throws dan rethrows terletak pada bagaimana fungsi-fungsi tersebut mengelola kesalahan.

 MARK: throws:
 throws digunakan dalam deklarasi fungsi untuk menunjukkan bahwa fungsi tersebut dapat melemparkan kesalahan.
 Ini berarti fungsi tersebut dapat mengeksekusi operasi yang mungkin menyebabkan kesalahan, dan kita harus menangani kesalahan tersebut dengan menggunakan try, try?, atau try! saat memanggil fungsi tersebut.
 Fungsi yang dideklarasikan menggunakan throws dapat melemparkan kesalahan sendiri atau meneruskannya ke fungsi lain yang dapat menangani kesalahan.
 Contoh penggunaan throws:
 */

enum CustomError1: Error {
    case internalError
}

func divide(_ a: Int, by b: Int) throws -> Int {
    guard b != 0 else {
        throw CustomError1.internalError
    }

    return a / b
}

do {
    let result = try divide(10, by: 2)
    print("Hasil pembagian adalah \(result)")
} catch {
    print("Terjadi kesalahan: \(error)")
}

/*
 MARK: rethrows:
 rethrows digunakan dalam deklarasi fungsi untuk menunjukkan bahwa fungsi tersebut hanya akan melemparkan kesalahan jika salah satu dari parameter fungsi tersebut juga melemparkan kesalahan.

 Dengan kata lain, fungsi yang dideklarasikan menggunakan rethrows tidak melemparkan kesalahan sendiri, tetapi hanya melemparkan kembali kesalahan yang diterima dari parameter lain yang merupakan fungsi yang dapat melemparkan kesalahan.

 Contoh penggunaan rethrows:
 */

func performOperation(_ operation: () throws -> Int) rethrows -> Int {
    let result = try operation()
    return result
}

func divide1(_ a: Int, by b: Int) throws -> Int {
    guard b != 0 else {
        throw CustomError1.internalError
    }

    return a / b
}

do {
    let result = try performOperation {
        return try divide1(10, by: 2)
    }
    print("Hasil operasi adalah \(result)")
} catch {
    print("Terjadi kesalahan: \(error)")
}



//------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 15: 🏖️🏖️

/*
MARK: Soal 1
 Jelaskan penggunaan defer dalam penanganan kesalahan di Swift.

 Buatlah contoh kode yang menggunakan defer untuk membersihkan sumber daya (resource) dalam kasus keberhasilan atau kegagalan suatu operasi.
 */

// MARK:  Jawaban Soal Poin 15:

/*
 defer digunakan dalam penanganan kesalahan di Swift untuk menunda eksekusi suatu kode sampai blok saat ini keluar dari lingkupnya. 

 Hal ini berguna untuk membersihkan sumber daya atau menjalankan tindakan tertentu yang perlu dilakukan baik saat operasi berhasil maupun gagal, tanpa memperhatikan apakah ada kesalahan yang terjadi atau tidak.

 Berikut adalah contoh penggunaan defer untuk membersihkan sumber daya dalam kasus keberhasilan atau kegagalan suatu operasi:
 */

func processFile(atPath path: String) throws {
    // Buka file
    let file = openFile(atPath: path)
    defer {
        // Tutup file saat keluar dari blok saat ini
        closeFile(file)
    }

    // Lakukan operasi lain pada file
    try performOperationOnFile(file)

    // Jika operasi berhasil, simpan perubahan
    saveChangesToFile(file)
}

// Fungsi untuk membuka file
func openFile(atPath path: String) -> File {
    // Implementasi untuk membuka file
    print("Membuka file di \(path)")
    return File()
}

// Fungsi untuk melakukan operasi pada file
func performOperationOnFile(_ file: File) throws {
    // Implementasi untuk operasi pada file
    print("Melakukan operasi pada file")
    throw FileError.operationFailed
}

// Fungsi untuk menyimpan perubahan ke file
func saveChangesToFile(_ file: File) {
    // Implementasi untuk menyimpan perubahan
    print("Menyimpan perubahan ke file")
}

// Fungsi untuk menutup file
func closeFile(_ file: File) {
    // Implementasi untuk menutup file
    print("Menutup file")
}

// Enum untuk menangani kesalahan file
enum FileError: Error {
    case operationFailed
}

// Kelas untuk merepresentasikan file
class File {
    // Implementasi kelas File
}

/*
 Dalam contoh di atas, kita memiliki fungsi processFile(atPath:) yang menangani operasi pada suatu file. Kita membuka file di awal menggunakan fungsi openFile(atPath:), dan menutup file di akhir menggunakan blok defer.

 Operasi lain pada file dilakukan di antara kedua pemanggilan tersebut. Jika operasi pada file menghasilkan kesalahan, blok defer tetap akan dieksekusi untuk menutup file. Jika tidak ada kesalahan, blok defer juga akan dieksekusi untuk menutup file setelah operasi berhasil dilakukan.
 */
//: [Next](@next)
