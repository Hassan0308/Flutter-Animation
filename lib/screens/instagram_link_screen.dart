import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/success_screen.dart';
import 'package:lottie/lottie.dart';
class InstagramLinkScreen extends StatefulWidget {
  @override
  _InstagramLinkScreenState createState() => _InstagramLinkScreenState();
}

class _InstagramLinkScreenState extends State<InstagramLinkScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Link Your Instagram Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 40),
            _buildTextField('Enter Email', _emailController),
            const SizedBox(height: 20),
            _buildTextField('Enter Password', _passwordController, isPassword: true),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                _linkAccount(context);
              },
              child: Text('Link',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
        filled: true,
        fillColor: Colors.purple.shade50,
      ),
    );
  }

  void _linkAccount(BuildContext context) {
    // Navigating to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SuccessScreen()),
    );
     // Show the dialog immediately after entering the screen
   _showSuccessDialog(context);
  }
    void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Column(
              children: [
                Lottie.asset('assets/animations/instagram.json',height: 200,width: 200,repeat: false),
                SizedBox(height: 10),
                Text('Success!', style: TextStyle(color: Colors.purple, fontSize: 24)),
              ],
            ),
          ),
          content: const Text(
            'You now have a 3x better chance of finding a successful collaborator on Instagram!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.purple),
          ),
          actions: [
            TextButton(
              child: Text('Awesome!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
