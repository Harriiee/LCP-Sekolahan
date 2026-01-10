# WiFiShield

**ESP32 WiFi Penetration Testing Framework**

Comprehensive security research tool for WiFi network testing with Evil Twin attacks, credential capture, and captive portal simulation.

![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-ESP32-blue)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

---

##  Documentation

- **[English](#english)** - Setup & usage guide in English
- **[Bahasa Indonesia](#bahasa-indonesia)** - Panduan setup dalam Bahasa Indonesia

---

## <a id="english"></a>English Version

### What is WiFiShield?

WiFiShield is a framework designed for security researchers and penetration testers to perform authorized WiFi security testing on ESP32 microcontrollers.

**Use Cases:**
- Test network security on your own networks
- Research WiFi attack vectors
- Educational security training
- Authorized penetration testing

### Key Features

| Feature | Description |
|---------|-------------|
| Evil Twin | Create fake WiFi networks |
| Credential Capture | Capture login credentials |
| Captive Portal | Redirect users to custom pages |
| Aircrack | Analyze WPA/WPA2 handshakes |
| Deauthentication | Advanced WiFi disconnect techniques |
| Web Admin | Easy management interface |

### Quick Start

1. **Clone Repository**
   \\\ash
   git clone https://github.com/Harriiee/wifishield.git
   cd wifishield
   \\\

2. **Build Firmware**
   \\\ash
   python -m platformio run -e esp32
   \\\

3. **Flash to ESP32**
   \\\ash
   python -m platformio run -e esp32 --target upload
   \\\

4. **Connect & Access**
   - Connect to WiFi: \WiFiShield\
   - Password: \12345678\
   - Open: \http://192.168.4.1/admin\

**See QUICK_START.md for detailed setup.**

### Requirements

- ESP32 Development Board
- USB Cable
- Python 3.8+
- PlatformIO

### Project Structure

\\\
wifishield/
 src/              Source code (C)
 include/          Header files
 lib/              External libraries
 platformio.ini    Build configuration
 QUICK_START.md    Setup guide
 README.md         This file
 LICENSE           MIT License
 .git/             Version control
\\\

### Disclaimer

 **IMPORTANT:** Use WiFiShield only on networks you own or have explicit permission to test. Unauthorized network testing is illegal.

---

## <a id="bahasa-indonesia"></a>Versi Bahasa Indonesia

### Apa itu WiFiShield?

WiFiShield adalah framework untuk peneliti keamanan dan penetration tester guna melakukan pengujian keamanan WiFi yang sah pada mikrokontroler ESP32.

**Kegunaan:**
- Test keamanan network pribadi
- Riset vektor serangan WiFi
- Pelatihan keamanan edukatif
- Penetration testing yang diizinkan

### Fitur Utama

| Fitur | Deskripsi |
|-------|-----------|
| Evil Twin | Buat network WiFi palsu |
| Tangkap Kredensial | Tangkap login credentials |
| Captive Portal | Redirect user ke halaman custom |
| Aircrack | Analisis handshake WPA/WPA2 |
| Deauthentication | Teknik disconnect WiFi lanjutan |
| Web Admin | Interface manajemen mudah |

### Memulai Cepat

1. **Clone Repository**
   \\\ash
   git clone https://github.com/Harriiee/wifishield.git
   cd wifishield
   \\\

2. **Build Firmware**
   \\\ash
   python -m platformio run -e esp32
   \\\

3. **Flash ke ESP32**
   \\\ash
   python -m platformio run -e esp32 --target upload
   \\\

4. **Hubungkan & Akses**
   - Hubungkan WiFi: \WiFiShield\
   - Password: \12345678\
   - Buka: \http://192.168.4.1/admin\

**Lihat QUICK_START.md untuk panduan detail.**

### Persyaratan

- ESP32 Development Board
- Kabel USB
- Python 3.8+
- PlatformIO

### Struktur Proyek

\\\
wifishield/
 src/              Kode sumber (C)
 include/          File header
 lib/              Library eksternal
 platformio.ini    Konfigurasi build
 QUICK_START.md    Panduan setup
 README.md         File ini
 LICENSE           MIT License
 .git/             Kontrol versi
\\\

### Disclaimer

 **PENTING:** Gunakan WiFiShield hanya pada network yang Anda miliki atau dengan izin eksplisit. Testing network tanpa izin adalah ilegal.

---

## Downloads

Download pre-built binaries and source code from [Releases](https://github.com/Harriiee/wifishield/releases)

Unduh binary pre-built dan source code dari [Releases](https://github.com/Harriiee/wifishield/releases)

---

## License

MIT License - Free to use, modify, and distribute with attribution.

MIT License - Bebas digunakan, dimodifikasi, dan didistribusikan dengan atribusi.

---

## Repository

https://github.com/Harriiee/wifishield

**Last Updated:** January 2026
