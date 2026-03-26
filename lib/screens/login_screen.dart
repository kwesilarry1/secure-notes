import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  final bool isFirstTime;

  const LoginScreen({super.key, this.isFirstTime = false});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  String error = "";

  void handleSubmit() async {
    String input = _controller.text;

    if (widget.isFirstTime) {
      await StorageService.savePin(input);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      String? savedPin = await StorageService.getPin();
      if (input == savedPin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      } else {
        setState(() {
          error = "Wrong PIN";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.isFirstTime ? "Set PIN" : "Enter PIN",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "PIN",
              ),
            ),
            SizedBox(height: 10),
            Text(error, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleSubmit,
              child: Text("Continue"),
            )
          ],
        ),
      ),
    );
  }
}