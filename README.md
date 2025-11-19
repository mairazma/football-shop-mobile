# amaranth_sportcenter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

# TUGAS 7

**1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.**  
Sesuai namanya, widget tree adalah suatu sistem tampilan flutter yang mengatur widgetnya secara tree. Ini artinya setiap elemen bisa memiliki anak ataupun induk. Widget merujuk pada seluruh elemen seperti teks, icon, tombol. Setiap widget dapat menjadi parent selama dia memiliki child. Widget yang menjadi parent berperan untuk mengatur tata letak widget-widget yang menjadi child-nya. Widget-widget yang menjadi child bisa diatur secara baris, kolom, atau yang lainnya sesuai pengaturan yang didefinisikan parent. Hubungan parent-child ini membuat developer lebih mudah mengatur tampilan aplikasi mereka.

**2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**  
- `main.dart`  
    - **MyApp**: root widget. Wrap semua elemen aplikasi (the whole thing).
    - **MaterialApp**: Mengatur konfigurasi aplikasi seperti judulnya, temanya, dll.
    - **MyHomePage**: Widget yang diimport dari `menu.dart`.

- `menu.dart`
    - **MyHomePage**: Widget buatan sendiri yang akan menjadi root dari halaman utama. 
    - **Scaffold**: Widget pengatur struktur appBar, Body, dll.
    - **AppBar**: Wadah untuk menampilkan bar di atas aplikasi.
    - **Padding**: Space untuk widget-widget di dalam body. Memberikan space antara ujung sisi dan konten.
    - **Column**: Pengaturan padding memiliki kolom yang akan diisi oleh widget-widget baru.
    - **Row**: Wadah untuk widget child ditata secara baris.
    - **ItemCard**: Objek card yang dibuat sendiri untuk menampilkan informasi.
    - **Center**: Pada body, widget yang ada pada parent ini akan berada di tengah halaman.
    - **Text**: Widget teks untuk menampilkan informasi.
    - **GridView.count**: Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
    - **Card**: Widget sebagai wadah untuk menampilkan informasi nama, NPM, kelas.
    - **Container**: Wadah untuk mengatur padding, margin, ukuran, warna, atau dekorasi.
    - **EdgeInsets**: Mengatur lebar padding atau margin.
    - **Material**: Mengatur tampilan ItemCard.
    - **BorderRadius**: Mengatur seberapa besar dan bentuk round sebuah container.
    - **InkWell**: Handling event ketika button dipencet, dalam kasus ini, memunculkan snackbar.
    - **SnackBar**: Widget container untuk button, menyimpan icon dan text pada kasus ini.
    - **Icon**: Fungsi bantuan flutter untuk ikon-ikon agar tampilan lebih menarik.

**3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.**  
Untuk aplikasi berbasis Material Design (bahasa design universal dari Google), MaterialApp adalah widget yang membuka jalan untuk item-item yang tersedia di bahasa Material Design tersebut. MaterialApp juga mengatur tema, homepage, navigasi, dll. Dengan pengaturan dan desain yang telah terhubung, aplikasi menjadi lebih mudah untuk diatur tampilannya.

**4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?**  
StatelessWidget adalah widget yang tidak akan terpengaruh oleh state/kondisi apapun. Widget ini bisanya appBar, Card, Container, karena desain widget-widget ini akan selalu dipakai apapun kondisinya. Sementara itu, StatefulWidget kebalikannya. Widget jenis ini bisa berubah bergantung kondisi. Biasanya widget seperti ini akan menerima input dan berubah sesuai dengan input pengguna, atau bergantung pada role pengguna, dll.

Pemilihan kedua jenis widget ini bergantung pada tujuan widget tersebut. Biasanya untuk halaman/widget statis (mungkin container, appBar) sebaiknya menggunakan StatelessWidget. Kemudian untuk widget yang bisa berubah tergantung input (mungkin form, CRUD, dll) dapat menggunakan StatefulWidget.

**5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?**  
Objek BuildContext memungkinkan child widget mengambil informasi dari widget parent-nya. Misal pada MaterialApp kita mendeklarasikan themeData. Dengan meneruskan pengaturan tersebut pada metode build, sebuah child bisa mengambil data tema dari parentnya. Ini mendukung konsistensi theme suatu aplikasi.

**6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".**  
Hot reload adalah fitur Flutter yang membantu developer untuk mengubah tampilan aplikasinya (source code terbaru disimpan di Dart VM) tanpa harus menjalankan ulang aplikasinya dari awal. Biasanya hot reload menangani perubahan yang tidak terlalu berdampak, misal perubahan warna, teks, dll. Sementara itu hot restart biasanya melibatkan perubahan skala besar seperti struktur halaman, objek home, dll.

**7. Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.**  
Flutter mendukung perpindahan antarlayar pada aplikasi menggunakan konsep stack. Setiap layar baru dibuka, layar tersebut akan ditambahkan ke-stack. Dengan begitu, ketika pengguna ingin kembali ke halaman sebelumnya, stack hanya perlu di-pop. Konsep ini mirip dengan undo-redo pada umumnya.

