# MyPortfolio Mobile

* **Nama:** Kayla Alifah Khairunisa
* **NPM:** 2506611931
* **Kelas:** PBP E

Aplikasi mobile berbasis Flutter untuk mengelola dan menampilkan portofolio pribadi secara interaktif.

---

## Instruksi Setup & Menjalankan Proyek

### Prasyarat
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.x atau terbaru)
* Dart SDK (sudah terbundel dalam Flutter SDK)
* Perangkat emulator Android/iOS atau peramban web (Chrome/Edge)

### Langkah Instalasi
1. **Clone repositori ini:**
   ```bash
   git clone <URL_REPOSITORI_KAMU>
   cd myportofolio_mobile

```

2. **Unduh seluruh dependensi proyek:**
```bash
flutter pub get

```


3. **Periksa kebersihan kode (*static analysis*):**
```bash
flutter analyze

```


4. **Jalankan aplikasi:**
```bash
# Menjalankan pada perangkat/emulator default
flutter run

# Atau menjalankan melalui peramban Chrome
flutter run -d chrome

```



---

## Progres Mingguan

* **Minggu 1 (Tugas 7):**
* Memisahkan halaman utama (`MyHomePage`) ke dalam berkas `lib/menu.dart` dan mengubahnya menjadi `StatelessWidget`.
* Menerapkan tema warna global *Digital Lavender* pada `ThemeData` di `lib/main.dart`.
* Membuat tiga tombol aksi (`ItemCard`: *Lihat Proyek*, *Tambah Proyek*, *Logout*) dengan warna berbeda dan umpan balik `SnackBar` interaktif.



---

## Tugas 7: Elemen Dasar Flutter

### 1. Jelaskan apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-widget!

**Widget tree** adalah struktur hierarki berbentuk pohon yang merepresentasikan seluruh elemen antarmuka pengguna (*User Interface* / UI) dalam sebuah aplikasi Flutter. Di Flutter, hampir semua komponen—mulai dari teks, ikon, tombol, hingga pengaturan tata letak seperti *padding* dan perataan—adalah sebuah **widget**.

Hubungan induk-anak (*parent-child*) bekerja melalui mekanisme komposisi berikut:

* **Batasan dari Atas ke Bawah (*Constraints go down*):** Widget induk (*parent*) meneruskan batasan tata letak (*layout constraints* seperti lebar/tinggi minimum dan maksimum) serta konfigurasi konteks (seperti tema dari `Theme` atau ukuran layar dari `MediaQuery`) kepada widget anak (*child* atau *children*).
* **Ukuran dari Bawah ke Atas (*Sizes go up*):** Berdasarkan batasan yang diterima dari induk, widget anak menghitung dan menentukan ukuran dirinya sendiri lalu melaporkannya kembali ke induk.
* **Penentuan Posisi oleh Induk (*Parent sets position*):** Induk kemudian mengatur koordinat posisi (*x, y*) tempat widget anak tersebut akan digambar di layar.
* **Jenis Hubungan:** Widget yang hanya menampung satu anak menggunakan properti `child` (contohnya `Center`, `Padding`, `Card`), sedangkan widget tata letak yang menampung banyak anak sekaligus menggunakan properti `children` berupa `List<Widget>` (contohnya `Column`, `Row`, `GridView`).

---

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

#### **A. Widget Kustom**

* **`MyApp`:** Widget akar aplikasi yang membungkus konfigurasi global `MaterialApp` dan menentukan halaman awal (`home`).
* **`MyHomePage`:** Widget halaman utama portofolio yang menyusun `AppBar`, baris kartu informasi identitas (`InfoCard`), teks sambutan, dan kisi menu aksi (`ItemCard`).
* **`InfoCard`:** Widget kartu kustom untuk menampilkan informasi identitas mahasiswa (`NPM`, `Name`, dan `Class`).
* **`ItemCard`:** Widget kartu tombol interaktif yang menampilkan ikon dan label menu aksi (`Lihat Proyek`, `Tambah Proyek`, `Logout`) serta memicu `SnackBar` saat ditekan.

#### **B. Widget Bawaan Flutter (*Built-in Widgets*)**

