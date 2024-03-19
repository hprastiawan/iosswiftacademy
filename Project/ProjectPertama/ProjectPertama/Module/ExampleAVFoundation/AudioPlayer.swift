//
//  AudioPlayer.swift
//  ProjectPertama
//
//  Created by Macbook on 29/02/24.
//

import Foundation
import AVFoundation

class AudioPlayer {
    var player: AVAudioPlayer?

    func playSound(soundFileName: String, fileType: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: fileType) else {
            print("File audio tidak ditemukan")
            return
        }

        do {
            // Inisialisasi AVAudioPlayer dengan URL file audio
            player = try AVAudioPlayer(contentsOf: soundURL)
            // Mengatur AVAudioPlayer untuk memainkan suara secara berulang
            player?.numberOfLoops = -1 // -1 artinya berulang tak terbatas
            // Memulai pemutaran suara
            player?.play()
        } catch {
            // Penanganan kesalahan jika gagal memutar audio
            print("Gagal memainkan audio:", error.localizedDescription)
        }
    }

    func stopSound() {
        // Menghentikan pemutaran suara
        player?.stop()
    }
}

// Contoh penggunaan:
//let audioPlayer = AudioPlayer()
//audioPlayer.playSound(soundFileName: "background_music", fileType: "mp3")

// Untuk menghentikan pemutaran audio
// audioPlayer.stopSound()
