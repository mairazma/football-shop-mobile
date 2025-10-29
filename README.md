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