* **`MaterialApp`:** Widget akar yang menyediakan konfigurasi inti aplikasi berbasis Material Design, seperti `title`, `theme`, dan `home`.
* **`Scaffold`:** Kerangka tata letak dasar untuk satu halaman layar penuh yang menyediakan struktur standar seperti `appBar` dan `body`, serta mendukung tampilan `SnackBar`.
* **`AppBar`:** Bilah navigasi di bagian atas layar yang menampilkan judul halaman (`MyPortfolio`).
* **`Padding`:** Widget yang memberikan ruang kosong (*margin* dalam) di sekeliling widget anaknya (`EdgeInsets.all`, `EdgeInsets.only`).
* **`Column`:** Widget tata letak yang menyusun daftar widget anaknya (`children`) secara vertikal dari atas ke bawah.
* **`Row`:** Widget tata letak yang menyusun daftar widget anaknya (`children`) secara horizontal dari kiri ke kanan (digunakan untuk menyejajarkan tiga `InfoCard`).
* **`SizedBox`:** Kotak kosong berukuran tetap (`height: 16.0` atau `height: 8.0`) yang digunakan sebagai pemberi jarak vertikal antar-widget.
* **`Center`:** Widget yang memposisikan widget anaknya tepat di tengah ruang yang tersedia.
* **`GridView` (`GridView.count`):** Widget tata letak yang menampilkan daftar widget anak dalam bentuk kisi (*grid*) dua dimensi dengan jumlah kolom tetap (`crossAxisCount: 3`).
* **`Card`:** Kontainer bergaya Material Design dengan sudut membulat (`RoundedRectangleBorder`) dan efek bayangan (`elevation: 2.0`) untuk membungkus `InfoCard`.
* **`Container`:** Widget serbaguna untuk mengatur dimensi (`width`), `padding`, dan tata letak isi di dalam `Card` maupun `ItemCard`.
* **`Material`:** Permukaan visual Material Design yang memberikan warna latar belakang (`color: item.color`) dan sudut melengkung (`borderRadius`) pada `ItemCard` agar efek riak sentuhan (`InkWell`) dapat dirender dengan benar.
* **`InkWell`:** Widget pendeteksi interaksi sentuhan/klik (`onTap`) yang menghasilkan efek visual riak air (*ripple effect*) dan memicu munculnya `SnackBar`.
* **`Icon`:** Widget untuk menampilkan ikon grafis dari pustaka `Icons` (`Icons.folder`, `Icons.add_circle`, `Icons.logout`).
* **`Text`:** Widget untuk merender string teks di layar dengan gaya tertentu (`TextStyle` untuk ukuran, ketebalan, warna, dan `textAlign`).
* **`SnackBar`:** Widget notifikasi sementara yang muncul di bagian bawah layar (dikelola melalui `ScaffoldMessenger`) untuk memberi umpan balik pesan saat tombol ditekan.

---

### 3. Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini umumnya digunakan sebagai *root widget* pada aplikasi Flutter!

**`MaterialApp`** adalah widget pembungkus tingkat atas yang mengonfigurasi berbagai layanan dan perilaku standar antarmuka berbasis **Material Design**.

Alasan `MaterialApp` umumnya dijadikan *root widget* pada aplikasi Flutter:

1. **Penyedia Tema Global (`ThemeData`):** `MaterialApp` menyebarkan konfigurasi warna (`ColorScheme`), tipografi, dan gaya komponen ke seluruh widget di bawahnya melalui `Theme.of(context)`.
2. **Manajemen Navigasi dan Rute (`Navigator`):** `MaterialApp` secara otomatis membuat dan mengelola objek `Navigator` tingkat atas beserta tumpukan halaman (*route stack*), sehingga perpindahan antar-halaman dapat berjalan mulus.
3. **Dukungan Arah Teks (`Directionality`):** Widget teks seperti `Text` membutuhkan konteks arah baca (kiri-ke-kanan / LTR atau kanan-ke-kiri / RTL). `MaterialApp` menyediakannya secara otomatis sehingga tidak perlu membungkus setiap `Text` dengan `Directionality`.
4. **Integrasi Komponen Material:** Komponen seperti `Scaffold`, `AppBar`, `SnackBar`, dan efek riak `InkWell` bergantung pada konteks yang disediakan oleh `MaterialApp` agar dapat dirender sesuai standar Material Design.

