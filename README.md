# WiFiShield

ESP32 WiFi Penetration Testing Framework for security research and authorized testing.

![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-ESP32-blue)

---

## Documentation

- English - Scroll down to English section
- Bahasa Indonesia - Scroll down to Bahasa Indonesia section

---

## English

### About WiFiShield

WiFiShield is a security testing framework for ESP32 that enables authorized WiFi network testing.

### Features

- Evil Twin Attack (Rogue Access Point)
- Credential Capture (username/password)
- Captive Portal (custom redirect pages)
- Aircrack Integration (WPA/WPA2 analysis)
- Deauthentication (advanced techniques)
- Web Admin Interface (easy management)

### Installation

1. Clone repository
   \\\
   git clone https://github.com/Harriiee/wifishield.git
   cd wifishield
   \\\

2. Build firmware
   \\\
   python -m platformio run -e esp32
   \\\

3. Flash to ESP32
   \\\
   python -m platformio run -e esp32 --target upload
   \\\

4. Access admin panel
   - WiFi: WiFiShield
   - Password: 12345678
   - Address: http://192.168.4.1/admin

### Requirements

- ESP32 Board
- USB Cable
- Python 3.8 or higher
- PlatformIO

### License

MIT License - Free to use and modify

---

## Bahasa Indonesia

### Tentang WiFiShield

WiFiShield adalah framework testing keamanan untuk ESP32 yang memungkinkan testing network WiFi yang sah.

### Fitur

- Evil Twin Attack (Fake Access Point)
- Tangkap Kredensial (username/password)
- Captive Portal (custom redirect pages)
- Aircrack Integration (analisis WPA/WPA2)
- Deauthentication (teknik lanjutan)
- Web Admin Interface (manajemen mudah)

### Instalasi

1. Clone repository
   \\\
   git clone https://github.com/Harriiee/wifishield.git
   cd wifishield
   \\\

2. Build firmware
   \\\
   python -m platformio run -e esp32
   \\\

3. Flash ke ESP32
   \\\
   python -m platformio run -e esp32 --target upload
   \\\

4. Akses admin panel
   - WiFi: WiFiShield
   - Password: 12345678
   - Alamat: http://192.168.4.1/admin

### Persyaratan

- Board ESP32
- Kabel USB
- Python 3.8 atau lebih tinggi
- PlatformIO

### Lisensi

MIT License - Bebas digunakan dan dimodifikasi

---

Repository: https://github.com/Harriiee/wifishield