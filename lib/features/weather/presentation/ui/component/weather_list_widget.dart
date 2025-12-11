import 'package:flutter/material.dart';

import '../../../../../core/res/styles.dart';
import '../../../domain/entities/weather.dart';

class WeatherListWidget extends StatefulWidget {
  List<Weather> data;
  WeatherListWidget({super.key, required this.data});
  @override
  State<WeatherListWidget> createState() => _WeatherListState();
}
class _WeatherListState extends State<WeatherListWidget>{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.data.length,
        itemBuilder: (context, index){
          Weather toDo = widget.data[index];
          return GestureDetector(
            onTap: (){
              setState(() {
                toDo.copyWith(isComplete: !toDo.isComplete);
              });
            },
            child: WeatherItem(toDo: toDo,),
          );
        });
  }
}

class WeatherItem extends StatelessWidget {
  Weather toDo;

  WeatherItem({super.key, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: ListTile(
        leading: (toDo.isComplete)
            ? Icon(Icons.check_circle_outline, color: Theme
            .of(context)
            .primaryColor)
            : const Icon(Icons.circle_outlined),
        title:
        Text(toDo.title, style: Styles.getStringDeco(toDo.isComplete),),

      ),
    );
  }
}