# TUGAS 8
**1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?**  
Perbedaan kedua method tersebut dapat dipahami dengan memahami struktur data Stack. Flutter menggunakan Stack untuk menyimpan histori halaman-halaman yang diakses pengguna. Setiap pengguna pindah ke halaman baru, halaman sebelumnya akan di-push menjadi Top of the Stack. Sehingga, jika pengguna ingin kembali ke halaman sebelumnya, halaman tersebut bisa di-pop dari Stack.  

Sesuai namanya, `Navigator.push()` berarti ketika pengguna akan pindah halaman baru, halaman sebelumnya akan di-push ke stack menjadi elemen baru. Menambahkan jumlah stack pada sistem. Namun, jika digunakan `Navigator.pushReplacement()`, halaman baru akan 'menggantikan' halaman sebelumnya pada stack. Hal ini membuat jumlah elemen pada stack tetap.   

**2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?**  
Scaffold menyediakan stuktur standar aplikasi yang familiar oleh pengguna. Kerangka utama Scaffold membantu konsistensi antarhalaman sehingga meningkatkan pengalaman pengguna. AppBar dan Drawer menjadi salah dua atribut utama dari Scaffold yang umum digunakan pada sebuah aplikasi. AppBar menjadi identitas utama sebuah aplikasi, menjadi penanda di setiap halaman, aplikasi apa yang sedang pengguna gunakan. Drawer sendiri istilahnya seperti NavBar pada website mode mobile. Drawer menjadi shortcut pengguna untuk berpindah-pindah halaman. Terutama jika halamannya tidak berhubungan.  

**3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.**  
- **Padding**  
    Sesuai pengertian pada umumnya, padding menjadi pemberi jarak antar-widget agak tidak terlalu rapat dan meningkatkan desain antarmuka.
    _Contoh penggunaan:_  
    `productlist_form.dart`  
    > Padding membantu pengguna membedakan input baru (antar field input), input mana untuk menginput apa, sehingga pengguna tidak salah input.  

- **SingleChildScrollView**  
    SingleChildScrollView memastikan sebuah widget (biasanya column) pada form tetap bisa di-scroll ketika tinggi layar tidak cukup, misalnya di perangkat kecil atau saat keyboard muncul. Hal ini membantu ke-responsifan aplikasi di ukuran device yang berbeda dari pengguna.  
    _Contoh penggunaan:_  
    `productlist_form.dart`  
    > SingleChildScrollView digunakan pada file ini untuk membungkus Column() yang berisi field-field input form untuk memungkinkan pengguna meng-scroll field-field tersebut jika layar terlalu kecil.  

- **ListView**  
    ListView membantu item-item widget dapat discroll sehingga meningkatkan antarmuka.   
    _Contoh penggunaan:_  
    `left_drawer.dart`  
    > Pada file ini, ListView digunakan pada bagian baris-baris tombol shortcut di drawer. ListView digunakan karena list tombol ini cenderung statis, sehingga dapat di-load langsung bersamaan dan tidak berubah. ListView memungkinkan peng-scroll-an tombol jika tombol makin banyak nantinya.  

**4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?**  
Untuk menjaga warna tema agar aplikasi Amaranth Sportcenter memiliki identitas visual yang konsisten, kita bisa mengaturnya dengan ThemeData yang ada di file `main.dart`. ThemeData menyediakan atribut-atribut dasar warna tema seperti backgroundColor, foregroundColor, dan lain sebagainya agar ke depannya, warna-warna elemen/widget dapat diambil dari data tersebut sehingga ada konsistensi antarhalaman.

# TUGAS 9

**1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?**  
Penggunaan model Dart ketika mengambil/mengirim data JSON memudahkan sistem untuk mengidentifikasi tipe-tipe data yang dikirim. Model Dart dapat mengatasi null values, validasi, dan hal-hal lainnya sehingga sistem tidak perlu lagi memvalidasi data ketika runtime. Model Dart membantu mendeklarasikan karakteristik data yang diambil/dikirim serta memudahkan parsing data. Penggunaan model juga meningkatkan readability dan lebih umum digunakan (mirip seperti implementasi model di Django). Jika tidak menggunakan model dan langsung memetakan Map<String, dynamic>, ada risiko banyak null value yang baru terdeteksi ketika runtime. Selain itu, kode menjadi lebih sulit diatur/diubah secara modular karena penyesuaian yang perlu dilakukan setiap pemetaan tersebut digunakan.

