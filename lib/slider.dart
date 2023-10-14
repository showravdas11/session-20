import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(_currentValue.toString()),
          Slider(
              value: _currentValue,
              min: 0,
              max: 50,
              label: 'Count',
              activeColor: Colors.white,
              inactiveColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _currentValue = value;
                });
              }),
        ],
      ),
    );
  }
}
