import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool _isOn = false;

  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: _isOn ? Colors.yellow : Colors.grey.shade700,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 4,
            right: MediaQuery.of(context).size.width / 2 - 4,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          _isOn
              ? Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  right: MediaQuery.of(context).size.width / 2 - 75,
                  top: 202,
                  child: Transform.scale(
                    scale: _scale,
                    child: Transform.rotate(
                        angle: 3.15,
                        child: GestureDetector(
                            onTapDown: _tapDown,
                            onTapUp: _tapUp,
                            onTap: () {
                              setState(() {
                                _isOn = false;
                              });
                            },
                            child: Image.network(
                              'https://ouch-cdn2.icons8.com/X5fB-F4h5Z-W9fimJnFUJ_So5Z2Kh6ULPuw-I6jK790/rs:fit:784:1134/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNzQ3/LzU1YzYyNmUxLTI5/ZTctNDFmNS04M2Rk/LTZmOTFiMzkwMTQ4/MS5zdmc.png',
                              width: 150,
                            ))),
                  ),
                )
              : Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  right: MediaQuery.of(context).size.width / 2 - 75,
                  top: 202,
                  child: Transform.scale(
                    scale: _scale,
                    child: Transform.rotate(
                      angle: 3.15,
                      child: GestureDetector(
                        onTapDown: _tapDown,
                        onTapUp: _tapUp,
                        onTap: () {
                          setState(() {
                            _isOn = true;
                          });
                        },
                        child: Image.network(
                          'https://ouch-cdn2.icons8.com/GCKndOXpaXkSHmDQvtUOP2yMUrV9LSpXXJRneOqvM2o/rs:fit:784:1134/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTY1/L2Q2ZDBkNTkwLTBl/ZDAtNDA5MC05ZjUw/LTIzNGJjZjRmZDdm/Yy5zdmc.png',
                          color: Colors.grey.shade800,
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
