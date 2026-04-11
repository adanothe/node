## 1. Instalasi
PM2 harus diinstal secara global agar bisa diakses dari mana saja di terminal Anda.

```bash
npm install pm2 -g
```
*Gunakan `sudo` di awal perintah jika Anda menggunakan Linux/macOS dan mendapatkan error permission.*

---

## 2. Menjalankan Aplikasi
Langkah pertama untuk membuat aplikasi Anda "live".

| Perintah | Deskripsi |
| :--- | :--- |
| `pm2 start app.js` | Menjalankan aplikasi (ganti `app.js` dengan file utama Anda). |
| `pm2 start app.js --name "my-api"` | Menjalankan aplikasi dengan nama khusus. |
| `pm2 start app.js --watch` | Otomatis restart aplikasi jika ada perubahan file (cocok untuk development). |
| `pm2 start ecosystem.config.js` | Menjalankan aplikasi menggunakan file konfigurasi. |

---

## 3. Manajemen Proses
Setelah aplikasi berjalan, gunakan perintah berikut untuk mengontrolnya:

* **Melihat daftar aplikasi:**
    ```bash
    pm2 list
    # atau
    pm2 status
    ```
* **Menghentikan aplikasi:**
    ```bash
    pm2 stop <id_atau_nama>
    pm2 stop all # Berhenti semua
    ```
* **Restart aplikasi:**
    ```bash
    pm2 restart <id_atau_nama>
    ```
* **Menghapus aplikasi dari daftar:**
    ```bash
    pm2 delete <id_atau_nama>
    ```

---

## 4. Monitoring dan Logs
Bagian paling krusial untuk melakukan debugging atau memantau kesehatan server.

### Cek Logs secara Real-time
Menampilkan output dari `console.log` atau error yang terjadi.
```bash
pm2 logs
```
Untuk melihat log aplikasi tertentu saja:
```bash
pm2 logs <id_atau_nama>
```

### Monitoring Dashboard
PM2 memiliki interface terminal yang sangat informatif untuk memantau penggunaan CPU dan RAM.
```bash
pm2 monit
```


---

## 5. Konfigurasi Startup (Autostart)
Agar aplikasi otomatis berjalan kembali saat server (VPS) melakukan **reboot**, ikuti langkah ini:

1.  Jalankan perintah ini:
    ```bash
    pm2 startup
    ```
2.  Terminal akan memunculkan sebuah baris perintah panjang. **Copy dan paste** perintah tersebut ke terminal lalu tekan Enter.
3.  Simpan daftar proses saat ini:
    ```bash
    pm2 save
    ```

---

## 6. Tips Tambahan
* **Update PM2:** Jika ingin memperbarui versi PM2 tanpa mematikan aplikasi:
    `npm install pm2 -g && pm2 update`
* **Cluster Mode:** Untuk memanfaatkan seluruh core CPU (meningkatkan performa):
    `pm2 start app.js -i max`
* **Bersihkan Logs:** Jika file log terlalu besar:
    `pm2 flush`
