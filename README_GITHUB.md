# 📚 LCP Sekolahan - Login Page

Template login modern untuk sistem sekolah dengan desain responsif dan interaktif.

## 🎨 Fitur

✅ **Desain Modern**
- Background light (netral)
- White card dengan shadow subtle
- Logo placeholder di tengah atas
- Responsif untuk mobile dan desktop

✅ **Form Login**
- Username/Email input
- Password input
- Error validation
- Success message
- Loading state

✅ **Styling**
- Button cyan/turquoise dengan gradient
- Focus animation pada input
- Smooth transitions
- Mobile-optimized

✅ **Security Ready**
- Form submission ke `/login` endpoint
- POST request dengan CSRF protection
- Password field (tidak visible)
- Client-side validation

## 📱 Preview

Buka `index.html` langsung di browser untuk melihat tampilan login.

## 🚀 Instalasi

### Option 1: Deploy Langsung
```bash
# Copy file ke web server Anda
cp index.html /path/to/your/webroot/
```

### Option 2: Integrate ke Backend
```bash
# Copy index.html ke template folder
cp index.html /path/to/your/app/templates/
```

### Option 3: Customize & Deploy
1. Edit `index.html` sesuai kebutuhan
2. Ganti logo placeholder
3. Update form action URL
4. Deploy ke server

## 🎨 Customization

### Ubah Logo
```html
<!-- Ganti placeholder dengan image tag -->
<div class="logo-container">
    <img src="path/to/logo.png" alt="Logo Sekolah" class="logo-img">
</div>
```

### Ubah Warna Button
```css
/* Cyan/Turquoise (Default) */
background: linear-gradient(135deg, #20b2aa 0%, #48d1cc 100%);

/* Blue */
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);

/* Green */
background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);

/* Orange */
background: linear-gradient(135deg, #ff9a56 0%, #ff6a88 100%);
```

### Ubah Background
```css
/* Light Gray (Default) */
background: #f5f5f5;

/* White */
background: #ffffff;

/* Light Blue */
background: #e8f4f8;
```

### Ubah Text
- Judul: `<h1>Login Sekolahan</h1>`
- Subtitle: `<p class="subtitle">Masukkan kredensial Anda</p>`
- Label: `<label for="username">Username</label>`
- Button: `<button>Login</button>`
- Copyright: `<div class="copyright">Copyright © 2024 Sekolahan</div>`

## 📝 Form Handling

### Client-Side (JavaScript)
Form akan mengirim POST request ke `/login` dengan data:
```json
{
  "username": "value",
  "password": "value"
}
```

### Server-Side Response
Harus return JSON:
```json
{
  "success": true,
  "message": "Login berhasil"
}
```

atau jika gagal:
```json
{
  "success": false,
  "message": "Username atau password salah"
}
```

## 🔧 Backend Integration

### Python Flask
```python
from flask import Flask, request, render_template, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def login_page():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    
    # Validate credentials
    user = authenticate(username, password)
    
    if user:
        # Create session
        session['user_id'] = user.id
        return jsonify({'success': True, 'message': 'Login berhasil'})
    else:
        return jsonify({'success': False, 'message': 'Username atau password salah'})
```

### Node.js Express
```javascript
const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;
    
    // Validate credentials
    const user = authenticateUser(username, password);
    
    if (user) {
        req.session.userId = user.id;
        return res.json({ success: true, message: 'Login berhasil' });
    } else {
        return res.json({ success: false, message: 'Username atau password salah' });
    }
});
```

### PHP
```php
<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    
    // Validate credentials
    $user = authenticateUser($username, $password);
    
    if ($user) {
        $_SESSION['user_id'] = $user['id'];
        echo json_encode(['success' => true, 'message' => 'Login berhasil']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Username atau password salah']);
    }
}
?>
```

## 📱 Responsive Design

Template responsive untuk:
- ✅ Mobile (< 480px)
- ✅ Tablet (480px - 768px)
- ✅ Desktop (> 768px)

Test dengan membuka DevTools (F12) → Toggle device toolbar (Ctrl+Shift+M)

## 🐛 Testing

### Test Validasi
1. Klik LOGIN tanpa input
2. Lihat pesan error "Username dan password harus diisi"

### Test Submit
1. Input username dan password
2. Klik LOGIN
3. Akan error karena `/login` endpoint tidak ada (setup backend dulu)

### Test Mobile
1. Buka index.html
2. F12 → Toggle device toolbar
3. Coba berbagai screen sizes

## 📦 File Structure

```
LCP-Sekolahan/
├── index.html          ← Main login page
├── README.md           ← This file
├── LICENSE             ← MIT License
└── assets/
    └── logo.png        ← Your school logo (optional)
```

## 📄 License

MIT License - Bebas digunakan untuk keperluan apapun

## 👥 Author

Created for LCP Sekolahan Project

## 🔗 Links

- Original WifiShield: https://github.com/Harriiee/wifishield
- This Repository: https://github.com/Harriiee/LCP-Sekolahan

## 💡 Tips

1. **Gunakan HTTPS** - Jangan pakai HTTP untuk production
2. **Hash Password** - Jangan simpan password plain text
3. **CSRF Protection** - Tambah CSRF token ke form
4. **Rate Limiting** - Limit login attempts
5. **Logging** - Log semua login attempts

## 🆘 Troubleshooting

### Form tidak submit?
- Buka F12 > Console, lihat error message
- Check apakah `/login` endpoint tersedia
- Pastikan backend mengembalikan JSON response

### Styling tidak benar?
- Hard refresh (Ctrl+Shift+R)
- Clear browser cache
- Check browser compatibility

### Logo tidak muncul?
- Pastikan path image benar (relative atau absolute)
- Gunakan format PNG/JPG/SVG
- Cek ukuran file (jangan terlalu besar)

## 📞 Support

Buat issue di GitHub atau hubungi developer

---

**Happy coding! 🚀**

Last Updated: January 2026
Version: 1.0
