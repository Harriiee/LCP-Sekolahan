# 📦 Cara Share & Backup Project

## 🎯 Pilihan Share

### **OPTION 1: ZIP File (Paling Simpel)**

Paling mudah dan compatible dengan semua orang. Ukuran final ~200-500MB.

#### Langkah-langkah:

1. **Buka PowerShell di folder project root** (`WifiPisseryakntl`)

2. **Jalankan command untuk compress:**

```powershell
# Compress ke ZIP, exclude build folder (biar kecil)
Compress-Archive -Path .\ -DestinationPath "WifiPisseryakntl.zip" -Force -Exclude ".\.pio", "\.git", "\.venv", "\build"
```

Atau jika Anda punya 7-Zip terinstall (lebih compressed):

```powershell
# Dengan 7-Zip (lebih kecil, ~150-250MB)
& "C:\Program Files\7-Zip\7z.exe" a -r "WifiPisseryakntl.7z" .\ -x!.pio -x!.venv -x!.git -x!build
```

3. **File hasil:**
   - `WifiPisseryakntl.zip` (~300-400MB)
   - atau `WifiPisseryakntl.7z` (~150-200MB)

4. **Share file ini ke orang lain:**
   - Upload ke Google Drive, Dropbox, GitHub Releases, atau cloud storage lain
   - Orang lain tinggal extract dan sudah siap pakai

---

### **OPTION 2: GitHub Repository (Recommended untuk Developer)**

Paling professional dan mudah untuk collaborate.

#### Langkah-langkah:

1. **Install Git (jika belum):**
   ```powershell
   # Check if Git installed
   git --version
   ```

2. **Initialize Git repo di folder project:**
   ```powershell
   cd "C:\Users\hari\Downloads\WifiPisseryakntl-20260110T111649Z-3-001\WifiPisseryakntl"
   git init
   ```

3. **Create `.gitignore` file** (to exclude large files):
   ```powershell
   $gitignore = @"
.pio/
.venv/
build/
*.o
*.a
.DS_Store
*.pyc
"@
   $gitignore | Out-File -Encoding UTF8 ".gitignore"
   ```

4. **Add dan commit files:**
   ```powershell
   git add .
   git commit -m "Initial commit - WiFi Clone Login Credentials Capture"
   ```

5. **Push ke GitHub:**
   ```powershell
   # Add remote (ganti dengan repo Anda)
   git remote add origin https://github.com/YOUR_USERNAME/WifiPisseryakntl.git
   
   # Push
   git branch -M main
   git push -u origin main
   ```

6. **Share GitHub link ke orang lain**

---

### **OPTION 3: RAR Archive (Jika Sudah Ada WinRAR)**

```powershell
# Jika WinRAR terinstall
& "C:\Program Files\WinRAR\RAR.exe" a -r "WifiPisseryakntl.rar" .\ -x.pio -x.venv -x.git -xbuild
```

---

## 📋 Checklist Sebelum Share

Sebelum share, pastikan ini sudah dilakukan:

```powershell
# 1. Check file penting ada
Get-Item "CMakeLists.txt", "platformio.ini", "QUICK_START.md", "build_and_flash.ps1"

# 2. Clean build artifacts (biar file kecil)
Remove-Item -Path ".\.pio", ".\build" -Recurse -Force -ErrorAction SilentlyContinue

# 3. Keep source code dan config
Get-ChildItem -Path ".\src", ".\include", ".\lib" -Recurse

# 4. Total size check
(Get-ChildItem -Path . -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB
```

---

## 📥 Penerima Cara Extract & Jalankan

Jika ada yang menerima file dari Anda, ini langkahnya:

### **Dari ZIP:**
```powershell
# 1. Extract
Expand-Archive -Path "WifiPisseryakntl.zip" -DestinationPath "WifiPisseryakntl"

# 2. Go to folder
cd WifiPisseryakntl

# 3. Setup environment
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install platformio

# 4. Build & Flash
.\build_and_flash.ps1 -Action both
```

### **Dari GitHub:**
```powershell
# 1. Clone
git clone https://github.com/YOUR_USERNAME/WifiPisseryakntl.git
cd WifiPisseryakntl

# 2. Setup & Build (sama seperti di atas)
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install platformio
.\build_and_flash.ps1 -Action both
```

---

## 💾 Apa Yang Harus Disimpan

**WAJIB SIMPAN:**
- ✅ `src/` - Source code C
- ✅ `include/` - Header files
- ✅ `lib/` - Libraries (libwifi, libpcap)
- ✅ `CMakeLists.txt` - Build config
- ✅ `platformio.ini` - PlatformIO config
- ✅ `partition.csv` - ESP32 partition table
- ✅ `sdkconfig.esp32*` - ESP32 config

**OPTIONAL (Biar Kecil):**
- ❌ `.pio/` - Build cache (auto-regenerate)
- ❌ `build/` - Build output (auto-regenerate)
- ❌ `.venv/` - Python venv (auto-create)
- ❌ `QUICK_START.md` - Documentation (bisa dibuat lagi)

**REKOMENDASIKAN SIMPAN:**
- ✅ `QUICK_START.md` - Setup guide
- ✅ `build_and_flash.ps1` - Helper script
- ✅ `.gitignore` - Git config

---

## 📊 Estimasi Ukuran File

| Format | Size | Waktu Kompresi |
|--------|------|-----------------|
| ZIP (dengan .pio) | ~400-500MB | 2-3 min |
| ZIP (tanpa .pio) | ~150-200MB | 1-2 min |
| 7Z (tanpa .pio) | ~80-120MB | 3-5 min |
| GitHub | ∞ (cloud) | - |

---

## 🎯 RECOMMENDED: GitHub + ZIP

1. **Push ke GitHub** (untuk source control)
2. **Buat ZIP tanpa .pio** (untuk share ke yang tidak developer)

---

**Ready to share? Coba Option 1 (ZIP) dulu, paling simpel! 📦**
