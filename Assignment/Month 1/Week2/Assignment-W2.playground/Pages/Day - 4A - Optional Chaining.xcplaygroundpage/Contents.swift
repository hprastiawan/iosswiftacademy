//: [Previous](@previous)

import Foundation

// MARK: Optional Chaining Swift ☀️

// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 5: 🏖️🏖️

/*
MARK: Soal 1
 Jelaskan apa itu optional chaining dalam Swift.

 Berikan contoh sederhana penggunaan optional chaining pada properti suatu objek.

 */

// MARK:  Jawaban Soal Poin 5:

/*
 Optional chaining adalah cara untuk memeriksa dan memanggil properti, metode, atau subscript dari objek opsional tanpa harus memeriksa apakah objek tersebut nil terlebih dahulu. Jika objek opsional memiliki nilai, pemanggilan akan dilanjutkan ke properti atau metode yang diminta. Namun, jika objek opsional nil, pemanggilan akan dihentikan dan nilai nil akan dikembalikan secara otomatis.

 Contoh sederhana penggunaan optional chaining adalah saat kita memiliki objek yang merupakan opsional dan kita ingin mengakses properti dari objek tersebut:
 */

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

var person: Person? = Person(name: "John")

// Optional chaining untuk mengakses properti 'name'
let personName = person?.name

print("Nama orang: \(personName ?? "Unknown")")


// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 10: 🏖️🏖️

/*
MARK: Soal 1
 Gambarkan situasi di mana optional chaining dapat mencegah terjadinya kesalahan runtime.

 Implementasikan contoh kode yang menunjukkan penggunaan optional chaining dalam konteks tersebut.


 */

// MARK:  Jawaban Soal Poin 10:

/*
 Situasi di mana optional chaining dapat mencegah terjadinya kesalahan runtime adalah ketika kita ingin mengakses properti atau memanggil metode dari sebuah objek yang mungkin nil. Dengan menggunakan optional chaining, kita dapat memastikan bahwa akses atau pemanggilan tersebut aman dan tidak akan menyebabkan crash jika objek tersebut nil.

 Sebagai contoh, dalam sebuah aplikasi pemesanan makanan, kita mungkin memiliki objek pesanan yang berisi informasi tentang pesanan pengguna, termasuk objek pengiriman yang mewakili detail pengiriman pesanan tersebut. Namun, pengguna mungkin belum memasukkan detail pengiriman, sehingga objek pengiriman bisa saja nil.

 Berikut adalah implementasi contoh kode menggunakan optional chaining dalam konteks ini:
 */

// Definisi struktur Pengiriman
struct Pengiriman {
    var alamat: String
    var estimasiWaktu: Int
}

// Definisi kelas Pesanan
class Pesanan {
    var nomorPesanan: Int
    var pengiriman: Pengiriman?

    init(nomorPesanan: Int) {
        self.nomorPesanan = nomorPesanan
    }
}

// Membuat objek pesanan dengan pengiriman yang nil
let pesanan1 = Pesanan(nomorPesanan: 12345)

// Menggunakan optional chaining untuk mengakses properti alamat dari objek pengiriman
if let alamatPengiriman = pesanan1.pengiriman?.alamat {
    print("Alamat pengiriman: \(alamatPengiriman)")
} else {
    print("Pengiriman belum ditentukan")
}

// Memasukkan detail pengiriman
pesanan1.pengiriman = Pengiriman(alamat: "Jl. Raya No. 123", estimasiWaktu: 30)

// Menggunakan optional chaining lagi setelah detail pengiriman dimasukkan
if let alamatPengiriman = pesanan1.pengiriman?.alamat {
    print("Alamat pengiriman: \(alamatPengiriman)")
} else {
    print("Pengiriman belum ditentukan")
}

/*
 Dalam contoh di atas, saat kita mencoba mengakses properti alamat dari objek pengiriman menggunakan optional chaining (pesanan1.pengiriman?.alamat), kode akan tetap berjalan dengan aman meskipun objek pengiriman nil.

 Optional chaining mencegah terjadinya kesalahan runtime dan mengembalikan nil jika objek pengiriman nil.

 Setelah detail pengiriman dimasukkan, akses ke properti alamat menggunakan optional chaining akan berhasil karena objek pengiriman sudah memiliki nilai.
 */

// ------------------------||-----------------------------------||------------------------------------||---------------------

// MARK:  Soal Soal Poin 15: 🏖️🏖️

/*
MARK: Soal 1
 Jelaskan perbedaan antara penggunaan if let dan guard let dalam optional chaining.

 Berikan contoh kasus di mana menggunakan if let lebih tepat dan kasus di mana menggunakan guard let lebih menguntungkan.


 */

// MARK:  Jawaban Soal Poin 15:

/*
 Perbedaan utama antara penggunaan if let dan guard let dalam optional chaining adalah bagaimana mereka mengontrol alur eksekusi kode ketika nilai opsional nil. Berikut adalah penjelasan singkat tentang perbedaan antara keduanya:

 MARK: if let:
 Digunakan untuk mengekstrak nilai dari sebuah opsional dan menetapkan nilainya ke sebuah konstanta atau variabel lokal.
 Jika nilai opsional tidak nil, blok kode dalam if let akan dieksekusi.
 Cocok digunakan ketika kita ingin melakukan beberapa operasi dengan nilai opsional yang ditemukan.

 MARK: guard let:
 Digunakan untuk mengekstrak nilai dari sebuah opsional dan menetapkan nilainya ke sebuah konstanta atau variabel lokal.
 Jika nilai opsional nil, blok kode dalam guard let akan segera keluar dari scope saat ini dengan menggunakan pernyataan return, break, continue, atau throw.

 Cocok digunakan untuk melakukan validasi awal atau pra-kondisi yang harus dipenuhi sebelum melanjutkan eksekusi kode.
 Berikut adalah contoh kasus di mana menggunakan if let lebih tepat:
 */

func calculateTotalPrice(item: Item?) {
    if let price = item?.price {
        let total = price * 2 // Melakukan perhitungan dengan nilai opsional yang ditemukan
        print("Total price: \(total)")
    } else {
        print("Item tidak memiliki harga")
    }
}

// Contoh kasus di mana menggunakan guard let lebih menguntungkan:

func processOrder(item: Item?) {
    guard let itemName = item?.name else {
        print("Pesanan tidak valid: nama item tidak tersedia")
        return // Keluar dari fungsi jika nama item tidak tersedia
    }

    // Melakukan operasi lanjutan dengan nama item yang telah ditemukan
    print("Pesanan diproses untuk item: \(itemName)")
}

/*
 Dalam contoh di atas, guard let digunakan untuk memeriksa apakah nama item tersedia sebelum melanjutkan eksekusi fungsi. Jika nama item tidak tersedia, fungsi akan segera keluar dan mencetak pesan kesalahan.

 Hal ini memastikan bahwa operasi berikutnya hanya dilakukan jika pra-kondisi dipenuhi.
 */
//: [Next](@next)
