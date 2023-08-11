import 'package:flutter/material.dart';
// Import the intl package for time formatting
import 'package:torch_app/Constant/Color.dart';
import 'package:torch_controller/torch_controller.dart';

class torchScreen extends StatefulWidget {
  const torchScreen({super.key});

  @override
  State<torchScreen> createState() => _torchScreenState();
}

class _torchScreenState extends State<torchScreen> {
  late bool _isactive;
  late TorchController controller;
  @override
  void initState() {
    super.initState();
    _isactive = false;
    controller = TorchController();
  }

  String _getGreeting() {
    final currentTime = TimeOfDay.now();
    if (currentTime.hour >= 0 && currentTime.hour < 12) {
      return 'Good Morning';
    } else if (currentTime.hour >= 12 && currentTime.hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final greeting = _getGreeting(); // Get the appropriate greeting

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Hi, $greeting",
                style: TextStyle(
                    color: textColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Image.asset(
                      _isactive
                          ? "assets/images/torch_on.jpg"
                          : "assets/images/torch_off.jpg",
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    IconButton(
                      onPressed: () {
                        controller.toggle();
                        setState(() {
                          _isactive = !_isactive;
                        });
                      },
                      icon: Icon(
                        _isactive
                            ? Icons.power_settings_new
                            : Icons.power_settings_new_outlined,
                        size: 60.0,
                        color: _isactive ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Developed by Zain Ishtiaq",
              style: TextStyle(color: textColor, fontSize: 14.0),
            ),
            SizedBox(
              height: size.height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
