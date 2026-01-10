# WiFiShield Quick Start

Setup and run WiFiShield on ESP32 for credential capture.

---

## English

### Requirements

- ESP32 Development Board
- USB Cable  
- Python 3.8 or higher
- PlatformIO installed

### Step 1: Clone Repository

\\\
git clone https://github.com/Harriiee/wifishield.git
cd wifishield
\\\

### Step 2: Build Firmware

\\\
python -m platformio run -e esp32
\\\

Wait until you see SUCCESS message.

### Step 3: Flash to ESP32

Make sure ESP32 is connected via USB cable.

\\\
python -m platformio run -e esp32 --target upload
\\\

Board will restart automatically after flashing.

### Step 4: Connect and Access

1. Connect to WiFi network: WiFiShield
2. Enter password: 12345678
3. Open browser and go to: http://192.168.4.1/admin
4. View captured credentials in Passwords tab

### Testing

1. Visit login page: http://192.168.4.1/login.html
2. Enter any username and password
3. Click submit
4. Check admin panel to see captured credentials

### Troubleshooting

If build fails:
\\\
python -m platformio system prune -f
python -m platformio run -e esp32
\\\

If upload fails:
- Check USB cable connection
- Verify COM port: python -m platformio device list
- Try pressing RESET button on board

If cannot access 192.168.4.1:
- Ensure you are connected to WiFiShield network
- Check WiFi password is correct
- Reset the board

---

## Bahasa Indonesia

### Persyaratan

- Board ESP32 Development
- Kabel USB
- Python 3.8 atau lebih tinggi
- PlatformIO terinstall

### Langkah 1: Clone Repository

\\\
git clone https://github.com/Harriiee/wifishield.git
cd wifishield
\\\

### Langkah 2: Build Firmware

\\\
python -m platformio run -e esp32
\\\

Tunggu sampai muncul pesan SUCCESS.

### Langkah 3: Flash ke ESP32

Pastikan ESP32 sudah terhubung via kabel USB.

\\\
python -m platformio run -e esp32 --target upload
\\\

Board akan restart otomatis setelah flashing.

### Langkah 4: Hubungkan dan Akses

1. Hubungkan ke WiFi: WiFiShield
2. Masukkan password: 12345678
3. Buka browser dan ke: http://192.168.4.1/admin
4. Lihat kredensial tertangkap di tab Passwords

### Testing

1. Kunjungi halaman login: http://192.168.4.1/login.html
2. Masukkan username dan password apapun
3. Klik submit
4. Cek admin panel untuk melihat kredensial tertangkap

### Troubleshooting

Jika build gagal:
\\\
python -m platformio system prune -f
python -m platformio run -e esp32
\\\

Jika upload gagal:
- Cek koneksi kabel USB
- Verifikasi COM port: python -m platformio device list
- Coba tekan tombol RESET di board

Jika tidak bisa akses 192.168.4.1:
- Pastikan terhubung ke network WiFiShield
- Cek password WiFi benar
- Reset board

---

For more information, see README.md
Untuk informasi lebih lanjut, lihat README.md