# 📤 Upload ke GitHub - Panduan Lengkap

Sekarang project bisa langsung di-upload ke GitHub dengan script otomatis atau manual.

---

## ✅ CARA TERCEPAT (Recommended)

### **STEP 1: Install Git**

Jika belum punya Git, download dari: https://git-scm.com/downloads

Untuk Windows:
1. Download installer dari https://git-scm.com/downloads
2. Jalankan installer (next-next-finish)
3. Buka PowerShell baru dan test: `git --version`

### **STEP 2: Create Repository di GitHub.com**

1. Go to: https://github.com/new
2. Isi informasi:
   - **Repository name**: `WifiPisseryakntl` (atau nama lain)
   - **Description**: WiFi phishing toolkit for ESP32 - Cloned login page credentials capture
   - **Visibility**: Public (jika mau public) atau Private (jika private)
   - **Uncheck**: "Initialize this repository with:" (jangan pilih README/gitignore)
3. Klik **Create repository**

**Catat URL yang muncul**, misalnya: `https://github.com/YOUR_USERNAME/WifiPisseryakntl.git`

### **STEP 3: Run Script Otomatis**

Di PowerShell, masuk ke folder project dan jalankan:

```powershell
cd "c:\Users\hari\Downloads\WifiPisseryakntl-20260110T111649Z-3-001\WifiPisseryakntl"

# Jalankan script dengan username GitHub Anda
.\upload_to_github.ps1 -GitHubUsername "YOUR_USERNAME" -RepositoryName "WifiPisseryakntl"
```

Contoh:
```powershell
.\upload_to_github.ps1 -GitHubUsername "namasayakonto" -RepositoryName "WifiPisseryakntl"
```

Script akan:
1. ✅ Check Git terinstall
2. ✅ Inisialisasi local Git repo
3. ✅ Configure Git user (nama & email)
4. ✅ Add semua files
5. ✅ Create commit
6. ✅ Add remote origin
7. ✅ Push ke GitHub

---

## 🔧 CARA MANUAL (Jika script tidak bekerja)

Jalankan command satu per satu di PowerShell:

```powershell
# 1. Masuk ke folder project
cd "c:\Users\hari\Downloads\WifiPisseryakntl-20260110T111649Z-3-001\WifiPisseryakntl"

# 2. Initialize Git
git init

# 3. Configure user (ganti dengan nama & email Anda)
git config user.name "Nama Anda"
git config user.email "email@example.com"

# 4. Add files
git add .

# 5. Create commit
git commit -m "Initial commit - WifiPisseryakntl with cloned login page"

# 6. Add remote (ganti URL sesuai repository Anda)
git remote add origin https://github.com/YOUR_USERNAME/WifiPisseryakntl.git

# 7. Rename branch ke main (optional, untuk GitHub default)
git branch -M main

# 8. Push ke GitHub
git push -u origin main
```

Saat push, Anda akan diminta untuk authenticate:
- **Username**: Username GitHub Anda
- **Password**: Personal Access Token (bukan password langsung)

---

## 🔑 Membuat Personal Access Token (Jika Push Gagal)

Jika mendapat error authentication saat push:

1. Go to: https://github.com/settings/tokens
2. Klik **Generate new token → Generate new token (classic)**
3. Isi:
   - **Note**: WifiPisseryakntl Upload
   - **Expiration**: 30 days (atau sesuai kebutuhan)
   - **Select scopes**: ☑️ repo
4. Klik **Generate token**
5. **Copy token yang generated** (hanya sekali muncul!)
6. Saat push diminta password, paste token ini

---

## ✔️ Verifikasi Upload Berhasil

Setelah push selesai, check di:
```
https://github.com/YOUR_USERNAME/WifiPisseryakntl
```

Anda akan lihat:
- ✅ Semua source files (`src/`, `include/`, `lib/`)
- ✅ Config files (`CMakeLists.txt`, `platformio.ini`)
- ✅ Documentation (`QUICK_START.md`, `SHARE_GUIDE.md`, `README.md`)
- ✅ Scripts (`build_and_flash.ps1`, `upload_to_github.ps1`)
- ✅ `.gitignore` (build artifacts tidak masuk)

---

## 🔄 Update Repository (Setelah perubahan)

Jika Anda ubah kode dan mau update ke GitHub:

```powershell
git add .
git commit -m "Update: Deskripsi perubahan"
git push
```

---

## 📋 Troubleshooting

### Error: "fatal: not a git repository"
```powershell
# Pastikan sudah di folder project
cd "c:\Users\hari\Downloads\WifiPisseryakntl-20260110T111649Z-3-001\WifiPisseryakntl"

# Initialize Git
git init
```

### Error: "remote origin already exists"
```powershell
# Remove remote lama
git remote remove origin

# Add remote baru
git remote add origin https://github.com/YOUR_USERNAME/WifiPisseryakntl.git
```

### Error: "Authentication failed"
```powershell
# Check remote URL
git remote -v

# Gunakan Personal Access Token (lihat section di atas)
```

### Error: "Everything up-to-date"
```powershell
# Berarti sudah push. Check: https://github.com/YOUR_USERNAME/WifiPisseryakntl
```

---

## 🎯 Selesai!

Sekarang project Anda ada di GitHub dan bisa:
- ✅ Dishare ke orang lain via GitHub link
- ✅ Diclone siapa saja dengan: `git clone https://github.com/YOUR_USERNAME/WifiPisseryakntl.git`
- ✅ Collaborative editing jika ada contributor
- ✅ Backup online permanent

**Enjoy! 🚀**
