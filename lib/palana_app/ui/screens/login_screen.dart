import 'package:flutter/material.dart';
import 'package:palana/palana_app/ui/widgets/Bottom_navigator.dart';

enum AuthType { email, phone }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthType selectedAuth = AuthType.email;

  static const forgotColor = Color(0xFFDF20DF);
  static const gradientStart = Color(0xFFE830AB);
  static const gradientEnd = Color(0xFF8022C3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ IMPORTANT
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/palana_app/assets/container.png', height: 120),

              const SizedBox(height: 16),

              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Tune your mind, find your peace'),
              const SizedBox(height: 24),

              /// 🔘 EMAIL | PHONE TOGGLE
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _authToggle('Email', AuthType.email),
                    _authToggle('Phone', AuthType.phone),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// ✨ ANIMATED INPUT SWITCH
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: selectedAuth == AuthType.email
                    ? _emailFields()
                    : _phoneFields(),
              ),

              const SizedBox(height: 24),

              /// 🌈 SIGN IN BUTTON
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => const MainNavigationScreen(),
  ),
);

                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [gradientStart, gradientEnd],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'or continue with',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 16),

              /// GOOGLE BUTTON
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.g_mobiledata_rounded,
                  color: Colors.black,
                  size: 32,
                ),
                label: const Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF9C27B0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔘 TOGGLE BUTTON
  Widget _authToggle(String text, AuthType type) {
    final isSelected = selectedAuth == type;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedAuth = type);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(colors: [gradientStart, gradientEnd])
                : null,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 📧 EMAIL FIELDS
  Widget _emailFields() {
    return Column(
      key: const ValueKey('email'),
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter email',
            prefixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 8),
        _forgotPassword(),
      ],
    );
  }

  /// 📱 PHONE FIELDS (NO SPACING ISSUE)
  Widget _phoneFields() {
    return Column(
      key: const ValueKey('phone'),
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Enter phone number',
            prefixIcon: const Icon(Icons.phone_android),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 8),
        _forgotPassword(),
      ],
    );
  }

  /// ❓ FORGOT PASSWORD
  Widget _forgotPassword() {
    return GestureDetector(
      onTap: () {},
      child: const Text(
        'Forgot password?',
        style: TextStyle(color: forgotColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
