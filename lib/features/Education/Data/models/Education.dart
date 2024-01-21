import 'package:flutter/material.dart';

class EducationModel {
  final String title;
  final String description;
  final IconData icon;

  EducationModel({required this.title, required this.description, required this.icon});
}

class EducationData {
  static List<EducationModel> getEducationItems() {
    return [
      EducationModel(
        title: 'Understanding Carbon Footprint',
        description: 'Learn the basics of carbon footprint and its impact on the environment.',
        icon: Icons.school,
      ),
      EducationModel(
        title: 'Sustainable Living Tips',
        description: 'Explore practical tips to live a more sustainable and eco-friendly lifestyle.',
        icon: Icons.eco,
      ),
      EducationModel(
        title: 'Renewable Energy Sources',
        description: 'Discover different sources of renewable energy and their significance.',
        icon: Icons.lightbulb,
      ),
      EducationModel(
        title: 'Water Conservation Techniques',
        description: 'Learn effective techniques to conserve water and reduce wastage.',
        icon: Icons.opacity,
      ),
      EducationModel(
        title: 'Eco-Friendly Transportation',
        description: 'Explore eco-friendly transportation options for a greener commute.',
        icon: Icons.directions_car,
      ),
      EducationModel(
        title: 'The Importance of Biodiversity',
        description: 'Understand the importance of biodiversity and its impact on ecosystems.',
        icon: Icons.eco,
      ),
      EducationModel(
        title: 'Waste Management Strategies',
        description: 'Learn about effective waste management strategies to reduce environmental impact.',
        icon: Icons.delete,
      ),
      EducationModel(
        title: 'Introduction to Climate Change',
        description: 'Explore the causes and consequences of climate change on a global scale.',
        icon: Icons.cloud,
      ),
      EducationModel(
        title: 'Green Building Practices',
        description: 'Discover sustainable and energy-efficient practices in construction and architecture.',
        icon: Icons.home,
      ),
      EducationModel(
        title: 'Wildlife Conservation Efforts',
        description: 'Learn about ongoing efforts to conserve and protect endangered wildlife species.',
        icon: Icons.pets,
      ),
      // Add more education items as needed
    ];
  }
}
