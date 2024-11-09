import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkIcon extends StatelessWidget {
  final String url;
  final IconData icon;
  final Color color;
  final double size;
  final String text;

  LinkIcon({
    required this.url,
    this.icon = Icons.link,
    this.color = Colors.blue,
    this.size = 30.0,
    this.text = '',
  });

  Future<void> _launchURL() async {
    // Check if the URL can be launched
    if (await canLaunch(url)) {
      // Launch the URL in a new browser tab
      await launch(url, webOnlyWindowName: '_blank');
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Row(
        children: [
          if (text != '')
            Text(
              text,
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          if (icon != Icons.link)
            Icon(
              icon,
              color: color,
              size: size,
            ),
        ],
      ),
    );
  }
}
