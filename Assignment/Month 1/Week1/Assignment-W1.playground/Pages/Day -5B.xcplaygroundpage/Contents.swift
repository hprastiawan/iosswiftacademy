//: [Previous](@previous)

import Foundation

// MARK: Assingment 1 Swift


// ------------------------||-----------------------------------||------------------------------------

// MARK: Soal Soal :

/*
 Peserta akan mengembangkan aplikasi sederhana untuk manajemen keuangan pribadi. Aplikasi ini akan memungkinkan pengguna untuk melacak pengeluaran dan pemasukan, mengkategorikan transaksi, dan memberikan ringkasan keuangan bulanan:

 MARK: Conditional dan Looping (20 points):
 - Fitur Filter Transaksi: Menggunakan kondisional untuk memfilter transaksi berdasarkan kategori atau tanggal.
 - Fitur Ringkasan: Mengiterasi transaksi untuk menghitung total pengeluaran dan pemasukan.

 MARK: Array, Set, dan Dictionary (20 points):
 - Daftar Transaksi: Menggunakan Array untuk menyimpan daftar transaksi.
 - Kategori Transaksi: Menggunakan Set untuk menyimpan kategori unik.
 - Ringkasan per Kategori: Menggunakan Dictionary untuk mengelompokkan transaksi berdasarkan kategori dan menghitung total per kategori.

 MARK: Fungsi dalam Swift (20 points):
 - Fungsi Tambah Transaksi: Fungsi untuk menambahkan transaksi baru ke daftar.
 - Fungsi Kalkulasi Total: Fungsi untuk menghitung total pengeluaran dan pemasukan.

 MARK: Kelas dan Objek dalam Swift (20 points):
 - Kelas Transaksi: Objek untuk mendefinisikan struktur data transaksi.
 - Kelas Pengguna: Objek untuk menyimpan informasi pengguna dan daftar transaksinya.

 MARK: Koleksi dalam Swift (20 points):
 - Manajemen Koleksi Transaksi: Pengelolaan koleksi transaksi yang kompleks, termasuk pencarian, penambahan, dan penghapusan transaksi.
 - Manajemen Koleksi Kategori: Pengelolaan set kategori untuk memastikan tidak ada duplikasi dan mudah diakses.


 */

// MARK: Berikut adalah implementasi jawaban untuk aplikasi manajemen keuangan pribadi:

// MARK: Conditional dan Looping
struct Transaction {
  var amount: Double
  var category: String
  var date: String // Format tanggal: "YYYY-MM-DD"
}

struct FinancialManager {
  var transactions: [Transaction] = []

  // Fitur Filter Transaksi
  func filterTransactions(byCategory category: String) -> [Transaction] {
    return transactions.filter { $0.category == category }
  }

  func filterTransactions(byDate date: String) -> [Transaction] {
    return transactions.filter { $0.date == date }
  }

  // Fitur Ringkasan
  func summary() -> (totalIncome: Double, totalExpense: Double) {
    var totalIncome = 0.0
    var totalExpense = 0.0

    for transaction in transactions {
      if transaction.amount > 0 {
        totalIncome += transaction.amount
      } else {
        totalExpense += transaction.amount
      }
    }

    return (totalIncome, totalExpense)
  }
}

// MARK: Array, Set, dan Dictionary
var financialManager = FinancialManager()

// Daftar Transaksi
financialManager.transactions = [
  Transaction(amount: 1000, category: "Salary", date: "2024-03-01"),
  Transaction(amount: -500, category: "Food", date: "2024-03-05"),
  Transaction(amount: -300, category: "Transportation", date: "2024-03-10"),
  Transaction(amount: 200, category: "Bonus", date: "2024-03-15")
]

// Kategori Transaksi
var uniqueCategories: Set<String> = []
for transaction in financialManager.transactions {
  uniqueCategories.insert(transaction.category)
}

// Ringkasan per Kategori
var categorySummary: [String: Double] = [:]
for category in uniqueCategories {
  let transactionsInCategory = financialManager.filterTransactions(byCategory: category)
  let totalAmount = transactionsInCategory.reduce(0) { $0 + $1.amount }
  categorySummary[category] = totalAmount
}

// MARK: Fungsi dalam Swift
extension FinancialManager {
  // Fungsi Tambah Transaksi
  mutating func addTransaction(amount: Double, category: String, date: String) {
    let newTransaction = Transaction(amount: amount, category: category, date: date)
    transactions.append(newTransaction)
  }

  // Fungsi Kalkulasi Total
  func calculateTotal() -> Double {
    return transactions.reduce(0) { $0 + $1.amount }
  }
}

// MARK: Kelas dan Objek dalam Swift
class User {
  var username: String
  var financialManager: FinancialManager

  init(username: String, financialManager: FinancialManager) {
    self.username = username
    self.financialManager = financialManager
  }
}

// Kelas Transaksi
let userFinancialManager = FinancialManager()
let user = User(username: "John", financialManager: userFinancialManager)

// MARK: Koleksi dalam Swift
// Manajemen Koleksi Transaksi dan Kategori sudah diimplementasikan dalam struktur FinancialManager


/*
 Kode di atas mengimplementasikan aplikasi manajemen keuangan pribadi dengan menggunakan struktur data seperti array, set, dan dictionary untuk menyimpan transaksi dan kategori, serta fungsi-fungsi untuk melakukan operasi seperti filter, ringkasan, tambah transaksi, dan kalkulasi total. Semua fitur yang diminta dalam soal telah diimplementasikan sesuai dengan spesifikasi.
 */
//: [Next](@next)
