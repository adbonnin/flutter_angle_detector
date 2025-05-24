import 'package:angle_detector/angle_detector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angle Detector Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AngleDetector(
        onAngleChanged: _onAngleChanged,
        child: Transform.rotate(
          angle: _angle,
          child: SizedBox.expand(
            child: DirectionIndicator(),
          ),
        ),
      ),
    );
  }

  void _onAngleChanged(double angle) {
    setState(() => _angle = angle);
  }
}

class DirectionIndicator extends StatelessWidget {
  const DirectionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Icon(Icons.south),
      ),
    );
  }
}
