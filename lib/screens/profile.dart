import 'package:flutter/material.dart';
import 'package:smartfoodapp/theme/app_theme.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 👈 yeh add karna hai
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 140, color: AppColors.gradientEnd),
          Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
          ),
          Text(
            "Comming Soon",
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
