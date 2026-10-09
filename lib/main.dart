import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const EcoWalkApp());
}

// ======================================================
// WARNA
// ======================================================

const Color ecoGreen = Color(0xFF176B5A);
const Color lightGreen = Color(0xFFDDEBE8);
const Color linkBlue = Color(0xFF29B6E6);

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: ecoGreen,
        ),
      ),
      home: const SplashPage(),
    );
  }
}

// ======================================================
// LOGO
// ======================================================

class EcoWalkLogo extends StatelessWidget {
  final bool white;
  final double width;

  const EcoWalkLogo({
    super.key,
    this.white = false,
    this.width = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/images/logo_ecowalk_white.png',
      width: width,
      fit: BoxFit.contain,
      color: white ? null : ecoGreen,
      colorBlendMode: white ? null : BlendMode.srcIn,
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

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );
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
              const EcoWalkLogo(
                white: true,
                width: 210,
              ),
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

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    final String username = usernameController.text.trim();
    final String password = passwordController.text.trim();

    const String correctUsername = 'astrella';
    const String correctPassword = '123456';

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Nama pengguna dan kata sandi harus diisi.',
          ),
        ),
      );
      return;
    }

    if (username == correctUsername && password == correctPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Nama pengguna atau kata sandi salah.',
          ),
        ),
      );
    }
  }

  Widget _inputField({
    required TextEditingController controller,
    required IconData icon,
    required double height,
    required double s,
    bool obscure = false,
    Widget? suffix,
  }) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        obscureText: obscure,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 13 * s),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: const Color(0xFFF2F2F2),
          prefixIcon: Icon(
            icon,
            size: 19 * s,
            color: Colors.black54,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 42 * s,
            minHeight: 0,
          ),
          suffixIcon: suffix,
          suffixIconConstraints: BoxConstraints(
            minWidth: 42 * s,
            minHeight: 0,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10 * s,
            vertical: (height - 18) / 2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFD8D8D8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ecoGreen,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double v = constraints.maxHeight / 844;
            final double s = constraints.maxWidth / 390;

            const double sidePad = 20;
            final double fieldHeight = 47 * v;

            Widget place(double top, Widget child) {
              return Positioned(
                top: top * v,
                left: sidePad * s,
                right: sidePad * s,
                child: child,
              );
            }

            return Stack(
              children: [
                place(
                  133,
                  Text(
                    'MASUK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ecoGreen,
                      fontSize: 16 * s,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                place(
                  168,
                  Center(
                    heightFactor: 1,
                    child: EcoWalkLogo(
                      width: 230 * s,
                    ),
                  ),
                ),

                place(
                  272,
                  Text(
                    'Nama Pengguna',
                    style: TextStyle(
                      fontSize: 12 * s,
                      color: Colors.black,
                    ),
                  ),
                ),

                place(
                  299,
                  _inputField(
                    controller: usernameController,
                    icon: Icons.person,
                    height: fieldHeight,
                    s: s,
                  ),
                ),

                place(
                  358,
                  Text(
                    'Kata Sandi',
                    style: TextStyle(
                      fontSize: 12 * s,
                      color: Colors.black,
                    ),
                  ),
                ),

                place(
                  386,
                  _inputField(
                    controller: passwordController,
                    icon: Icons.lock,
                    height: fieldHeight,
                    s: s,
                    obscure: hidePassword,
                    suffix: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minWidth: 42 * s,
                        minHeight: 0,
                      ),
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 19 * s,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                ),

                place(
                  485,
                  SizedBox(
                    width: double.infinity,
                    height: 43 * v,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ecoGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: login,
                      child: Text(
                        'MASUK',
                        style: TextStyle(
                          fontSize: 12 * s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                place(
                  548,
                  Center(
                    heightFactor: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Lupa Kata Sandi?',
                        style: TextStyle(
                          color: linkBlue,
                          fontSize: 11 * s,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),

                place(
                  603,
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Color(0xFFD8D8D8),
                          thickness: 0.8,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14 * s,
                        ),
                        child: Text(
                          'Atau',
                          style: TextStyle(
                            fontSize: 10 * s,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xFFD8D8D8),
                          thickness: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),

                place(
                  662,
                  Material(
                    color: const Color(0xFFF2F2F2),
                    elevation: 4,
                    shadowColor: Colors.black38,
                    borderRadius: BorderRadius.circular(6),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () {},
                      child: SizedBox(
                        width: double.infinity,
                        height: 42 * v,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/images/google.png',
                              width: 20 * s,
                              height: 20 * s,
                            ),
                            SizedBox(width: 10 * s),
                            Text(
                              'Lanjutkan dengan Google',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12 * s,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                place(
                  747,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tidak punya akun?',
                        style: TextStyle(
                          fontSize: 10 * s,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 4 * s),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Daftar disini',
                          style: TextStyle(
                            color: linkBlue,
                            fontSize: 10 * s,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
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

  final TextEditingController usernameController =
      TextEditingController();
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController phoneController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void register() {
    final String username = usernameController.text.trim();
    final String email = emailController.text.trim();
    final String phone = phoneController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword =
        confirmPasswordController.text.trim();

    if (username.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      showMessage('Semua kolom harus diisi.');
      return;
    }

    if (password != confirmPassword) {
      showMessage('Konfirmasi kata sandi tidak sama.');
      return;
    }

    if (!agree) {
      showMessage(
        'Anda harus menyetujui persyaratan dan privasi pengguna.',
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VerificationPage(),
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    required double height,
    required double s,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
  }) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscure,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 13 * s,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: const Color
          (0xFFF2F2F2),
          prefixIcon: Icon(
            icon,
            size: 19 * s,
            color: Colors.black54,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 48 * s,
            minHeight: 0,
          ),
          suffixIcon: suffix,
          suffixIconConstraints: BoxConstraints(
            minWidth: 48 * s,
            minHeight: 0,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 13 * s,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10 * s,
            vertical: (height - 18) / 2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFD8D8D8),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ecoGreen,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEyeButton({
    required bool hidden,
    required VoidCallback onPressed,
    required double s,
  }) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: 48 * s,
        minHeight: 0,
      ),
      onPressed: onPressed,
      icon: Icon(
        hidden ? Icons.visibility_off : Icons.visibility,
        size: 19 * s,
        color: Colors.black54,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final double v = screen.height / 844;
    final double s = screen.width / 390;

    const double sidePad = 22;
    final double fieldHeight = 47 * v;

    Widget place(double top, Widget child) {
      return Positioned(
        top: top * v,
        left: sidePad * s,
        right: sidePad * s,
        child: child,
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: screen.width,
            height: screen.height,
            child: Stack(
              children: [
                place(
                  120,
                  Center(
                    heightFactor: 1,
                    child: SizedBox(
                      width: 223 * s,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BUAT AKUN',
                            style: TextStyle(
                              fontSize: 16 * s,
                              color: ecoGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6 * v),
                          Image.asset(
                            'lib/images/logo_ecowalk_white.png',
                            width: 223 * s,
                            fit: BoxFit.contain,
                            color: ecoGreen,
                            colorBlendMode: BlendMode.srcIn,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                place(
                  250,
                  buildField(
                    controller: usernameController,
                    icon: Icons.person,
                    hint: 'Nama Pengguna',
                    height: fieldHeight,
                    s: s,
                  ),
                ),

                place(
                  317,
                  buildField(
                    controller: emailController,
                    icon: Icons.email,
                    hint: 'Email',
                    height: fieldHeight,
                    s: s,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                place(
                  384,
                  buildField(
                    controller: phoneController,
                    icon: Icons.phone,
                    hint: 'Nomor Hp',
                    height: fieldHeight,
                    s: s,
                    keyboardType: TextInputType.phone,
                  ),
                ),

                place(
                  452,
                  buildField(
                    controller: passwordController,
                    icon: Icons.lock,
                    hint: 'Kata Sandi',
                    height: fieldHeight,
                    s: s,
                    obscure: hidePassword,
                    suffix: buildEyeButton(
                      hidden: hidePassword,
                      s: s,
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                ),

                place(
                  519,
                  buildField(
                    controller: confirmPasswordController,
                    icon: Icons.lock,
                    hint: 'Konfirmasi Kata Sandi',
                    height: fieldHeight,
                    s: s,
                    obscure: hideConfirmPassword,
                    suffix: buildEyeButton(
                      hidden: hideConfirmPassword,
                      s: s,
                      onPressed: () {
                        setState(() {
                          hideConfirmPassword =
                              !hideConfirmPassword;
                        });
                      },
                    ),
                  ),
                ),

                place(
                  592,
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 0.9 * s,
                        child: Checkbox(
                          value: agree,
                          activeColor: ecoGreen,
                          side: const BorderSide(
                            color: Colors.black45,
                            width: 1.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(3),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity:
                              VisualDensity.compact,
                          onChanged: (value) {
                            setState(() {
                              agree = value ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 8 * s),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Saya telah membaca dan menyetujui ',
                                style: TextStyle(
                                  fontSize: 11.5 * s,
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'persyaratan dan\nprivasi pengguna',
                                style: TextStyle(
                                  fontSize: 11.5 * s,
                                  color: linkBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                place(
                  655,
                  SizedBox(
                    width: double.infinity,
                    height: 43 * v,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ecoGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: register,
                      child: Text(
                        'BUAT AKUN',
                        style: TextStyle(
                          fontSize: 12 * s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                place(
                  726,
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: TextStyle(
                          fontSize: 11 * s,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 4 * s),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            color: linkBlue,
                            fontSize: 11 * s,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// 4. VERIFICATION PAGE
// ====================================================
class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() =>
      _VerificationPageState();
}

class _VerificationPageState
    extends State<VerificationPage> {
  bool usingEmail = false;

  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void send() {
    final bool incomplete = otpControllers.any(
      (controller) => controller.text.trim().isEmpty,
    );

    if (incomplete) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Kode verifikasi harus diisi lengkap.',
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  Widget otpBox({
    required TextEditingController controller,
    required double size,
    required double s,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: TextField(
        controller: controller,
        expands: true,
        minLines: null,
        maxLines: null,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(
          fontSize: 24 * s,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFD9D9D9),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: ecoGreen,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final double v = screen.height / 844;
    final double s = screen.width / 390;

    const double sidePad = 20;
    final double boxSize = 76 * s;

    Widget place(
      double top,
      Widget child, {
      double pad = sidePad,
    }) {
      return Positioned(
        top: top * v,
        left: pad * s,
        right: pad * s,
        child: child,
      );
    }

    final String target = usingEmail
        ? 'ke contohsample@gmail.com'
        : 'ke +62876543210912';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: screen.width,
            height: screen.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 258 * v,
                  child: Image.asset(
                    'lib/images/polygon.png',
                    fit: BoxFit.fill,
                  ),
                ),

                place(
                  153,
                  Center(
                    heightFactor: 1,
                    child: Image.asset(
                      'lib/images/logo_ecowalk_white.png',
                      width: 227 * s,
                      fit: BoxFit.contain,
                      color: ecoGreen,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                  ),
                ),

                place(
                  261,
                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        size: 18 * s,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8 * s),
                      Text(
                        'VERIFIKASI',
                        style: TextStyle(
                          fontSize: 12 * s,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                place(
                  298,
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/images/hp.png',
                        width: 23 * s,
                        height: 23 * s,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8 * s),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Periksa dan ketik kode verifikasi yang telah dikirimkan ',
                                style: TextStyle(
                                  fontSize: 11 * s,
                                  color: Colors.black87,
                                  height: 1.3,
                                ),
                              ),
                              TextSpan(
                                text: target,
                                style: TextStyle(
                                  fontSize: 11 * s,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ======================
                // 4 KOTAK OTP
                // ======================
                place(
                  369,
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 4; i++)
                        otpBox(
                          controller: otpControllers[i],
                          size: boxSize,
                          s: s,
                        ),
                    ],
                  ),
                  pad: 17,
                ),

                place(
                  480,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          usingEmail = !usingEmail;
                        });
                      },
                      child: Text(
                        usingEmail
                            ? 'Verifikasi menggunakan No. Hp'
                            : 'Verifikasi menggunakan Email',
                        style: TextStyle(
                          color: linkBlue,
                          fontSize: 11 * s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                place(
                  521,
                  SizedBox(
                    width: double.infinity,
                    height: 44 * v,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ecoGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: send,
                      child: Text(
                        'KIRIM',
                        style: TextStyle(
                          fontSize: 12 * s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                place(
                  588,
                  Center(
                    heightFactor: 1,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Kirim Ulang Kode',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 11 * s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends State<ForgotPasswordPage> {
  bool usingEmail = true;

  final TextEditingController inputController =
      TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void send() {
    final String value = inputController.text.trim();

    if (value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            usingEmail
                ? 'Alamat email harus diisi.'
                : 'Nomor Hp harus diisi.',
          ),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetPasswordPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final double v = screen.height / 844;
    final double s = screen.width / 390;

    const double sidePad = 20;

    Widget place(double top, Widget child) {
      return Positioned(
        top: top * v,
        left: sidePad * s,
        right: sidePad * s,
        child: child,
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: screen.width,
            height: screen.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 258 * v,
                  child: Image.asset(
                    'lib/images/polygon.png',
                    fit: BoxFit.fill,
                  ),
                ),

                place(
                  153,
                  Center(
                    heightFactor: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'lib/images/logo_ecowalk_white.png',
                          width: 227 * s,
                          fit: BoxFit.contain,
                          color: ecoGreen,
                          colorBlendMode: BlendMode.srcIn,
                        ),
                        SizedBox(height: 6 * v),
                        Text(
                          'LUPA KATA SANDI',
                          style: TextStyle(
                            color: ecoGreen,
                            fontSize: 18 * s,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                place(
                  281,
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/images/notif.png',
                        width: 19 * s,
                        height: 19 * s,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8 * s),
                      Expanded(
                        child: Text(
                          usingEmail
                              ? 'Periksa dan masukkan alamat Email untuk mendapatkan kode verifikasi'
                              : 'Periksa dan masukkan Nomor Hp untuk mendapatkan kode verifikasi',
                          style: TextStyle(
                            fontSize: 12 * s,
                            height: 1.3,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                place(
                  366,
                  Text(
                    usingEmail
                        ? 'Alamat Email'
                        : 'Nomor Hp',
                    style: TextStyle(
                      fontSize: 12 * s,
                      color: Colors.black54,
                    ),
                  ),
                ),

                place(
                  396,
                  TextField(
                    controller: inputController,
                    keyboardType: usingEmail
                        ? TextInputType.emailAddress
                        : TextInputType.phone,
                    style: TextStyle(
                      fontSize: 14 * s,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ecoGreen,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),

                place(
                  470,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          usingEmail = !usingEmail;
                          inputController.clear();
                        });
                      },
                      child: Text(
                        usingEmail
                            ? 'Gunakan Nomor Hp'
                            : 'Gunakan Email',
                        style: TextStyle(
                          color: linkBlue,
                          fontSize: 12 * s,
                        ),
                      ),
                    ),
                  ),
                ),

                place(
                  519,
                  SizedBox(
                    width: double.infinity,
                    height: 44 * v,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ecoGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: send,
                      child: Text(
                        'KIRIM',
                        style: TextStyle(
                          fontSize: 12 * s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// 6. RESET PASSWORD
// ======================================================

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() =>
      _ResetPasswordPageState();
}

class _ResetPasswordPageState
    extends State<ResetPasswordPage> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void resetPassword() {
    final String password = passwordController.text.trim();
    final String confirmPassword =
        confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      showMessage('Semua kolom harus diisi.');
      return;
    }

    if (password != confirmPassword) {
      showMessage('Konfirmasi kata sandi tidak sama.');
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
      (route) => false,
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required String hint,
    required bool hidden,
    required VoidCallback onToggle,
    required double s,
  }) {
    return TextField(
      controller: controller,
      obscureText: hidden,
      style: TextStyle(
        fontSize: 13 * s,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: Icon(
          Icons.lock,
          size: 20 * s,
          color: Colors.black87,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 36 * s,
          minHeight: 0,
        ),
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minWidth: 30 * s,
            minHeight: 0,
          ),
          icon: Icon(
            hidden ? Icons.visibility_off : Icons.visibility,
            size: 19 * s,
            color: Colors.black54,
          ),
          onPressed: onToggle,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 30 * s,
          minHeight: 0,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 12 * s,
          color: Colors.black54,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
            width: 1,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ecoGreen,
            width: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final double v = screen.height / 844;
    final double s = screen.width / 390;

    const double sidePad = 22;

    Widget place(double top, Widget child) {
      return Positioned(
        top: top * v,
        left: sidePad * s,
        right: sidePad * s,
        child: child,
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: screen.width,
            height: screen.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 258 * v,
                  child: Image.asset(
                    'lib/images/polygon.png',
                    fit: BoxFit.fill,
                  ),
                ),

                place(
                  153,
                  Center(
                    heightFactor: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'lib/images/logo_ecowalk_white.png',
                          width: 227 * s,
                          fit: BoxFit.contain,
                          color: ecoGreen,
                          colorBlendMode: BlendMode.srcIn,
                        ),
                        SizedBox(height: 6 * v),
                        Text(
                          'LUPA KATA SANDI',
                          style: TextStyle(
                            color: ecoGreen,
                            fontSize: 18 * s,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                place(
                  306,
                  Text(
                    'Masukkan Kata Sandi Baru',
                    style: TextStyle(
                      fontSize: 12 * s,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                place(
                  348,
                  buildField(
                    controller: passwordController,
                    hint: 'Kata Sandi Baru',
                    hidden: hidePassword,
                    s: s,
                    onToggle: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),

                place(
                  421,
                  buildField(
                    controller: confirmPasswordController,
                    hint: 'Konfirmasi Kata Sandi',
                    hidden: hideConfirmPassword,
                    s: s,
                    onToggle: () {
                      setState(() {
                        hideConfirmPassword =
                            !hideConfirmPassword;
                      });
                    },
                  ),
                ),

                place(
                  508,
                  SizedBox(
                    width: double.infinity,
                    height: 44 * v,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ecoGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: resetPassword,
                      child: Text(
                        'UBAH KATA SANDI',
                        style: TextStyle(
                          fontSize: 12 * s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

  static Widget profileMenu({
    required IconData icon,
    required String title,
    required double s,
    required double v,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        height: 55 * v,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * s),
          child: Row(
            children: [
              Icon(
                icon,
                size: 22 * s,
                color: Colors.black87,
              ),
              SizedBox(width: 16 * s),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 13 * s,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 24 * s,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final double v = screen.height / 844;
    final double s = screen.width / 390;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: screen.width,
          height: screen.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 70 * v,
                child: Container(
                  color: const Color(0xFF3B8476),
                ),
              ),

              Positioned(
                top: 70 * v,
                left: 0,
                right: 0,
                height: 87 * v,
                child: Container(
                  color: ecoGreen,
                ),
              ),

              Positioned(
                top: 95 * v,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 120 * s,
                    height: 120 * s,
                    padding: EdgeInsets.all(4 * s),
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
              ),

              Positioned(
                top: 226 * v,
                left: 0,
                right: 0,
                child: Text(
                  'Astrella Elga Ananta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20 * s,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              Positioned(
                top: 262 * v,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16 * s,
                      vertical: 4 * v,
                    ),
                    color: ecoGreen,
                    child: Text(
                      'astrella.el17@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11 * s,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 310 * v,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    profileMenu(
                      icon: Icons.settings_outlined,
                      title: 'Pengaturan',
                      s: s,
                      v: v,
                    ),
                    const Divider(height: 1),
                    profileMenu(
                      icon: Icons.edit_outlined,
                      title: 'Edit Profil',
                      s: s,
                      v: v,
                    ),
                    const Divider(height: 1),
                    profileMenu(
                      icon: Icons.lock_outline,
                      title: 'Kebijakan Privasi',
                      s: s,
                      v: v,
                    ),
                    const Divider(height: 1),
                    profileMenu(
                      icon: Icons.info_outline,
                      title: 'Tentang Kami',
                      s: s,
                      v: v,
                    ),
                    const Divider(height: 1),
                    profileMenu(
                      icon: Icons.description_outlined,
                      title: 'Ketentuan Layanan',
                      s: s,
                      v: v,
                    ),
                    const Divider(height: 1),
                    profileMenu(
                      icon: Icons.logout,
                      title: 'Keluar',
                      s: s,
                      v: v,
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginPage(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 701 * v,
                left: 0,
                right: 0,
                height: 59 * v,
                child: Container(
                  color: ecoGreen,
                ),
              ),

              Positioned(
                top: 701 * v,
                left: 0,
                right: 85 * s,
                height: 59 * v,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30 * s,
                    ),
                    Icon(
                      Icons.verified_user,
                      color: Colors.white,
                      size: 27 * s,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble,
                          color: Colors.white,
                          size: 31 * s,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 3 * s),
                          child: Icon(
                            Icons.favorite,
                            color: ecoGreen,
                            size: 13 * s,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 667 * v,
                right: 18 * s,
                child: Container(
                  width: 62 * s,
                  height: 62 * s,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ecoGreen,
                      width: 6,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    color: ecoGreen,
                    size: 30 * s,
                  ),
                ),
              ),

              Positioned(
                top: 735 * v,
                right: 18 * s,
                width: 62 * s,
                child: Text(
                  'AKUN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8 * s,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}