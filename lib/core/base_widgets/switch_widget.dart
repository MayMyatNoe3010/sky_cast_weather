

import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  String? title, subTitle;
  Function? onClickCallback;
  SwitchWidget({super.key, this.title, this.subTitle, this.onClickCallback});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
        value: _value,
        title: Text(widget.title ?? ''),
        subtitle: Text(widget.subTitle ?? ''),
        onChanged: (value){
      setState(() {
        _value = value;
      });
      widget.onClickCallback?.call(value);
    });
  }
}
