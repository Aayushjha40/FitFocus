import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchTab extends StatefulWidget {
  @override
  _StopwatchTabState createState() => _StopwatchTabState();
}

class _StopwatchTabState extends State<StopwatchTab> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startStopwatch() {
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    _timer.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    setState(() {});
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = _stopwatch.elapsed;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${elapsed.inMinutes}:${(elapsed.inSeconds % 60).toString().padLeft(2, '0')}.${(elapsed.inMilliseconds % 1000).toString().padLeft(3, '0')}',
          style: TextStyle(fontSize: 48),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _stopwatch.isRunning ? _stopStopwatch : _startStopwatch,
              child: Text(_stopwatch.isRunning ? 'Stop' : 'Start'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: _resetStopwatch,
              child: Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}
