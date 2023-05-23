import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4000)).then((_) {
      Modular.to.navigate('/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AvatarGlow(
        showTwoGlows: true,
        duration: const Duration(milliseconds: 1900),
        glowColor: Colors.yellow,
        endRadius: 600.0,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "assets/images/pikachu.gif",
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }
}
