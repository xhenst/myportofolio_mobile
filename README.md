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
   git clone https://github.com/xhenst/myportofolio_mobile.git
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

* **Minggu 2 (Tugas 8):**
  * Merapikan struktur direktori proyek menjadi `lib/screens/` (`menu.dart`, `project_form.dart`, `experience_form.dart`) dan `lib/widgets/` (`left_drawer.dart`, `menu_card.dart`).
  * Mengimplementasikan navigasi berbasis *drawer* (`LeftDrawer`) dan kartu aksi pada halaman utama menuju halaman formulir *Project* dan *Experience*.
  * Membuat halaman formulir baru `ExperienceFormPage` (`lib/screens/experience_form.dart`) dengan 7 atribut lengkap sesuai model *Experience* (termasuk *dropdown*, *date picker*, *radio group*, validasi format URL, dan validasi urutan tanggal) serta ringkasan hasil input dalam `AlertDialog`.

---

## Tugas 7

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

## Tugas 8

### 1. Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi `Home` di drawer membawa pengguna kembali ke halaman utama.

Flutter mengelola perpindahan antar-layar menggunakan struktur data tumpukan (*navigation stack* / LIFO):

* **`Navigator.push()`:** Menambahkan rute (*route*) halaman baru ke puncak tumpukan tanpa menghapus halaman sebelumnya. Halaman lama tetap tersimpan di bawahnya sehingga pengguna dapat kembali menggunakan tombol *Back* bawaan perangkat atau peramban.
* **`Navigator.pushReplacement()`:** Menggantikan halaman yang sedang aktif di puncak tumpukan dengan halaman baru (halaman lama dihapus dari *stack*). Pengguna tidak dapat kembali ke halaman sebelumnya menggunakan tombol *Back* karena rutenya telah diganti.
* **`Navigator.pop()`:** Menghapus rute teratas dari tumpukan untuk menutup dialog atau kembali ke halaman tepat di bawahnya.

**Penerapan pada Proyek Ini:**

* **Membuka formulir dari kartu aksi:** Menggunakan **`Navigator.push()`** di dalam `ItemCard` (`lib/widgets/menu_card.dart`). Dengan metode ini, `MyHomePage` tetap tersimpan di bawah `ExperienceFormPage` atau `ProjectFormPage` pada *navigation stack*, sehingga pengguna dapat kembali ke halaman utama menggunakan tombol *Back* bawaan perangkat/peramban.
* **Opsi `Home` di drawer:** Menggunakan **`Navigator.pushReplacement()`** di dalam `LeftDrawer` (`lib/widgets/left_drawer.dart`) untuk mengganti rute formulir aktif dengan `MyHomePage`. Hal ini mencegah penumpukan rute berulang di dalam *stack* saat pengguna berpindah menu lewat drawer, sekaligus memastikan pengguna selalu dapat kembali ke halaman utama dari halaman formulir mana pun (termasuk saat diuji di Chrome).

---

### 2. Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

* **Peran Struktur Halaman:** `Scaffold` menyediakan kerangka tata letak standar Material Design pada setiap halaman, `AppBar` menampilkan bilah header yang seragam beserta ikon menu (*hamburger*) secara otomatis, dan pemasangan komponen `LeftDrawer` yang sama pada properti `drawer` di setiap `Scaffold` (`MyHomePage`, `ProjectFormPage`, dan `ExperienceFormPage`) memastikan navigasi global selalu tersedia di lokasi dan tampilan yang konsisten.
* **Contoh Penggunaan Warna Tema di Lebih dari Satu Halaman:** Seluruh halaman mengambil palet warna terpusat melalui `Theme.of(context).colorScheme` (*Digital Lavender*, dengan `primary` `#34304D` dan `onPrimary` putih) yang didefinisikan di `main.dart`. Warna `colorScheme.primary` digunakan secara konsisten sebagai warna latar belakang `AppBar` di `MyHomePage`, `ProjectFormPage`, dan `ExperienceFormPage`, latar belakang `DrawerHeader` pada `LeftDrawer`, serta warna latar tombol utama **Simpan** pada halaman formulir.

---

### 3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.

