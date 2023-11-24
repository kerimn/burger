import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/screens/about_restaurant.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset(AppImages.shield),
            title: Text(
              'Privacy Policy',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(AppImages.dokument),
            title: Text(
              'Terms of Use',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(AppImages.heart),
            title: Text(
              'Rate our app in the AppStore',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(AppImages.cofee),
            title: Text(
              'About our restaurant',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
