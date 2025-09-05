# rara-simpelApp

# Deskripsi
Aplikasi Flutter sederhana untuk menampilkan daftar tanaman dan detailnya.  
Fitur utama:
- **Home Screen**: menampilkan daftar tanaman menggunakan widget custom (`TaskCard`).  
- **Plant Detail Screen**: menampilkan detail tanaman yang dipilih.  
- **State Management**: menggunakan file `app_state.dart` untuk mengatur data aplikasi.  

Tujuan aplikasi ini adalah mempraktikkan **widget tree yang terstruktur**, **navigasi antar halaman**, dan **pengelolaan state sederhana** di Flutter.

# diagram widget tree
MaterialApp
 └── HomeScreen (StatefulWidget)
       ├── AppBar (to-do plant)
       ├── ListView
       │     ├── TaskCard (Plant 1)
       │     ├── TaskCard (Plant 2)
       │     ├── TaskCard (Plant 3)
       │     └── ...
       └── FloatingActionButton (Tambah tanaman / aksi)

 └── PlantDetailScreen (StatelessWidget)
       ├── AppBar (judul tanaman)
       └── Column
             ├── icon (icon tanaman)
             ├── Text (nama tanaman)
             └── Text (deskripsi tanaman)


# State Management

Aplikasi ini menggunakan **model `AppState` (di `models/app_state.dart`)** untuk mengatur state.  

**Pendekatan**:  
- State disimpan di `AppState` lalu diakses oleh widget melalui konstruktor atau `setState`.  

**Alasan**:  
- Aplikasinya sederhana, sehingga cukup dengan `setState`.  
- Memisahkan state ke dalam file `app_state.dart` membuat kode lebih rapi.  
- Cocok untuk pembelajaran dasar Flutter.  

Jika aplikasi berkembang lebih kompleks, bisa ditingkatkan ke **Provider** atau **Riverpod**.

---

## 📷 Demo

### Screenshot
![Screenshot]

<img width="1894" height="1058" alt="Cuplikan layar 2025-09-05 193023" src="https://github.com/user-attachments/assets/90d4388a-2026-48cb-9c7d-8f6ff4718847" />
<img width="1890" height="1061" alt="Cuplikan layar 2025-09-05 193132" src="https://github.com/user-attachments/assets/93d891c8-84d5-43dc-b33f-f3a279eb361b" />
<img width="1892" height="1057" alt="Cuplikan layar 2025-09-05 193118" src="https://github.com/user-attachments/assets/dceb1b3e-9353-418f-890d-de77c6cce245" />
<img width="1899" height="1060" alt="Cuplikan layar 2025-09-05 193052" src="https://github.com/user-attachments/assets/6b0df18e-81f1-45f9-80a4-047755b4e879" />
<img width="570" height="521" alt="Cuplikan layar 2025-09-05 193032" src="https://github.com/user-attachments/assets/f6f6c24b-9e5b-40d0-a391-bc8418addb66" />


