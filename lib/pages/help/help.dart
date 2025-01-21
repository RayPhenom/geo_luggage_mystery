import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to the Help Screen!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Here you can find answers to frequently asked questions and get assistance.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'How can we help you today?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              'Frequently Asked Questions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Question 1
            InkWell(
              onTap: () {
                // Navigate to a specific URL or screen for Question 1
                _launchURL('https://www.example.com/reset-password');
              },
              child: const ListTile(
                leading: Icon(Icons.question_answer),
                title: Text('Question 1: How do I reset my password?'),
                // Add more details if needed
              ),
            ),
            // Question 2
            InkWell(
              onTap: () {
                // Navigate to a specific URL or screen for Question 2
                _launchURL('https://www.example.com/system-requirements');
              },
              child: const ListTile(
                leading: Icon(Icons.question_answer),
                title: Text('Question 2: What are the system requirements?'),
              ),
            ),
            // Question 3
            InkWell(
              onTap: () {
                // Navigate to a specific URL or screen for Question 3
                _launchURL('https://www.example.com/contact-support');
              },
              child: const ListTile(
                leading: Icon(Icons.question_answer),
                title: Text('Question 3: How do I contact support?'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Email
            InkWell(
              onTap: () {
                // Navigate to a specific URL or screen for Email
                _launchURL('mailto:support@lumuonix@gmail.com');
              },
              child: const ListTile(
                leading: Icon(Icons.email),
                title: Text('Email: support@lumuonix@gmail.com'),
              ),
            ),
            // Phone
            InkWell(
              onTap: () {
                // Navigate to a specific URL or screen for Phone
                _launchURL('tel:+254706935045');
              },
              child: const ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone: +254706935045'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}