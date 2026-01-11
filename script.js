// LCP Sekolahan Login Page - JavaScript

(function() {
    'use strict';
    
    // Configuration
    const config = {
        loginEndpoint: '/login',
        redirectUrl: '/dashboard',
        redirectDelay: 1500,
        maxAttempts: 5,
        lockoutTime: 300000 // 5 minutes
    };
    
    // DOM Elements
    const form = document.getElementById('loginForm');
    const usernameInput = document.getElementById('username');
    const passwordInput = document.getElementById('password');
    const loginBtn = document.querySelector('.login-btn');
    const errorMsg = document.getElementById('errorMsg');
    const successMsg = document.getElementById('successMsg');
    
    // State
    let loginAttempts = parseInt(localStorage.getItem('loginAttempts') || '0');
    let lastAttemptTime = parseInt(localStorage.getItem('lastAttemptTime') || '0');
    
    // Initialize
    document.addEventListener('DOMContentLoaded', function() {
        checkAccountLockout();
        setupEventListeners();
    });
    
    // Setup event listeners
    function setupEventListeners() {
        form.addEventListener('submit', handleLogin);
        
        // Clear errors on input
        usernameInput.addEventListener('focus', clearErrors);
        passwordInput.addEventListener('focus', clearErrors);
        
        // Enter key in password field
        passwordInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                form.dispatchEvent(new Event('submit'));
            }
        });
    }
    
    // Check if account is locked
    function checkAccountLockout() {
        const now = Date.now();
        
        if (loginAttempts >= config.maxAttempts) {
            if (now - lastAttemptTime < config.lockoutTime) {
                // Still locked
                const remainingTime = Math.ceil((config.lockoutTime - (now - lastAttemptTime)) / 1000);
                showError(`Terlalu banyak percobaan. Coba lagi dalam ${remainingTime} detik.`);
                disableForm();
                
                // Setup auto-unlock timer
                setTimeout(() => {
                    resetLoginAttempts();
                    enableForm();
                    clearErrors();
                }, config.lockoutTime - (now - lastAttemptTime));
                
                return true;
            } else {
                // Unlock
                resetLoginAttempts();
                enableForm();
            }
        }
        
        return false;
    }
    
    // Handle login
    async function handleLogin(event) {
        event.preventDefault();
        
        // Validation
        if (!validateForm()) {
            return;
        }
        
        // Check lockout
        if (checkAccountLockout()) {
            return;
        }
        
        // Get form data
        const username = usernameInput.value.trim();
        const password = passwordInput.value;
        
        // Show loading state
        setButtonLoading(true);
        clearErrors();
        
        try {
            // Send login request
            const response = await fetch(config.loginEndpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: new URLSearchParams({
                    username: username,
                    password: password
                }),
                credentials: 'same-origin'
            });
            
            const data = await response.json();
            
            if (data.success) {
                // Login successful
                showSuccess(data.message || 'Login berhasil! Mohon tunggu...');
                resetLoginAttempts();
                
                // Redirect after delay
                setTimeout(() => {
                    window.location.href = config.redirectUrl;
                }, config.redirectDelay);
                
            } else {
                // Login failed
                showError(data.message || 'Username atau password salah.');
                incrementLoginAttempts();
                
                // Clear password field
                passwordInput.value = '';
                passwordInput.focus();
            }
            
        } catch (error) {
            console.error('Login error:', error);
            showError('Terjadi kesalahan. Silakan coba lagi.');
            setButtonLoading(false);
        }
    }
    
    // Validate form
    function validateForm() {
        const username = usernameInput.value.trim();
        const password = passwordInput.value;
        
        if (!username) {
            showError('Username tidak boleh kosong.');
            usernameInput.focus();
            return false;
        }
        
        if (!password) {
            showError('Password tidak boleh kosong.');
            passwordInput.focus();
            return false;
        }
        
        if (username.length < 3) {
            showError('Username minimal 3 karakter.');
            usernameInput.focus();
            return false;
        }
        
        if (password.length < 6) {
            showError('Password minimal 6 karakter.');
            passwordInput.focus();
            return false;
        }
        
        return true;
    }
    
    // Show error message
    function showError(message) {
        clearErrors();
        errorMsg.textContent = message;
        errorMsg.style.display = 'block';
        setButtonLoading(false);
    }
    
    // Show success message
    function showSuccess(message) {
        clearErrors();
        successMsg.textContent = message;
        successMsg.style.display = 'block';
    }
    
    // Clear error messages
    function clearErrors() {
        errorMsg.style.display = 'none';
        successMsg.style.display = 'none';
        errorMsg.textContent = '';
        successMsg.textContent = '';
    }
    
    // Disable form
    function disableForm() {
        usernameInput.disabled = true;
        passwordInput.disabled = true;
        loginBtn.disabled = true;
    }
    
    // Enable form
    function enableForm() {
        usernameInput.disabled = false;
        passwordInput.disabled = false;
        loginBtn.disabled = false;
    }
    
    // Set button loading state
    function setButtonLoading(isLoading) {
        if (isLoading) {
            loginBtn.classList.add('loading');
            loginBtn.disabled = true;
            usernameInput.disabled = true;
            passwordInput.disabled = true;
        } else {
            loginBtn.classList.remove('loading');
            loginBtn.disabled = false;
            usernameInput.disabled = false;
            passwordInput.disabled = false;
        }
    }
    
    // Increment login attempts
    function incrementLoginAttempts() {
        loginAttempts++;
        const now = Date.now();
        localStorage.setItem('loginAttempts', loginAttempts.toString());
        localStorage.setItem('lastAttemptTime', now.toString());
        
        if (loginAttempts >= config.maxAttempts) {
            disableForm();
            showError('Terlalu banyak percobaan. Akun terkunci selama 5 menit.');
        }
    }
    
    // Reset login attempts
    function resetLoginAttempts() {
        loginAttempts = 0;
        localStorage.removeItem('loginAttempts');
        localStorage.removeItem('lastAttemptTime');
    }
    
    // Focus on first input on page load
    window.addEventListener('load', function() {
        if (!usernameInput.disabled) {
            usernameInput.focus();
        }
    });
    
})();
