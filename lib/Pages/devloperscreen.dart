import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for Clipboard
import 'package:get/get.dart'; // for Get.snackbar
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({Key? key}) : super(key: key);

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: const Text("Developer Details"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: CircleAvatar(
              maxRadius: 90,
              backgroundImage: AssetImage("assets/images/maaz images.jpeg"),
            ),
          ),
          _buildInfoCard("Name: Siddi Furqan Maz"),
          InkWell(
            onTap: _launchEmail,
            onLongPress: () {
              _copyToClipboard(context, "siddifurqanmaz@gmail.com");
            },
            child: _buildInfoCard("Email: siddifurqanmaz@gmail.com  🔗"),
          ),
          InkWell(
            onTap: () {
              _copyToClipboard(context, "https://github.com/Maazitm");
            },
            child: _buildInfoCard("GitHub: https://github.com/Maazitm"),
          ),
          InkWell(
            onTap: () {
              _copyToClipboard(
                  context, "https://www.linkedin.com/in/furqan-maz-2a57a0279/");
            },
            child: _buildInfoCard(
                "LinkedIn: https://www.linkedin.com/in/furqan-maz-2a57a0279/"),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String text) {
    return Container(
      height: 70,
      width: double.infinity,
      child: Card(
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'siddifurqanmaz@gmail.com',
      query: 'subject=Your Subject&body=Your Message',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      Get.snackbar(
        'Error',
        'Could not launch email client',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar(
      'Copied',
      'Text copied to clipboard',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}
