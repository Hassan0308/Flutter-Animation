import 'package:flutter/material.dart';
import 'package:flutter_animation/model/info_card_model.dart';
import 'package:flutter_animation/util/color_resources.dart';

class InfoCardProvider with ChangeNotifier {
  final List<InfoCard> _infoCards = [
   InfoCard(
  title: "How can I reduce my carbon footprint at home?", 
  content: "Use energy-efficient appliances and switch to LED lighting. Turn off lights and electronics when not in use. Insulate your home properly to reduce heating and cooling energy.", 
  color: ColorResources.red
),

InfoCard(
  title: "How can businesses contribute to combating global warming?", 
  content: "Invest in renewable energy sources like solar or wind to power operations. Implement energy-efficient technologies and encourage energy-saving habits among employees.", 
  color: ColorResources.green
),

InfoCard(
  title: "What is the role of transportation in global warming, and how can I make a difference?", 
  content: "Opt for public transportation, carpool, or use ride-sharing services to reduce the number of vehicles on the road. Choose electric or hybrid vehicles that produce fewer emissions.", 
  color: ColorResources.orange
),

InfoCard(
  title: "How can schools and educational institutions promote climate awareness and action?", 
  content: "Incorporating environmental education into their curriculum to teach students about climate change and sustainability. Reducing waste by implementing recycling programs and composting organic waste.", 
  color: ColorResources.purple
)

  ];

  List<InfoCard> get infoCards => _infoCards;

  void toggleCard(int index) {
    for (int i = 0; i < _infoCards.length; i++) {
      if (i == index) {
        _infoCards[i].isExpanded = !_infoCards[i].isExpanded;
         notifyListeners();
      } else {
        _infoCards[i].isExpanded = false; 
         notifyListeners();
      }
    }
    notifyListeners();
  }
}