* **Alasan Pemilihan Tata Letak:** Formulir disusun secara vertikal menggunakan `Column` (`CrossAxisAlignment.start`) agar urutan pembacaan dari label, kolom input, pesan kesalahan validasi, hingga tombol **Simpan** berjalan alami dari atas ke bawah.
* **Peran Widget Pengatur Jarak (`Padding` & `SizedBox`):** Memberikan ruang pemisah antar-komponen input (seperti `Padding(padding: EdgeInsets.only(bottom: 12.0))` dan `SizedBox`) sehingga tiap kolom tidak saling menempel, pesan kesalahan di bawah field terbaca jelas, dan area sentuh mudah dijangkau pengguna.
* **Peran Widget Penggulir (`SingleChildScrollView`):** Ketika aplikasi dibuka pada layar ponsel berukuran sempit atau ketika papan ketik virtual (*on-screen keyboard*) muncul dan mengurangi tinggi layar yang tersedia, tinggi isi formulir dapat melebihi area layar. `SingleChildScrollView` memungkinkan seluruh konten formulir digulir secara vertikal sehingga mencegah *RenderFlex overflow* dan memastikan field terbawah serta tombol **Simpan** tetap dapat dijangkau.

---

### 4. Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol `Simpan` ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

* **`GlobalKey<FormState>`:** Berperan sebagai kunci unik yang memegang referensi langsung ke *state* internal widget `Form` (`_formKey`), sehingga seluruh status validasi widget input di dalamnya dapat dikontrol dari luar widget input tersebut (seperti dari tombol **Simpan**).
* **`validator`:** Fungsi pada setiap field input (`TextFormField` dan `FormField<DateTime>`) yang memeriksa nilai masukan terhadap aturan model dan mengembalikan pesan kesalahan berupa `String` jika tidak memenuhi syarat, atau `null` jika valid.
* **`validate()`:** Metode pada `FormState` (`_formKey.currentState!.validate()`) yang dipanggil ketika tombol **Simpan** ditekan. Metode ini menjalankan seluruh fungsi `validator` pada setiap field secara bersamaan, menampilkan pesan error pada kolom yang gagal, dan hanya mengembalikan `true` (sehingga `showDialog()` dijalankan) apabila seluruh input dinyatakan valid.

**Contoh Nilai yang Ditolak & Mengapa Tipe Input/Keyboard Saja Belum Cukup:**

* **Contoh Nilai yang Ditolak:** Memasukkan `"   "` (hanya berisi spasi) pada **Nama Experience**, memasukkan `"portofolio-kayla.com"` (tanpa skema `http://` atau `https://`) pada **URL Thumbnail**, atau memilih **Waktu Berakhir** yang tanggalnya lebih awal daripada **Waktu Dimulai**.
* **Alasan Jenis Input/Keyboard Saja Belum Cukup:** Mengatur `keyboardType: TextInputType.url` hanya menyesuaikan tampilan tombol pada papan ketik virtual untuk memudahkan pengetikan, tetapi **tidak** membatasi isi data yang masuk—pengguna tetap bisa membiarkan kolom kosong, memasukkan spasi saja, atau menempel (*paste*) teks dengan format yang keliru. Oleh karena itu, fungsi `validator` di level aplikasi tetap diperlukan untuk memastikan validitas data sebelum ditampilkan atau diproses lebih lanjut.

---
## AI Disclosure

### Tugas 7: Elemen Dasar Flutter

#### 1. Tools yang Digunakan
* **Google Gemini:** Digunakan sebagai alat bantu verifikasi kesesuaian implementasi terhadap *checklist* tugas, pengecekan *best practice* sintaks Dart/Flutter, serta validasi draf dokumentasi.

#### 2. Bagian Spesifik yang Dibantu & Strategi Prompting
* **Strategi Prompting:** Menggunakan pendekatan *verification-first*—saya menulis implementasi kode (`main.dart` dan `menu.dart`) serta menentukan palet warna secara mandiri terlebih dahulu, lalu menggunakan AI untuk memvalidasi apakah kode sudah memenuhi seluruh *checklist* dan mengecek potensi perbaikan kualitas kode.
* **Bagian yang Dibantu:**
  * Verifikasi struktur *refactoring* `MyHomePage` menjadi `StatelessWidget` pada `lib/menu.dart` agar sesuai dengan spesifikasi tugas.
  * Diskusi opsi penerapan palet warna pilihan saya (*Digital Lavender*) ke dalam `ThemeData` dan pengecekan kontras warna teks pada tombol kartu.
  * Pengecekan kelengkapan poin jawaban konseptual dan penyusunan format dokumentasi `README.md`.

