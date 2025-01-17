import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // For video playback

class WorkoutDetailPage extends StatefulWidget {
  final String workoutName;

  WorkoutDetailPage({required this.workoutName});

  @override
  _WorkoutDetailPageState createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  late VideoPlayerController _controller;

  // Initialize the video controller if needed
  @override
  void initState() {
    super.initState();

    if (widget.workoutName == 'Running') {
      _controller = VideoPlayerController.asset('assets/videos/running.mp4') // Replace with video path
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller when done
  }

  @override
  Widget build(BuildContext context) {
    String workoutDetails = '';
    String imagePath = '';
    Widget videoPlayer = SizedBox(); // Placeholder for video

    switch (widget.workoutName) {
      case 'Push Ups':
        workoutDetails = 'Push-ups are a bodyweight exercise that targets the chest, shoulders, and triceps. It helps build upper body strength and endurance.';
        imagePath = 'assets/images/pushups.png';
        break;
      case 'Squats':
        workoutDetails = 'Squats are a compound exercise that primarily targets the quads, hamstrings, and glutes. They help in building lower body strength and stability.';
        imagePath = 'assets/images/squats.png';
        break;
      case 'Lunges':
        workoutDetails = 'Lunges work your legs, particularly the glutes, quads, and hamstrings. They are great for building strength and improving balance.';
        imagePath = 'assets/images/lunges.png';
        break;
      case 'Burpees':
        workoutDetails = 'Burpees are a full-body exercise that targets multiple muscle groups, including the chest, arms, and legs. They improve strength, endurance, and agility.';
        imagePath = 'assets/images/burpees.png';
        break;
      case 'Plank':
        workoutDetails = 'The plank is an isometric exercise that strengthens the core muscles, improving posture and stability.';
        imagePath = 'assets/images/plank.png';
        break;
      case 'Running':
        workoutDetails = 'Running is a cardiovascular exercise that improves endurance and targets the lower body muscles.';
        imagePath = 'assets/images/running.png';
        videoPlayer = _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(); // Video placeholder
        break;
      case 'Cycling':
        workoutDetails = 'Cycling is an excellent cardiovascular exercise that strengthens the lower body and improves endurance.';
        imagePath = 'assets/images/cycling.png';
        break;
      default:
        workoutDetails = 'No information available for this workout.';
        imagePath = ''; // No image
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Details about ${widget.workoutName}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Displaying Image
              imagePath.isNotEmpty
                  ? Image.asset(imagePath)
                  : SizedBox(height: 200), // Placeholder if no image is available
              SizedBox(height: 20),
              Text(
                workoutDetails,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Display Video if it's Running
              videoPlayer,
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
