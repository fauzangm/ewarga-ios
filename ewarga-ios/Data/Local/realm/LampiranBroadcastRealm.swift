//
//  LampiranBroadcastDb.swift
//  ewarga-ios
//
//  Created by Fauzan Ghozi Mubarak on 22/02/24.
//

import Foundation
import RealmSwift

class LampiranBroadcastRealm : ObservableObject {
    private var realm = try! Realm()
    @Published var lampiranBroadcast : Results<LampiranBroadcastVo>
    private var notificationToken: NotificationToken?
    
    init(){
        lampiranBroadcast = realm.objects(LampiranBroadcastVo.self)
        observeChanges()
    }
    
    private func observeChanges() {
           notificationToken = lampiranBroadcast.observe { [weak self] _ in
               // Memperbarui tampilan saat terjadi perubahan pada data
               self?.objectWillChange.send()
           }
       }
    
    func addAttachment(url: String,lampiranName: String) {
        try! realm.write {
            let newAttachment = LampiranBroadcastVo()
            newAttachment.lampiranItem = url
            newAttachment.lampiranName = lampiranName
            realm.add(newAttachment)
        }
    }

    // Read
    func getAttachments() -> Results<LampiranBroadcastVo> {
        return realm.objects(LampiranBroadcastVo.self)
    }

    // Update
    func updateAttachment(attachment: LampiranBroadcastVo, newURL: String) {
        try! realm.write {
            attachment.lampiranItem = newURL
        }
    }

    // Delete
      func deleteAttachment(at indexSet: IndexSet) {
          // Ambil attachment yang akan dihapus berdasarkan index set
          let attachmentsToDelete = indexSet.lazy.map { self.lampiranBroadcast[$0] }
          try! realm.write {
              // Hapus semua attachment yang telah dipilih
              realm.delete(attachmentsToDelete)
          }
      }
    
    
    deinit {
        notificationToken?.invalidate() // Pastikan untuk membatalkan token notifikasi saat view model di-deinisialisasi
    }
}