---

### 4. Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`?

| Aspek | `StatelessWidget` | `StatefulWidget` |
| --- | --- | --- |
| **Sifat Data (*State*)** | *Immutable* (tidak dapat berubah setelah widget dibuat). | *Mutable* (memiliki objek `State` terpisah yang datanya dapat berubah selama siklus hidup widget). |
| **Pembaruan UI** | Hanya dirender ulang jika widget induknya membangun ulang dengan parameter baru atau jika dependensi tema/layar berubah. | Dapat memicu pembaruan tampilan secara mandiri kapan saja dengan memanggil fungsi `setState()`. |
| **Struktur Kelas** | Terdiri dari 1 kelas turunan `StatelessWidget` yang langsung meng-*override* `build()`. | Terdiri dari 2 kelas: kelas `StatefulWidget` itu sendiri dan kelas pendamping `State<T>` tempat variabel dinamis dan `build()` berada. |
| **Performa** | Lebih ringan karena tidak menyimpan objek *state* di memori. | Sedikit lebih berat karena memelihara siklus hidup objek `State`. |

**Kapan Memilih Masing-Masing:**

* **Pilih `StatelessWidget**` ketika tampilan halaman atau komponen hanya bergantung pada konfigurasi awal yang diterimanya dan tidak berubah secara dinamis akibat interaksi lokal di halaman tersebut—seperti `MyHomePage`, `InfoCard`, dan `ItemCard` pada proyek ini.
* **Pilih `StatefulWidget**` ketika tampilan UI perlu berubah secara dinamis merespons interaksi pengguna atau aliran data asinkron di dalam widget itu sendiri—misalnya halaman *form* input, penghitung (*counter*), tombol *toggle*, atau halaman yang memuat data dari API.

---

### 5. Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode `build`?

**`BuildContext`** adalah objek referensi atau "alamat lokasi" yang menunjukkan posisi spesifik sebuah widget di dalam *widget tree*. Setiap widget memiliki `BuildContext`-nya sendiri yang dioper sebagai parameter ke dalam metode `Widget build(BuildContext context)`.

**Mengapa `BuildContext` Penting:**
Karena *widget tree* memiliki struktur bersarang yang dalam, sebuah widget membutuhkan `BuildContext` untuk menelusuri pohon ke atas (*walk up the tree*) guna mencari data atau layanan yang disediakan oleh widget leluhur (*ancestor*) terdekat.

**Penggunaannya di dalam Metode `build` pada Proyek Ini:**

1. **Mengakses Tema Global (`Theme.of(context)`):** Di dalam `MyHomePage`, `InfoCard`, dan `ItemCard`, `context` digunakan untuk mengambil `colorScheme` yang didefinisikan di `MaterialApp` (`Theme.of(context).colorScheme`).
2. **Mengukur Dimensi Layar (`MediaQuery.of(context)`):** Di dalam `InfoCard`, `context` digunakan untuk membaca lebar layar perangkat (`MediaQuery.of(context).size.width / 3.5`) agar ukuran kartu bersifat responsif.
3. **Menampilkan Notifikasi (`ScaffoldMessenger.of(context)`):** Di dalam `ItemCard`, `context` digunakan untuk mencari `ScaffoldMessenger` terdekat di atasnya guna menampilkan `SnackBar` di bagian bawah `Scaffold`.

---

### 6. Jelaskan konsep *hot reload* di Flutter dan apa perbedaannya dengan *hot restart*! Kapan kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan *hot restart* atau *full restart*?

#### **Konsep dan Perbedaan**

* **Hot Reload (`r`):** Menyuntikkan file kode Dart yang baru dimodifikasi ke dalam *Dart Virtual Machine* (VM) yang sedang berjalan. Setelah *VM* memperbarui kelas dan fungsi, framework Flutter secara otomatis membangun ulang *widget tree* (`build()`), **sambil mempertahankan *state* aplikasi saat ini**. Prosesnya sangat cepat (umumnya di bawah 1 detik).
* **Hot Restart (`R`):** Memuat ulang seluruh kode Dart dan me-*reset* ulang aplikasi dari fungsi `main()` tanpa mengompilasi ulang kode *native* (Android/iOS/Web). **Seluruh *state* aplikasi akan dihapus dan dikembalikan ke kondisi awal**, memakan waktu sedikit lebih lama dibanding *hot reload*.