**2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.**  
http dan CookieRequest pada tugas ini berfungsi sebagai media pengambil data dari web yang telah diintegrasikan dengan aplikasi mobile. Utamanya, http berfungsi membuat Request HTTP (bisa GET/POST/PUT/DELETE) dan menerima response berupa status code dan body. Pada tugas ini, https digunakan untuk fetch data dari public API yang tidak membutuhkan login, session, dll. Sementara itu CookieRequest adalah versi http yang lebih aman, CookieRequest berarti mengirim request untuk membuat cookie, agar pada sesi request selanjutnya, cookie dapat dikirim dan data masih dapat di-fetch dari website. CookieRequest dapat menangani pengambilan data yang membutuhkan login karena dapat mencatat cookie.

**3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**  
Seperti yang sudah terjawab pada nomor 2, instance CookieRequest mencatat Set-Cookie pada sebuah session di website. Dengan membagikan instance tersebut ke semua komponen aplikasi, maka semua komponen tersebut juga mengetahui kode cookie yang perlu dikirimkan ketika melakukan request. Dengan begitu, semua komponen akan mengambil data dari sesi yang sama, mewujudkan keselarasan data. 

**4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?**  
- **Menambahkan 10.0.2.2 pada ALLOWED_HOSTS**  
Karena aplikasi kita akan mengambil data dari website, maka harus ada izin host yang akan mengakses website tersebut. Secara default, Android Emulator menggunakan alamat 10.0.2.2 untuk mengakses host machine localhost. Jika alamat 10.0.2.2 tidak dimasukkan ke AALLOWED_HOSTS, maka ketika alamat tersebut mengakses—mengirim request ke—localhost, request akan ditolak karena alamat tersebut tidak punya autentikasi untuk mengakses localhost.
- **Mengaktifkan CORS dan pengaturan SameSite/cookie**  
CORS (Cross-Origin Resource Sharing) diaktifkan agar kita dapat mengirim request ke server berbeda. Hal ini dilakukan karena Flutter mengharuskan hal tersebut jika kita mengintegrasikan data aplikasi mobile dengan website. Jika CORS tidak diaktifkan, maka request ke domain akan ditolak dan kita tidak dapat mengambil data dari domain tersebut. Ketika CORS sudah diaktifkan, maka kita perlu memastikan bahwa cookie benar-benar dikirim ketika melakukan request terutama jika request tersebut membutuhkan sesi. Untuk memastikan hal itu, kita perlu mengatur `SamSite=None` dan `Secure=True`. 
- **Menambahkan izin akses internet di Android**
Menambahkan izin akses internet berarti mengizinkan aplikasi untuk membuka koneksi jaringan. Hal ini diperlukan karena kita menghubungkan aplikasi dengan website yang perlu diakses dalam jaringan. Jika akses ini tidak di-allow, maka proses fetch data dari website akan bermasalah.

**5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.**  
Pertama-tama, input user yang didapat dari aplikasi Flutter akan dikumpulkan dan dijadikan model. Model tersebut barulah diserialisasi menjadi data JSON. Selanjutnya, data berbentuk JSON dikirim melalui request HTTP ke web app Django yang telah diintegrasikan. Server yang menerima request, akan melakukan validasi, parsing, dan menyimpan data ke database. Kemudian server akan memberikan respons, respons tersebut diterima oleh Flutter berupa data JSON awal yang telah melalui proses validasi. Data yang diterima dari respons terakhir di-render menggunakan widget dari Flutter.

**6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**  
Di aplikasi mobile, user akan memasukkan data login/register, misalnya username dan password. Setelah data diterima Flutter dan diproses menjadi JSON, data tersebut dikirim ke web yang bersangkutan dengan melakukan request. Untuk register, jika data valid (username belum ada, password valid, dll), maka data akan dimasukkan ke database dan server memberikan respons OK. Untuk login, jika kombinasi username dan password valid (ada di database), maka selajutnya pada sisi Django akan diverifikasi autentikasi (apakah setelah login, user ini dapat melihat page A atau tidak?), pengaturan cookie juga di-set pada tahap ini. Kemudian setelah semua variabel terpenuhi, respons diberikan. Untuk logout, Flutter akan memberikan request logout() ke endpoint Django yang bersesuaian. Ketika logout, maka data cookie hilang di sini dan server akan memberikan respons. Semua respons yang diberikan dari server, akan di-render sesuai dengan UI yang telah dibuat. 

**7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**  
Pertama-tama, saya memastikan website football shop saya berjalan dengan lancar di local. Selanjutnya, saya memulai dari membuat model berdasarkan data-data produk yang sudah sempat saya masukkan di lokal. Selanjutnya saya memastikan pengintegrasian data dengan baik dengan mencoba fetch data-data yang diperlukan dari website ke aplikasi. Beberapa kali menemukan error karena belum menangani null, namun sudah di-fix. Selanjutnya, saya memaksimalkan tampilan dengan menambahkan fitur filter My Products di tampilan seluruh produk. Hal itu saya lakukan dengan variable passing ke widget yang menampilkan produk untuk memberitahu currentState apakah All/My Products. Begitu fitur sudah berjalan dengan baik, barulah saya mengeksplor design untuk menyamakannya dengan website.