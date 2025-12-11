import 'package:flutter/material.dart';

import '../res/dimensions.dart';
import '../res/strings.dart';

class CustomErrorWidget extends StatelessWidget {
  String lbError;
  Color? color;
  CustomErrorWidget({super.key, required this.lbError, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(lbError, style: TextStyle(color: color ?? Theme.of(context).colorScheme.primary),),

          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: Dimensions.marginL),
            child: Image.asset('assets/images/suspicious.png'),
          )
        ],
      ),
    );
  }
}