#### **Kapan Harus Melakukan *Hot Restart* atau *Full Restart*:**

Kita **tidak bisa** hanya mengandalkan *hot reload* dan wajib melakukan **Hot Restart** ketika:

1. Mengubah konfigurasi di dalam fungsi `main()` atau inisialisasi `ThemeData` pada *root widget* yang tidak memicu pembaruan *state* lokal.
2. Mengubah variabel global, konstanta `static`, atau menginisialisasi ulang nilai awal pada `initState()` di dalam `StatefulWidget`.
3. Mengubah struktur kelas secara signifikan (misalnya mengubah sebuah widget dari `StatelessWidget` menjadi `StatefulWidget` atau sebaliknya).

Sementara itu, kita wajib melakukan **Full Restart** (menghentikan aplikasi lalu menjalankan ulang `flutter run` dari awal) ketika:

1. Menambahkan atau memperbarui *dependencies* paket baru di berkas `pubspec.yaml`.
2. Menambahkan aset baru (gambar, font, atau ikon kustom) ke dalam proyek dan mendaftarkannya di `pubspec.yaml`.
3. Melakukan perubahan pada kode atau konfigurasi tingkat *native* (seperti berkas di folder `android/`, `ios/`, atau izin akses perangkat).

---

## AI Disclosure

### 1. Tools yang Digunakan
* **Google Gemini:** Digunakan sebagai alat bantu verifikasi kesesuaian implementasi terhadap *checklist* tugas, pengecekan *best practice* sintaks Dart/Flutter, serta validasi draf dokumentasi.

### 2. Bagian Spesifik yang Dibantu & Strategi Prompting
* **Strategi Prompting:** Menggunakan pendekatan *verification-first*—saya menulis implementasi kode (`main.dart` dan `menu.dart`) serta menentukan palet warna secara mandiri terlebih dahulu, lalu menggunakan AI untuk memvalidasi apakah kode sudah memenuhi seluruh *checklist* dan mengecek potensi perbaikan kualitas kode.
* **Bagian yang Dibantu:**
  * Verifikasi struktur *refactoring* `MyHomePage` menjadi `StatelessWidget` pada `lib/menu.dart` agar sesuai dengan spesifikasi tugas.
  * Diskusi opsi penerapan palet warna pilihan saya (*Digital Lavender*) ke dalam `ThemeData` dan pengecekan kontras warna teks pada tombol kartu.
  * Pengecekan kelengkapan poin jawaban konseptual dan penyusunan format dokumentasi `README.md`.

### 3. Log Prompting (Tugas 7)
1. **Pengecekan Implementasi Mandiri:** Mengirimkan kode `lib/menu.dart` yang sudah saya tulis untuk memverifikasi kesesuaiannya dengan *checklist* tugas.
2. **Validasi Kustomisasi Warna:** Melampirkan referensi palet warna pilihan saya (*Digital Lavender*) dan mengecek cara terbaik menerapkannya pada `ItemCard` serta `ThemeData`.
3. **Review Jawaban & Dokumentasi:** Meminta tinjauan ulang terhadap draf jawaban pertanyaan konseptual Flutter dan struktur `README.md` sebelum dilakukan *commit*.

### 4. Analisis Kritis Keterbatasan AI & Perbaikan Manual
* **Keputusan Arsitektur Pengelolaan Warna:** AI sempat menyarankan pembuatan *class* konstanta warna terpisah (`AppColors`) di dalam `menu.dart` untuk menyimpan kode hex. Saya tidak menggunakan saran tersebut dan memilih mengelola warna secara terpusat melalui `ColorScheme` di `main.dart` lalu memanggilnya via `Theme.of(context)` agar lebih sesuai dengan standar Flutter dan mudah dipakai ulang pada tugas-tugas berikutnya.
