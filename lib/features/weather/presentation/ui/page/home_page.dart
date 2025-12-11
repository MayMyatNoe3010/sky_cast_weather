import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/base_widgets/async_data_handler.dart';
import '../../../../../core/res/dimensions.dart';
import '../../../domain/entities/weather.dart';
import '../../providers/weather_provider.dart';
import '../component/weather_list_widget.dart';
import '../component/user_info_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Init');
    Future.microtask(() {
      ref.read(weatherProvider.notifier).getTasks(DateTime.now().toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final toDos = ref.watch(weatherProvider);
    final width = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimensions.paddingM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              toDos.when(
                data:
                    (tasks) => UserInfoWidget(
                      totalTodo: tasks.length,
                      userName: 'MMN',
                    ),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              ),
              Container(
                width: width,
                height: width,
                margin: EdgeInsets.symmetric(vertical: Dimensions.marginM),
                child:  Lottie.asset('assets/LottieLogo1.json'),
              ),
              Expanded(
                flex: 1,
                child: AsyncDataHandler<List<Weather>>(
                  value: toDos,
                  onData: (context, tasks) => WeatherListWidget(data: tasks),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