#### 3. Log Prompting (Tugas 7)
1. **Pengecekan Implementasi Mandiri:** Mengirimkan kode `lib/menu.dart` yang sudah saya tulis untuk memverifikasi kesesuaiannya dengan *checklist* tugas.
2. **Validasi Kustomisasi Warna:** Melampirkan referensi palet warna pilihan saya (*Digital Lavender*) dan mengecek cara terbaik menerapkannya pada `ItemCard` serta `ThemeData`.
3. **Review Jawaban & Dokumentasi:** Meminta tinjauan ulang terhadap draf jawaban pertanyaan konseptual Flutter dan struktur `README.md` sebelum dilakukan *commit*.

#### 4. Analisis Kritis Keterbatasan AI & Perbaikan Manual
* **Keputusan Arsitektur Pengelolaan Warna:** AI sempat menyarankan pembuatan *class* konstanta warna terpisah (`AppColors`) di dalam `menu.dart` untuk menyimpan kode hex. Saya tidak menggunakan saran tersebut dan memilih mengelola warna secara terpusat melalui `ColorScheme` di `main.dart` lalu memanggilnya via `Theme.of(context)` agar lebih sesuai dengan standar Flutter dan mudah dipakai ulang pada tugas-tugas berikutnya.

---

### Tugas 8: Navigasi, Tata Letak, dan Formulir di Flutter

#### 1. Tools yang Digunakan
* **Google Gemini:** Digunakan sebagai alat bantu verifikasi kesesuaian implementasi terhadap *checklist* tugas, pengecekan hasil analisis statis (`flutter analyze`) untuk API Flutter terbaru, serta review jawaban reflektif.

#### 2. Bagian Spesifik yang Dibantu & Strategi Prompting
* **Strategi Prompting:** Menggunakan pendekatan *iterative verification*—saya merancang atribut form berdasarkan model aplikasi web Django yang sudah dibuat sebelumnya (`MyPortfolio`), mengimplementasikan struktur navigasi serta layar formulir, lalu menggunakan AI untuk mengecek *edge cases* validasi dan kebersihan kode.
* **Bagian yang Dibantu:**
  * Penyesuaian 7 atribut `ExperienceFormPage` (`Nama Experience`, `Deskripsi Experience`, `Category Experience`, `URL Thumbnail`, `Waktu Dimulai`, `Waktu Berakhir`, dan `On-going`) beserta aturan validasi URL (`Uri.tryParse`) dan urutan tanggal.
  * Peninjauan alur navigasi antara `LeftDrawer`, `ItemCard` (`menu_card.dart`), dan `ExperienceFormPage`, serta review jawaban pertanyaan reflektif Tugas 8.

#### 3. Log Prompting (Tugas 8)
1. **Penyesuaian Model & Validasi Form:** Melampirkan rancangan atribut form *Experience* dari aplikasi web untuk menyesuaikan field input, *date picker*, validasi URL, dan urutan tanggal di `lib/screens/experience_form.dart`.
2. **Integrasi Navigasi & Drawer:** Mengecek penambahan rute menuju `ExperienceFormPage` di `lib/widgets/left_drawer.dart` serta penyesuaian path *import* setelah pemindahan berkas ke `lib/screens/`.

#### 4. Analisis Kritis Keterbatasan AI & Perbaikan Manual
* **Penyesuaian Widget `InputDecorator`:** Pada draf awal form, AI sempat menempatkan properti `enabled` langsung pada widget `InputDecorator` yang menimbulkan error kompilasi karena properti tersebut seharusnya berada di dalam `InputDecoration`. Saya memperbaiki penempatannya agar field *Waktu Berakhir* nonaktif secara visual saat status *On-going* dipilih.
* **Generalisasi Widget Kartu (`menu_card.dart`):** AI awalnya menyarankan pembuatan berkas kartu terpisah (`experience_card.dart`) khusus untuk menu *Experience*. Saya memutuskan untuk tidak memisahkannya dan menggabungkan logika navigasi ke dalam satu widget `ItemCard` di `lib/widgets/menu_card.dart` agar menghindari duplikasi kode (*DRY*).