//
//  ExampleAudioPlayerViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 29/02/24.
//

import UIKit
import SkeletonView


let dataMusic = [
  ListDataMusic(image: "", titleSong: "", descrption: "", duration: 120),
  ListDataMusic(image: "", titleSong: "", descrption: "", duration: 120),
  ListDataMusic(image: "", titleSong: "", descrption: "", duration: 120),
]

class ExampleAudioPlayerViewController: UIViewController {



  @IBOutlet var tableView: UITableView!
  @IBOutlet weak var audioImage: UIImageView!
  @IBOutlet weak var playAudioButton: UIButton!

  override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

  func setup() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "ItemPlayListMusicCell", bundle: nil), forCellReuseIdentifier: "ItemPlayListMusicCell")


  }

}

extension ExampleAudioPlayerViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataMusic.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemPlayListMusicCell", for: indexPath) as! ItemPlayListMusicCell
    cell.configureItem(item: dataMusic[indexPath.row])
    return cell
  }


}


//import UIKit
//import AVFoundation
//
//class ViewController: UIViewController {
//
//    var audioPlayer: AVAudioPlayer?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Panggil method untuk memulai pemutaran musik
//        playMusic()
//    }
//
//    func playMusic() {
//        // Mengambil URL file musik dari bundle aplikasi
//        guard let musicURL = Bundle.main.url(forResource: "music_file", withExtension: "mp3") else {
//            print("File musik tidak ditemukan")
//            return
//        }
//
//        do {
//            // Inisialisasi AVAudioPlayer dengan URL file musik
//            audioPlayer = try AVAudioPlayer(contentsOf: musicURL)
//            // Mulai pemutaran musik
//            audioPlayer?.play()
//        } catch {
//            // Penanganan kesalahan jika gagal memutar musik
//            print("Gagal memutar musik:", error.localizedDescription)
//        }
//    }
//
//    // Method untuk menghentikan pemutaran musik
//    func stopMusic() {
//        audioPlayer?.stop()
//    }
//}
//
//import UIKit
//import AVFoundation
//import AVKit
//
//class ViewController: UIViewController {
//
//    var player: AVPlayer!
//    var playerLayer: AVPlayerLayer!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Panggil method untuk memulai pemutaran video
//        playVideo()
//    }
//
//    func playVideo() {
//        // Mengambil URL file video dari bundle aplikasi
//        guard let videoURL = Bundle.main.url(forResource: "video_file", withExtension: "mp4") else {
//            print("File video tidak ditemukan")
//            return
//        }
//
//        // Inisialisasi AVPlayer dengan URL file video
//        player = AVPlayer(url: videoURL)
//
//        // Inisialisasi AVPlayerLayer untuk menampilkan video di layer
//        playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = view.bounds
//        view.layer.addSublayer(playerLayer)
//
//        // Mulai pemutaran video
//        player.play()
//    }
//
//    // Method untuk menghentikan pemutaran video
//    func stopVideo() {
//        player.pause()
//    }
//}

//
//import UIKit
//import AVFoundation
//
//class ViewController: UIViewController, AVAudioRecorderDelegate {
//
//    var audioRecorder: AVAudioRecorder!
//    var recordingSession: AVAudioSession!
//    var audioURL: URL!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Panggil method untuk memulai proses rekaman suara
//        startRecording()
//    }
//
//    func startRecording() {
//        // Memulai sesi audio
//        recordingSession = AVAudioSession.sharedInstance()
//
//        do {
//            try recordingSession.setCategory(.playAndRecord, mode: .default)
//            try recordingSession.setActive(true)
//
//            // Mengatur URL tempat penyimpanan rekaman suara
//            let audioFilename = getDocumentsDirectory().appendingPathComponent("recorded_audio.m4a")
//            audioURL = audioFilename
//
//            // Mengatur opsi rekaman
//            let settings = [
//                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
//                AVSampleRateKey: 44100,
//                AVNumberOfChannelsKey: 2,
//                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
//            ]
//
//            // Inisialisasi AVAudioRecorder dengan URL dan opsi rekaman
//            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
//            audioRecorder.delegate = self
//            audioRecorder.record()
//        } catch {
//            print("Gagal memulai rekaman:", error.localizedDescription)
//        }
//    }
//
//    // Method untuk mendapatkan direktori dokumen aplikasi
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//
//    // AVAudioRecorderDelegate method untuk menangani selesainya rekaman
//    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
//        if flag {
//            print("Rekaman suara selesai")
//        } else {
//            print("Rekaman suara gagal")
//        }
//    }
//
//    // Method untuk menghentikan rekaman suara
//    func stopRecording() {
//        audioRecorder.stop()
//        do {
//            try recordingSession.setActive(false)
//        } catch {
//            print("Gagal menghentikan rekaman:", error.localizedDescription)
//        }
//    }
//}
//
//
//// Untuk membuat custom layout pada Floating Panel
//func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection)
//  -> FloatingPanelLayout {
//  return CustomFloatingPanelLayout()
//}
//
//// Untuk animasi saat membuka floating panel
//func floatingPanel(_ fpc: FloatingPanelController, animatorForPresentingTo state: FloatingPanelState) -> UIViewPropertyAnimator {
//  return UIViewPropertyAnimator(duration: TimeInterval(0.16), curve: .easeOut)
//}
//// Untuk animasi saat menuntup floating panel
//func floatingPanel(_ fpc: FloatingPanelController, animatorForDismissingWith velocity: CGVector) -> UIViewPropertyAnimator {
//  return UIViewPropertyAnimator(duration: TimeInterval(0.16), curve: .easeOut)
//}
//
//class CustomFloatingPanelLayout: FloatingPanelLayout {
//
//  let position: FloatingPanelPosition = .bottom
//  let initialState: FloatingPanelState = .half
//
//  let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
//    .half: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea)
//  ]
//
//  func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
//    if state == .half {
//      return 0.64
//    } else {
//      return 0
//    }
//  }
//}
//
//func showFloatingPanel() {
//  let panelVC = PanelViewController()
//    // Pastikan ada closure jika ingin menutup floating panel dari dalam panelVC
//    panelVC.onTapCloseButton = {
//      self.dismiss(animated: true)
//      // Jika ingin berpindah halaman
//      DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) {
//        self.navigationController?.pushViewController(SignInViewController(), animated: true)
//      }
//  }
//  floatingPanelController.set(contentViewController: panelVC)
//  present(floatingPanelController, animated: true, completion: nil)
//}
