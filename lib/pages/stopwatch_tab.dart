import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchTab extends StatefulWidget {
  @override
  _StopwatchTabState createState() => _StopwatchTabState();
}

class _StopwatchTabState extends State<StopwatchTab> {
  late Stopwatch _stopwatch;
  Timer? _timer;
  List<String> _laps = [];

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

  void _pauseStopwatch() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _laps.clear();
    _timer?.cancel();
    setState(() {});
  }

  void _recordLap() {
    if (_stopwatch.isRunning) {
      final elapsed = _stopwatch.elapsed;
      final formattedLapTime =
          '${elapsed.inMinutes}:${(elapsed.inSeconds % 60).toString().padLeft(2, '0')}.${(elapsed.inMilliseconds % 1000).toString().padLeft(3, '0')}';
      _laps.insert(0, formattedLapTime);
      setState(() {});
    }
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = _stopwatch.elapsed;

    String formatTime(Duration duration) {
      return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}.${(duration.inMilliseconds % 1000).toString().padLeft(3, '0')}';
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stopwatch Display
            Text(
              formatTime(elapsed),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // Stopwatch Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:
                      _stopwatch.isRunning ? _pauseStopwatch : _startStopwatch,
                  child: Text(_stopwatch.isRunning ? 'Pause' : 'Start'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Colors.redAccent,
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _recordLap,
                  child: Text('Lap'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Laps List
            if (_laps.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _laps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text('${index + 1}',
                            style: TextStyle(color: Colors.white)),
                      ),
                      title: Text(
                        _laps[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Text(
                'No laps recorded.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}
