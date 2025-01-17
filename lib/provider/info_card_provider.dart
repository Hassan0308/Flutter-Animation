import 'package:flutter/material.dart';
import 'package:flutter_animation/model/info_card_model.dart';
import 'package:flutter_animation/util/color_resources.dart';

class InfoCardProvider with ChangeNotifier {
  final List<InfoCard> _infoCards = [
   InfoCard(
  title: "How can I reduce my carbon footprint at home?", 
  content: "You can reduce your carbon footprint by making small but impactful changes at home:\n- Use energy-efficient appliances and switch to LED lighting.\n- Turn off lights and electronics when not in use.\n- Insulate your home properly to reduce heating and cooling energy.\n- Use a programmable thermostat to optimize heating and cooling efficiency.\n- Adopt sustainable practices like reducing water consumption, using eco-friendly cleaning products, and minimizing waste by recycling.", 
  color: ColorResources.red
),

InfoCard(
  title: "How can businesses contribute to combating global warming?", 
  content: "Businesses can take several practical steps to reduce their environmental impact:\n- Invest in renewable energy sources like solar or wind to power operations.\n- Implement energy-efficient technologies and encourage energy-saving habits among employees.\n- Adopt green building certifications and sustainable sourcing practices.\n- Reduce waste by recycling and composting, and ensure sustainable packaging.\n- Encourage remote working to reduce commuting-related emissions.", 
  color: ColorResources.green
),

InfoCard(
  title: "What is the role of transportation in global warming, and how can I make a difference?", 
  content: "Transportation is a major contributor to greenhouse gas emissions, but you can help reduce it:\n- Opt for public transportation, carpool, or use ride-sharing services to reduce the number of vehicles on the road.\n- Choose electric or hybrid vehicles that produce fewer emissions.\n- Walk or bike for short distances instead of driving.\n- Drive efficiently by avoiding idling and maintaining a steady speed to improve fuel economy.", 
  color: ColorResources.orange
),

InfoCard(
  title: "How can schools and educational institutions promote climate awareness and action?", 
  content: "Schools can play a vital role in promoting climate awareness by:\n- Incorporating environmental education into their curriculum to teach students about climate change and sustainability.\n- Reducing waste by implementing recycling programs and composting organic waste.\n- Organizing tree planting activities and sustainable events.\n- Encouraging the use of reusable items like water bottles, lunch containers, and reducing plastic usage.\n- Supporting renewable energy projects, such as installing solar panels or using energy-efficient lighting systems.", 
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
