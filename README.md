# WiFiShield

**ESP32 WiFi Penetration Testing Framework | Educational & Research Purpose**

![License](https://img.shields.io/badge/License-MIT-green)
![ESP32](https://img.shields.io/badge/ESP32-Microcontroller-blue)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

---

##  Languages | Bahasa

- [English (US)](#english)
- [Bahasa Indonesia](#bahasa-indonesia)

---

## <a id="english"></a>English

### Overview

WiFiShield is a comprehensive framework for ESP32 microcontroller designed for WiFi security research and penetration testing. It enables Evil Twin attacks, credential capture, and captive portal simulation for authorized security testing.

>  **DISCLAIMER**: Use only on networks you own or have explicit permission to test. Unauthorized network penetration is illegal.

### Features

- Evil Twin Attack (Rogue Access Point)
- Captive Portal Simulation
- WiFi Credential Capture (username/password)
- Aircrack Handshake Analysis (WPA/WPA2)
- Advanced Deauthentication Techniques
- Web Admin Interface
- Real-time Credential Logging
- Compact & Portable (ESP32)

### Quick Start

\\\ash
git clone https://github.com/Harriiee/wifishield.git
cd wifishield
python -m platformio run -e esp32
python -m platformio run -e esp32 --target upload
\\\

Then connect to WiFi \WiFiShield\ (pass: \12345678\) and access \http://192.168.4.1/admin\

See **QUICK_START.md** for detailed setup guide.

### Project Structure

\\\
 src/              Source code (C)
 include/          Header files
 lib/              Libraries
 platformio.ini    Build configuration
 QUICK_START.md    Setup guide
 README.md         Documentation
 LICENSE           MIT License
\\\

### License

MIT License - Free to use, modify, and distribute.

---

## <a id="bahasa-indonesia"></a>Bahasa Indonesia

### Ringkasan

WiFiShield adalah framework komprehensif untuk mikrokontroler ESP32 yang dirancang untuk penelitian keamanan WiFi dan penetration testing. Tool ini memungkinkan Evil Twin attacks, credential capture, dan simulasi captive portal untuk security testing yang diizinkan.

>  **DISCLAIMER**: Gunakan hanya pada network Anda sendiri atau dengan izin eksplisit. Penetration network tanpa izin adalah ILEGAL.

### Fitur

- Evil Twin Attack (Rogue Access Point)
- Simulasi Captive Portal
- Tangkap Kredensial WiFi (username/password)
- Analisis Handshake Aircrack (WPA/WPA2)
- Teknik Deauthentication Lanjutan
- Web Admin Interface
- Logging Kredensial Real-time
- Kompak & Portable (ESP32)

### Memulai Cepat

\\\ash
git clone https://github.com/Harriiee/wifishield.git
cd wifishield
python -m platformio run -e esp32
python -m platformio run -e esp32 --target upload
\\\

Kemudian connect ke WiFi \WiFiShield\ (pass: \12345678\) dan akses \http://192.168.4.1/admin\

Lihat **QUICK_START.md** untuk panduan setup lengkap.

### Struktur Proyek

\\\
 src/              Kode source (C)
 include/          File header
 lib/              Library eksternal
 platformio.ini    Konfigurasi build
 QUICK_START.md    Panduan setup
 README.md         Dokumentasi
 LICENSE           MIT License
\\\

### Lisensi

MIT License - Bebas digunakan, dimodifikasi, dan didistribusikan.

---

## Support

For issues or questions, open an issue on GitHub repository.

Untuk pertanyaan atau masalah, buka issue di repository GitHub.

---

**Repository**: https://github.com/Harriiee/wifishield  
**License**: MIT  
**Last Updated**: January 2026
