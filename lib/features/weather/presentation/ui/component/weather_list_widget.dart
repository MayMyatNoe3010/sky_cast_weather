import 'package:flutter/material.dart';

import '../../../../../core/res/styles.dart';
import '../../../domain/entities/weather.dart';

class WeatherListWidget extends StatelessWidget {
  List<Weather> data;
  WeatherListWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index){
          Weather toDo = data[index];
          return GestureDetector(
            onTap: (){

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


      ),
    );
  }
}


