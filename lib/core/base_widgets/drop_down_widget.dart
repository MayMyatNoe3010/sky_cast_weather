import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base_models/drop_down_model.dart';
import '../res/dimensions.dart';



class DropDownWidget extends StatefulWidget {
  List<DropDownItem>? itemList = [];
  String hint;
  Function selectedCallback;
  DropDownItem? selectedItem;
  Function? validateFunction;

  final GlobalKey<FormFieldState> dropDownKey = GlobalKey();
  final formKey = GlobalKey<FormState>();
  final tec = TextEditingController();

  DropDownWidget(
      {super.key,
        this.itemList,
        required this.hint,
        required this.selectedCallback,
        this.selectedItem,
        this.validateFunction}) {
    itemList ??= [];
    if (selectedItem != null) {
      for (DropDownItem item in itemList!) {
        if (item.id == selectedItem?.id) {
          selectedItem = item;
        }
      }
    }
  }

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: Dimensions.marginS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reminder'),
          DropdownButtonFormField(
              key: widget.dropDownKey,
              validator: (validator) {
                return widget.validateFunction?.call(validator?.name);
              },
              //decoration: Styles.getDropDownBorder('hint'),
              hint: Text('Select ${widget.hint}',
                  style: const TextStyle(color: Color(0xFF9F9F9F))),
              value: widget.selectedItem,
              items: _getDropDownMenuItems(widget.itemList!),
              onChanged: (value) {
                setState(() {

                    widget.selectedItem = value;
                    widget.selectedCallback(value?.id);

                });
              }),
        ],
      ),
    );
  }

  List<DropdownMenuItem<DropDownItem>> _getDropDownMenuItems(
      List<DropDownItem> items) {
    List<DropdownMenuItem<DropDownItem>> list = [];
    for (var element in items) {
      log(element.name, name: 'DropDownMenuItem ${element.id}');
      list.add(DropdownMenuItem(
        value: element,
        child: Text(
          element.name ?? '',
          style: TextStyle(
              color: Colors.grey),
        ),
      ));
    }
    return list;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.itemList = null;
    super.dispose();
  }
}
class LoadingForDropDownWidget extends StatelessWidget {
  const LoadingForDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Center(
        child: Text(
          'Loading',
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
          )),
    );
  }
}