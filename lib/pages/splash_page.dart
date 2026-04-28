import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ===== MEDIAQUERY: ukuran layar responsif =====
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth  = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        // ===== STACK: Tumpuk gambar + konten =====
        children: [

          // Layer 1: Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),

          // Layer 2: Gradient gelap di bawah
          Positioned(
            bottom: 0, left: 0, right: 0,
            height: screenHeight * 0.55,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.88),
                  ],
                ),
              ),
            ),
          ),

          // Layer 3: Judul "Aspen" di atas (Positioned)
          Positioned(
            top: screenHeight * 0.10,
            left: 28,
            child: Text(
              'Aspen',
              style: TextStyle(
                fontSize: screenWidth * 0.18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          // Layer 4: Teks + tombol di bawah (Positioned)
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(28, 0, 28, screenHeight * 0.07),
              child: Column(
                // ===== COLUMN: susun teks vertikal =====
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Plan your',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Luxurious\nVacation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Tombol Explore (full width)
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomePage(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Explore',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}