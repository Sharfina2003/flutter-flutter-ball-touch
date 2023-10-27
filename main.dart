import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DotColorChangeDemo(),
    );
  }
}

class DotColorChangeDemo extends StatefulWidget {
  const DotColorChangeDemo({super.key});

  @override
  
  _DotColorChangeDemoState createState() => _DotColorChangeDemoState();
}

class _DotColorChangeDemoState extends State<DotColorChangeDemo> {
  double dotX = 0;
  double dotY = 0;
  Color dotColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dot Color Change Demo'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            dotX += details.delta.dx;
            dotY += details.delta.dy;
            dotColor = Colors.blue;
          });
        },
        onPanEnd: (details) {
          setState(() {
            dotColor = Colors.red;
          });
        },
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              left: dotX,
              top: dotY,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
