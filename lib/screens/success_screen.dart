import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SuccessScreen extends StatefulWidget {
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
    bool _isSuperLiked = false;

  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Post content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPost(),
              _buildPostDetails(),
            ],
          ),
          // Lottie Animation when Super Liked
          if (_isSuperLiked)
            Center(
              child: Lottie.asset(
                'assets/animations/like.json', 
                height: 250,
                width: 250,
                repeat: false,
                onLoaded: (composition) {
                  // After animation is done, reset
                  Future.delayed(composition.duration, () {
                    setState(() {
                      _isSuperLiked = false;
                    });
                  });
                },
              ),
            ),
        ],
      ),
   
    );
  }

   Widget _buildPost() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(
              'assets/images/sun.png'), 
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPostDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Beautiful Sunset in Hawaii',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Captured this incredible view during my vacation. 🌅 #sunset #nature #beauty',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                _triggerSuperLike();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Super Like',style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _triggerSuperLike() {
    setState(() {
      _isSuperLiked = true;
    });
  }

  
}

