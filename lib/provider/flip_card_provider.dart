import 'dart:async';
import 'package:flutter/material.dart';

class FlipCardProvider with ChangeNotifier {
  bool celebration = false; // Indicates if celebration animation is active
  bool isTimmer = false; // Indicates if the timer is running
  List<int> flippedIndexes = []; // Store indexes of currently flipped cards
  List<int> flippedIds = []; // Store IDs of currently flipped cards
  int timerSeconds = 30; // Timer duration in seconds
  Timer? _timer; // Timer instance for countdown
  bool isLose = false; // Indicates if the player has lost the game

  // Flips a card and checks for a match if two cards are flipped
  void flipCard(int index, int id) {
    if (!flippedIndexes.contains(index) && flippedIndexes.length < 2) {
      flippedIndexes.add(index);
      flippedIds.add(id);
      notifyListeners();

      if (flippedIndexes.length == 2) {
        checkMatch(); // Check if the two flipped cards match
      }
    }
  }

  // Starts the timer countdown
  void triggerTimmer() {
    isTimmer = true;
    startTimer(); // Initiates the timer
  }

  // Checks if the flipped cards match
  void checkMatch() {
    if (flippedIds[0] == flippedIds[1]) {
      Future.delayed(const Duration(seconds: 1), triggerCelebration); // Trigger celebration for a match
      stopTimer(); // Stops the timer
    } else {
      Future.delayed(const Duration(seconds: 1), resetCards); // Reset cards if they don't match
    }
  }

  // Activates celebration animation
  void triggerCelebration() {
    celebration = true;
    notifyListeners();
  }

  // Resets celebration state
  void resetCelebration() {
    celebration = false;
    notifyListeners();
  }

  // Resets the lose state
  void resetLose() {
    isLose = false;
    notifyListeners();
  }

  // Resets the flipped cards
  void resetCards() {
    flippedIndexes.clear();
    flippedIds.clear();
    notifyListeners();
  }

  // Starts the countdown timer
  void startTimer() {
    timerSeconds = 30; // Reset to 30 seconds
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        timerSeconds--; // Decrease time
        notifyListeners();
      } else {
        isLose = true; // Player loses when time runs out
        notifyListeners();
        stopTimer();
        resetCards(); // Reset cards when time is up
      }
    });
  }

  // Stops the timer
  void stopTimer() {
    _timer?.cancel(); // Cancel the timer
    isTimmer = false; // Timer is no longer active
  }

  // Resets the entire game state
  void resetGame() {
    celebration = false;
    isTimmer = false;
    isLose = false;
    flippedIndexes.clear();
    flippedIds.clear();
    timerSeconds = 30; // Reset timer
    notifyListeners();
  }

  // Dispose method to clean up the timer
  @override
  void dispose() {
    _timer?.cancel(); // Ensure the timer is cancelled
    super.dispose();
  }
}
