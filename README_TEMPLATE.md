# LCP Sekolahan - School Login Portal Template

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Version](https://img.shields.io/badge/version-2.0.0-green.svg)
![Status](https://img.shields.io/badge/status-Production%20Ready-brightgreen.svg)

A modern, responsive, and easy-to-customize school login portal template built with pure HTML, CSS, and JavaScript. Perfect for educational institutions, training centers, and school management systems.

## ✨ Features

- **Modern Design**: Clean, minimal UI inspired by professional login portals
- **Fully Responsive**: Works seamlessly on mobile, tablet, and desktop
- **No Dependencies**: Pure HTML5, CSS3, and Vanilla JavaScript
- **Form Validation**: Client-side validation with helpful error messages
- **Security Features**: 
  - Account lockout after 5 failed attempts (5-minute timeout)
  - Password masking
  - Form input sanitization
- **Customizable**: Easy to customize colors, text, logo, and styling
- **Lightweight**: Only ~27 KB total (all files combined)
- **Production Ready**: Minified and optimized for deployment

## 📸 Preview

The login page features:
- Centered card layout with subtle shadow
- Logo placeholder (160×160px) - easy to replace with your school logo
- Username and password input fields
- Cyan/turquoise gradient button
- Error/warning/success messages
- Copyright footer

## 🚀 Quick Start

### 1. Clone or Download

```bash
git clone https://github.com/Harriiee/LCP-Sekolahan.git
cd LCP-Sekolahan
```

Or download as ZIP and extract.

### 2. View Locally

**Option A: Using Python (Recommended)**
```bash
python -m http.server 8000
# Open http://localhost:8000/index.html
```

**Option B: Using Node.js**
```bash
npx http-server
# Open http://localhost:8080
```

**Option C: Using PHP**
```bash
php -S localhost:8000
# Open http://localhost:8000/index.html
```

### 3. Deploy to Your Server

1. Copy these files to your web server:
   - `index.html`
   - `style.css`
   - `script.js`

2. Update the backend endpoint in `script.js`:
   ```javascript
   const config = {
       loginEndpoint: '/api/login',  // Change this to your endpoint
       maxAttempts: 5,
       lockoutTime: 300000, // 5 minutes
   };
   ```

3. Implement the `/login` POST endpoint on your backend

## 🎨 Customization

### Change Logo

Edit `index.html` and replace the logo placeholder:

```html
<!-- Find this section: -->
<div class="logo-container">
    <div class="logo-placeholder">Ganti dengan Logo Sekolah Anda</div>
</div>

<!-- Replace with your logo: -->
<div class="logo-container">
    <img src="path/to/your/logo.png" alt="School Logo">
</div>
```

### Change Colors

Edit `style.css` and modify the color variables:

```css
/* Button gradient - change these hex colors */
.login-btn {
    background: linear-gradient(135deg, #20b2aa 0%, #48d1cc 100%);
    /* Change to your colors */
}

/* Background color */
body {
    background: linear-gradient(135deg, #e8e8e8 0%, #f5f5f5 100%);
    /* Change to your colors */
}
```

### Change Text

Edit `index.html` to change:
- Placeholder text: `placeholder="Username"` and `placeholder="Password"`
- Button text: `LOGIN` button label
- Copyright: `© 2024 Sekolahan. All Rights Reserved.`

### Validation Rules

Edit `script.js` config object:

```javascript
const config = {
    loginEndpoint: '/login',
    maxAttempts: 5,           // Number of attempts before lockout
    lockoutTime: 300000,      // Lockout duration in milliseconds (5 min)
    minUsernameLength: 3,     // Minimum username characters
    minPasswordLength: 6      // Minimum password characters
};
```

## 🔧 Backend Integration

### Expected POST Request

The form sends a JSON POST request to your endpoint:

```javascript
POST /login
Content-Type: application/json

{
    "username": "user123",
    "password": "password123"
}
```

### Expected Response Format

Your backend should respond with JSON:

**Success:**
```json
{
    "success": true,
    "message": "Login berhasil!"
}
```

**Failure:**
```json
{
    "success": false,
    "message": "Username atau password salah"
}
```

### Backend Examples

#### Python (Flask)
```python
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/login', methods=['POST'])
def login():
    data = request.json
    username = data.get('username')
    password = data.get('password')
    
    # Verify credentials here
    if verify_credentials(username, password):
        return jsonify({'success': True, 'message': 'Login berhasil!'})
    else:
        return jsonify({'success': False, 'message': 'Username atau password salah'})

def verify_credentials(username, password):
    # Your verification logic here
    return True  # Placeholder

if __name__ == '__main__':
    app.run(debug=True)
```

#### Node.js (Express)
```javascript
const express = require('express');
const app = express();

app.use(express.json());

app.post('/login', (req, res) => {
    const { username, password } = req.body;
    
    // Verify credentials here
    if (verifyCredentials(username, password)) {
        return res.json({ 
            success: true, 
            message: 'Login berhasil!' 
        });
    } else {
        return res.json({ 
            success: false, 
            message: 'Username atau password salah' 
        });
    }
});

function verifyCredentials(username, password) {
    // Your verification logic here
    return true; // Placeholder
}

app.listen(3000, () => console.log('Server running on port 3000'));
```

#### PHP
```php
<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $username = $input['username'] ?? '';
    $password = $input['password'] ?? '';
    
    // Verify credentials here
    if (verifyCredentials($username, $password)) {
        echo json_encode([
            'success' => true,
            'message' => 'Login berhasil!'
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Username atau password salah'
        ]);
    }
}

function verifyCredentials($username, $password) {
    // Your verification logic here
    return true; // Placeholder
}
?>
```

## 📱 Responsive Breakpoints

The template is optimized for:
- **Desktop**: 1024px and above
- **Tablet**: 768px to 1023px
- **Mobile**: Below 768px
- **Small Mobile**: Below 480px
- **Extra Small**: Below 360px

## 🔒 Security Features

1. **Client-Side Validation**
   - Username minimum 3 characters
   - Password minimum 6 characters
   - Real-time validation feedback

2. **Account Lockout**
   - Automatic 5-minute lockout after 5 failed attempts
   - Uses browser localStorage for attempt tracking
   - Countdown timer shown to user

3. **Input Sanitization**
   - Passwords are masked during input
   - Form data sent via secure JSON POST

## 📦 File Structure

```
LCP-Sekolahan/
├── index.html          # Main HTML file
├── style.css           # Stylesheet
├── script.js           # JavaScript logic
├── README.md           # This file
├── LICENSE             # MIT License
├── CONTRIBUTING.md     # Contribution guidelines
├── .gitignore         # Git ignore file
└── README_GITHUB.md    # GitHub setup guide
```

## 🌐 Deployment

### Deploy to Netlify
1. Push code to GitHub
2. Connect repository to Netlify
3. Deploy (automatic builds)

### Deploy to Vercel
1. Push code to GitHub
2. Import project in Vercel
3. Deploy (automatic)

### Deploy to Your Own Server
1. SSH into your server
2. Clone or copy files to web root
3. Configure your backend endpoint in `script.js`
4. Ensure `/login` endpoint is accessible
5. Test the form

## 🐛 Troubleshooting

**Q: Login button doesn't work**
- Check browser console (F12) for errors
- Ensure `/login` endpoint is accessible
- Verify backend is running
- Check CORS settings if backend is on different domain

**Q: Form keeps showing locked message**
- Open DevTools → Application → Local Storage
- Clear `loginAttempts` entry
- Or wait 5 minutes for lockout to expire

**Q: Logo not showing**
- Ensure logo image path is correct
- Check image file exists
- Verify image dimensions (160×160px recommended)

**Q: Styling looks broken**
- Hard refresh browser (Ctrl+Shift+R on Windows, Cmd+Shift+R on Mac)
- Clear browser cache
- Check browser console for CSS errors

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 💡 Tips

- Customize the logo for your school
- Add your school name to the copyright
- Test the form with your backend before deployment
- Consider adding 2FA or email verification for security
- Monitor failed login attempts for security issues

## 📧 Support

For issues, questions, or suggestions:
1. Open an issue on GitHub
2. Check existing issues for solutions
3. Provide detailed error messages and browser info

## 🎓 Educational Use

This template is designed for schools and educational institutions. Feel free to:
- Use it for your school portal
- Customize it for your needs
- Share it with other institutions
- Contribute improvements back to the project

---

**Made with ❤️ for educators and students**

Version 2.0.0 | Last Updated: January 2024
