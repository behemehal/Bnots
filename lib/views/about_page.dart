import 'package:bnots/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'open_source_licenses.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLanguageItem(language, 8)),
        backgroundColor: themeSecondary,
      ),
      backgroundColor: themeMain,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Image(
                image: AssetImage('assets/Bnots.png'),
                width: 150,
                height: 150,
              ),
            ),
            Text(
              "Bnots",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: themeSecondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                getLanguageItem(language, 3),
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OpenSourceLicenses(),
                  ),
                );
              },
              child: Text(
                getLanguageItem(1, 9),
              ),
            ),
            TextButton(
              onPressed: () {
                launch(
                    "https://github.com/behemehal/Bnots/blob/main/privacy_policy.md");
              },
              child: Text(
                getLanguageItem(1, 11),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Material(
                color: Colors.transparent,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    launch("https://github.com/behemehal/Bnots");
                  },
                  child: const Image(
                    image: AssetImage('assets/git.png'),
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                const Text(
                  "Made by",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Image(
                  image: AssetImage("assets/behemehalLogo.png"),
                  width: 25,
                  height: 25,
                ),
                TextButton(
                  onPressed: () {
                    launch("https://behemehal.net");
                  },
                  child: const Text(
                    "Behemehal",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
