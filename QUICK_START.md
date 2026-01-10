# WiFiShield - Quick Start

Setup & Run WiFiShield on ESP32 for credential capture.

---

## English

### Prerequisites

- ESP32 Development Board
- USB Cable
- Python 3.8+ with PlatformIO

### Step 1: Build Firmware

\\\ash
python -m platformio run -e esp32
\\\

Wait for \[SUCCESS]\ message.

### Step 2: Flash to ESP32

Make sure ESP32 is connected via USB:

\\\ash
python -m platformio run -e esp32 --target upload
\\\

Board will restart automatically.

### Step 3: Connect & Access

1. Connect to WiFi: \WiFiShield\ (password: \12345678\)

2. Open browser:
   \\\
   http://192.168.4.1/admin
   \\\

3. View captured credentials in "Passwords" tab

### Testing

1. Visit: \http://192.168.4.1/login.html\
2. Fill form (example: user123 / pass456)
3. Submit
4. Check admin page for captured credentials 

### Troubleshooting

| Error | Solution |
|-------|----------|
| Build fails | \pio system prune -f\ then rebuild |
| Upload error | Check port: \pio device list\ |
| 192.168.4.1 timeout | Ensure WiFi connection |
| WiFi not visible | Reset board (press RESET button) |

---

## Bahasa Indonesia

### Prasyarat

- ESP32 Development Board
- Kabel USB
- Python 3.8+ dengan PlatformIO

### Langkah 1: Build Firmware

\\\ash
python -m platformio run -e esp32
\\\

Tunggu hingga muncul pesan \[SUCCESS]\.

### Langkah 2: Flash ke ESP32

Pastikan ESP32 sudah terhubung via USB:

\\\ash
python -m platformio run -e esp32 --target upload
\\\

Board akan restart otomatis.

### Langkah 3: Connect & Akses

1. Hubungkan ke WiFi: \WiFiShield\ (password: \12345678\)

2. Buka browser:
   \\\
   http://192.168.4.1/admin
   \\\

3. Lihat kredensial tertangkap di tab "Passwords"

### Testing

1. Kunjungi: \http://192.168.4.1/login.html\
2. Isi form (contoh: user123 / pass456)
3. Submit
4. Cek halaman admin untuk melihat kredensial tertangkap 

### Troubleshooting

| Error | Solusi |
|-------|--------|
| Build gagal | \pio system prune -f\ lalu rebuild |
| Error upload | Cek port: \pio device list\ |
| 192.168.4.1 timeout | Pastikan terhubung ke WiFi |
| WiFi tidak terlihat | Reset board (tekan tombol RESET) |

---

## File Structure

\\\
 src/              Source code
 include/          Headers
 platformio.ini    Build config
 QUICK_START.md    Guide (this file)
 README.md         Full documentation
 LICENSE           MIT License
\\\

---

For full documentation, see **README.md**

Untuk dokumentasi lengkap, lihat **README.md**
