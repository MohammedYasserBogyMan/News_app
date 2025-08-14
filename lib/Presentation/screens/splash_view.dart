import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app_new_training/Presentation/screens/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();

    // إعداد AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // إعداد حركة التكبير
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);

    // بدء الأنيميشن
    _controller.forward();

    // تحديث قيمة progress indicator بشكل تدريجي
    Future.delayed(const Duration(milliseconds: 500), _updateProgress);
  }

  void _updateProgress() {
    setState(() {
      _progressValue += 0.05; // زيادة بنسبة 2%
      if (_progressValue < 1.0) {
        Future.delayed(const Duration(milliseconds: 100), _updateProgress);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset('assets/011.png'),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20, // عرض الشاشة
            child: LinearProgressIndicator(
              value: _progressValue, // قيمة المؤشر الخطي المتقدمة
              backgroundColor: Colors.white, // لون الخلفية للمؤشر
              color: Colors.blue[300], // لون المؤشر المتقدم
              minHeight: 5.0, // سمك الخط
            ),
          ),
        ],
      ),
      nextScreen: const HomeView(),
      splashIconSize: 300,
      duration: 3000, // مدة العرض الإجمالية
    );
  }
}
