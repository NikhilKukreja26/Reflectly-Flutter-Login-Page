import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../widgets/delayed_animation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final color = Colors.white;
    final delayedAmount = 500;
    _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: const Color(0xFF8185E2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DelayedAnimation(
                delay: delayedAmount + 1000,
                child: AvatarGlow(
                  duration: const Duration(seconds: 2),
                  endRadius: 90.0,
                  glowColor: Colors.white24,
                  repeatPauseDuration: const Duration(seconds: 2),
                  startDelay: const Duration(seconds: 1),
                  repeat: true,
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: ClipOval(
                        child: Image.asset('assets/images/reflectly.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: delayedAmount + 2000,
                child: Text(
                  'Hi there,',
                  style: TextStyle(
                    color: color,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Avenir',
                  ),
                ),
              ),
              DelayedAnimation(
                delay: delayedAmount + 2500,
                child: Text(
                  'I\'m Reflectly',
                  style: TextStyle(
                    color: color,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Avenir',
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              DelayedAnimation(
                delay: delayedAmount + 3000,
                child: Text(
                  'Your new personal ',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Avenir',
                  ),
                ),
              ),
              DelayedAnimation(
                delay: delayedAmount + 3000,
                child: Text(
                  'self-care companion',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Avenir',
                  ),
                ),
              ),
              const SizedBox(
                height: 120.0,
              ),
              DelayedAnimation(
                delay: delayedAmount + 4000,
                child: GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButtonUI,
                  ),
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              DelayedAnimation(
                delay: delayedAmount + 5000,
                child: Text(
                  'I Already Have An Account'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Avenir',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Hi, Reflectly!'.toUpperCase(),
            style: TextStyle(
              color: const Color(0xFF8185E2),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Avenir',
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
