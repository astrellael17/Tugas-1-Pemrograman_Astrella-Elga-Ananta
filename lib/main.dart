import 'package:flutter/material.dart';

void main() {
  runApp(const EcoWalkApp());
}

// ======================================================
// WARNA UTAMA
// ======================================================

const Color ecoGreen = Color(0xFF176B5A);
const Color lightGreen = Color(0xFFDDEBE8);

// ======================================================
// APP
// ======================================================

class EcoWalkApp extends StatelessWidget {
  const EcoWalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoWalk',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: ecoGreen),
      ),
      home: const SplashPage(),
    );
  }
}

// ======================================================
// LOGO ECOWALK
// ======================================================

class EcoWalkLogo extends StatelessWidget {
  final bool white;
  final double width;

  const EcoWalkLogo({super.key, this.white = false, this.width = 180});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      white
          ? 'lib/images/logo_ecowalk_white.png'
          : 'lib/images/logo_ecowalk_green.png',
      width: width,
      fit: BoxFit.contain,
    );
  }
}

// ======================================================
// 1. SPLASH PAGE
// ======================================================

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ecoGreen,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EcoWalkLogo(white: true, width: 210),
              const SizedBox(height: 12),
              Text(
                '"Bandingkan, pilih, liburan tanpa ragu!"',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// 2. LOGIN PAGE
// ======================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 60),

              const Text(
                'MASUK',
                style: TextStyle(
                  color: ecoGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const EcoWalkLogo(width: 180),

              const SizedBox(height: 45),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Nama Pengguna', style: TextStyle(fontSize: 12)),
              ),

              const SizedBox(height: 5),

              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  hintText: 'Nama Pengguna',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Kata Sandi', style: TextStyle(fontSize: 12)),
              ),

              const SizedBox(height: 5),

              TextField(
                controller: passwordController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Kata Sandi',
                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Lupa Kata Sandi?',
                    style: TextStyle(color: Colors.cyan, fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ecoGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'MASUK',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Atau'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata, size: 30),
                  label: const Text(
                    'Lanjutkan dengan Google',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tidak punya akun?',
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Daftar disini',
                      style: TextStyle(color: Colors.cyan, fontSize: 12),
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
}

// ======================================================
// 3. REGISTER PAGE
// ======================================================

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agree = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  Widget buildField({
    required IconData icon,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }

  Widget buildPasswordField({
    required String hint,
    required bool hidden,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: hidden,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline),
          hintText: hint,
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(hidden ? Icons.visibility_off : Icons.visibility),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const Text(
                'BUAT AKUN',
                style: TextStyle(
                  fontSize: 17,
                  color: ecoGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const EcoWalkLogo(width: 180),

              const SizedBox(height: 35),

              buildField(icon: Icons.person_outline, hint: 'Nama Pengguna'),

              buildField(
                icon: Icons.email_outlined,
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),

              buildField(
                icon: Icons.phone_outlined,
                hint: 'Nomor Hp',
                keyboardType: TextInputType.phone,
              ),

              buildPasswordField(
                hint: 'Kata Sandi',
                hidden: hidePassword,
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),

              buildPasswordField(
                hint: 'Konfirmasi Kata Sandi',
                hidden: hideConfirmPassword,
                onPressed: () {
                  setState(() {
                    hideConfirmPassword = !hideConfirmPassword;
                  });
                },
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 13),
                      child: Text(
                        'Saya telah membaca dan menyetujui '
                        'Ketentuan dan Privasi pengguna',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ecoGreen,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerificationPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'BUAT AKUN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah punya akun?',
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Masuk'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// 4. VERIFICATION PAGE
// ======================================================

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool usingEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              color: lightGreen,
              child: const Center(child: EcoWalkLogo(width: 170)),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.check, color: ecoGreen),
                        SizedBox(width: 7),
                        Text(
                          'VERIFIKASI',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Text(
                      usingEmail
                          ? 'Periksa dan ketik kode verifikasi '
                                'yang telah dikirimkan ke Email Anda.'
                          : 'Periksa dan ketik kode verifikasi '
                                'yang telah dikirimkan ke nomor Hp Anda.',
                      style: const TextStyle(fontSize: 13),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width: 55,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: const InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                        setState(() {
                          usingEmail = !usingEmail;
                        });
                      },
                      child: Text(
                        usingEmail
                            ? 'Gunakan Nomor Hp'
                            : 'Verifikasi menggunakan Email',
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ecoGreen,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'KIRIM',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Kirim Ulang Kode'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// 5. LUPA KATA SANDI
// ======================================================

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool usingEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              color: lightGreen,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EcoWalkLogo(width: 170),
                    SizedBox(height: 5),
                    Text(
                      'LUPA KATA SANDI',
                      style: TextStyle(
                        color: ecoGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usingEmail
                          ? 'Periksa dan masukkan alamat Email '
                                'untuk mendapatkan kode verifikasi.'
                          : 'Periksa dan masukkan Nomor Hp '
                                'untuk mendapatkan kode verifikasi.',
                    ),

                    const SizedBox(height: 30),

                    Text(
                      usingEmail ? 'Alamat Email' : 'Nomor Hp',
                      style: const TextStyle(fontSize: 12),
                    ),

                    TextField(
                      keyboardType: usingEmail
                          ? TextInputType.emailAddress
                          : TextInputType.phone,
                    ),

                    const SizedBox(height: 10),

                    TextButton(
                      onPressed: () {
                        setState(() {
                          usingEmail = !usingEmail;
                        });
                      },
                      child: Text(
                        usingEmail ? 'Gunakan Nomor Hp' : 'Gunakan Email',
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ecoGreen,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPasswordPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'KIRIM',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// 6. UBAH KATA SANDI
// ======================================================

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              color: lightGreen,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EcoWalkLogo(width: 170),
                    SizedBox(height: 5),
                    Text(
                      'LUPA KATA SANDI',
                      style: TextStyle(
                        fontSize: 18,
                        color: ecoGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Masukkan Kata Sandi Baru',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 25),

                    TextField(
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: 'Kata Sandi Baru',
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      obscureText: hideConfirmPassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: 'Konfirmasi Kata Sandi',
                        suffixIcon: IconButton(
                          icon: Icon(
                            hideConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              hideConfirmPassword = !hideConfirmPassword;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ecoGreen,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'UBAH KATA SANDI',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// 7. PROFILE PAGE
// ======================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Widget profileMenu(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: 120, width: double.infinity, color: ecoGreen),

                Positioned(
                  bottom: -45,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'lib/images/profile.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 55),

            const Text(
              'Astrella Elga Ananta',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),

            const SizedBox(height: 5),

            const Text(
              'astrella.el17@gmail.com',
              style: TextStyle(color: ecoGreen),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView(
                children: [
                  profileMenu(Icons.settings_outlined, 'Pengaturan'),

                  profileMenu(Icons.edit_outlined, 'Edit Profil'),

                  profileMenu(Icons.lock_outline, 'Kebijakan Privasi'),

                  profileMenu(Icons.info_outline, 'Tentang Kami'),

                  profileMenu(Icons.description_outlined, 'Ketentuan Layanan'),

                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Keluar'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: ecoGreen,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_outlined),
            label: 'Safety',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
