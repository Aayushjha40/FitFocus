import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // For video playback

class WorkoutDetailPage extends StatefulWidget {
  final String workoutName;

  WorkoutDetailPage({required this.workoutName});

  @override
  _WorkoutDetailPageState createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video controller only for specific workout
    if (widget.workoutName == 'Running') {
      _controller = VideoPlayerController.asset('assets/videos/running.mp4')
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    // Dispose the controller if it is initialized
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String workoutDetails = '';
    String imagePath = '';
    Widget videoPlayer = SizedBox(); // Placeholder widget for video

    switch (widget.workoutName) {
      case 'Push Ups':
        workoutDetails = '''
Push-ups are a fundamental bodyweight exercise that targets the chest, shoulders, and triceps. They help build upper body strength and endurance while also engaging core muscles for stabilization.
        
**Steps:**
1. Start in a plank position with your hands shoulder-width apart.
2. Lower your body until your chest nearly touches the floor.
3. Push back up to the starting position.
        
**Benefits:**
- Improves upper body strength.
- Enhances core stability.
- Boosts cardiovascular endurance.
        ''';
        imagePath = 'assets/images/pushups.png';
        break;

      case 'Squats':
        workoutDetails = '''
Squats are a powerful compound exercise that primarily targets the quads, hamstrings, and glutes. They improve lower body strength, balance, and flexibility.

**Steps:**
1. Stand with your feet shoulder-width apart.
2. Lower your hips as if sitting into a chair.
3. Keep your chest up and knees over your toes.
4. Push back up to the starting position.

**Benefits:**
- Strengthens lower body muscles.
- Improves mobility and posture.
- Boosts functional fitness.
        ''';
        imagePath = 'assets/images/squats.png';
        break;

      case 'Lunges':
        workoutDetails = '''
Lunges are an excellent lower body exercise that improves strength, stability, and balance.

**Steps:**
1. Step forward with one leg and lower your body until both knees are bent at 90 degrees.
2. Push back to the starting position and repeat on the other leg.

**Benefits:**
- Strengthens quads, glutes, and hamstrings.
- Improves balance and coordination.
- Enhances flexibility.
        ''';
        imagePath = 'assets/images/lunges.png';
        break;

      case 'Burpees':
        workoutDetails = '''
Burpees are a full-body exercise that targets multiple muscle groups and enhances cardiovascular endurance.

**Steps:**
1. Begin in a standing position.
2. Drop into a squat with your hands on the ground.
3. Kick your feet back into a plank position.
4. Perform a push-up, then return to the squat.
5. Jump explosively into the air.

**Benefits:**
- Burns a lot of calories.
- Improves strength and endurance.
- Boosts agility and coordination.
        ''';
        imagePath = 'assets/images/burpees.png';
        break;

      case 'Plank':
        workoutDetails = '''
The plank is an isometric exercise that strengthens the core muscles, improving posture, stability, and endurance.

**Steps:**
1. Lie face down with your elbows directly under your shoulders.
2. Lift your body into a straight line from head to heels.
3. Hold this position, engaging your core.

**Benefits:**
- Builds core strength.
- Improves posture.
- Enhances overall stability.
        ''';
        imagePath = 'assets/images/plank.png';
        break;

      case 'Running':
        workoutDetails = '''
Running is a fantastic cardiovascular exercise that strengthens your heart and lungs, while also targeting the lower body muscles.

**Benefits:**
- Improves cardiovascular endurance.
- Strengthens leg muscles.
- Helps in weight management.

Watch the video below for proper running techniques.
        ''';
        imagePath = 'assets/images/running.png';
        videoPlayer = _controller != null && _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : SizedBox();
        break;

      case 'Cycling':
        workoutDetails = '''
Cycling is a low-impact exercise that improves cardiovascular health and strengthens the lower body muscles.

**Benefits:**
- Increases stamina and endurance.
- Strengthens leg and glute muscles.
- Reduces joint stress compared to high-impact exercises.
        ''';
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
              // Displaying image
              imagePath.isNotEmpty
                  ? Image.asset(imagePath)
                  : SizedBox(height: 200, child: Placeholder()),
              SizedBox(height: 20),
              Text(
                workoutDetails,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Display video player for Running workout
              videoPlayer,
              if (_controller != null && _controller!.value.isInitialized)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller!.value.isPlaying
                          ? _controller!.pause()
                          : _controller!.play();
                    });
                  },
                  child: Text(
                    _controller!.value.isPlaying ? 'Pause Video' : 'Play Video',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
