# HotelBookingApp

`HotelBookingApp`  adalah aplikasi web minimalis yang dirancang untuk menyederhanakan proses reservasi hotel bagi pelanggan dan manajer hotel. Aplikasi ini dibuat dengan Java dan Spring Boot di backend, dan Thymeleaf di frontend. Sistem ini mengikuti pola arsitektur Model-View-Controller (MVC).

## Features

- **Registrasi & Manajemen Pengguna**: Pengguna dapat mendaftar, masuk, dan mengelola profil mereka. Berbagai validasi data (misalnya persyaratan kata sandi yang kuat) telah diterapkan.
- **Manajemen Hotel**: Manajer hotel dapat menambahkan/mengedit hotel, menentukan detail (misalnya nama, alamat, jumlah kamar, harga) dalam satu antarmuka.
- **Pencarian Hotel**: Memungkinkan pelanggan untuk mencari hotel yang tersedia berdasarkan lokasi dan tanggal check-in/check-out.
- **Daftar Hotel**: Menampilkan daftar hotel yang tersedia dengan detail yang relevan seperti nama, jumlah kamar yang tersedia, dan harga.
- **Detail Hotel**: Menyediakan informasi mendalam tentang hotel, termasuk nama, alamat, ketersediaan kamar, harga, dan peta interaktif menggunakan API geocoding Nominatim dan library Leaflet.
- **Pemesanan Kamar**: Pelanggan dapat memilih jumlah kamar yang diinginkan dan diarahkan ke pembayaran untuk menyelesaikan reservasi.
- **Proses Pembayaran**: Pembayaran kartu kredit yang aman dengan validasi seperti pemeriksaan Luhn dan validator khusus untuk tanggal kedaluwarsa dan CVV. (Tidak ada gateway pembayaran pihak ketiga yang diimplementasikan.)
- **Manajemen Pemesanan**: Pelanggan dan manajer hotel dapat melihat pemesanan mereka melalui dashboard.
- **Panel Admin**: Memungkinkan administrator untuk mengelola pengguna, hotel, kamar, dan pemesanan.
- **Desain Responsif:**: Aplikasi ini dioptimalkan untuk berbagai perangkat termasuk desktop, tablet, dan smartphone.

## Technology Stack

- **Backend**:
  - Java 17
  - Spring Boot 3.1.1
  - MVC Architecture (Spring Web MVC 6.0.10)
- **Frontend**:
  - Thymeleaf 3.1.1
  - Bootstrap 5.3.0
  - Bootstrap Icons 1.10.5
  - jQuery 3.7.0
  - jQuery-UI 1.13.2
  - Leaflet 1.9.4 (interactive maps)
- **Database**:
  - XAMPP (optional)
  - MySQL
- **Security**:
  - Spring Security 6.1.1 (authentication and authorization)
- **Other Tools**:
  - Lombok (boilerplate code reduction)
  - Thymeleaf extras and layout dialect (enhanced UI functionality)

## Prerequisites

- Java JDK 17
- Maven
- MySQL

## IMPORTANT NOTE!!!

- Dalam program ini, Anda tidak perlu membuat skema database, tabel, atau memasukkan data ke dalam tabel.
- Jika Anda berhasil menjalankan program, Anda akan melihat pada terminal bahwa program secara otomatis membuat database.
- Dalam proyek ini, kami menggunakan Visual Studio Code, XAMPP, dan PHPMyAdmin.
- Jika Anda mengalami kesalahan saat menjalankan program, Anda hanya perlu mengikuti saran/masukan yang diberikan.

## Installation & Running

1. Ekstrak folder::
   ```sh
   unzip folder di direktori mana saja atau clone github
   ```
   
2. Buka terminal dan navigasi ke direktori proyek::
   ```sh
   cd Hotel_Mendunia
   ```
   
3. Instal dependensi::
   ```sh
   mvn install
   ```

4. Perbarui file application.properties dengan konfigurasi database MySQL Anda::
  ```sh
  sesuaikan dengan port database anda lalu import database (import database bersifat optional)
  ```
   
6. Jalankan aplikasi::
   ```sh
   mvn spring-boot:run
   ```
   
7. Akses aplikasi melalui browser Anda di http://localhost:8080/.

## License

MIT License. Refer to `LICENSE` for more details.
