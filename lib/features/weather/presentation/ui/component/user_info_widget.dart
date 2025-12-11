import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/res/dimensions.dart';

class UserInfoWidget extends StatelessWidget {
  int totalTodo;
  String? userName, profileImage;
  UserInfoWidget({super.key, required this.totalTodo, required this.userName, this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Text('Hello, $userName', style: TextStyle(fontSize: Dimensions.titleFontSize, fontWeight: FontWeight.bold),),
            Text('You have $totalTodo tasks today'),
          ],

        ),
        CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.black,
          child: (profileImage == null)? Image.asset('assets/images/surprise.png'): Image.network(profileImage!),
        ),


      ],
    );
  }
}
