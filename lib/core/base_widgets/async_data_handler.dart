
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_error_widget.dart';

class AsyncDataHandler<T> extends ConsumerWidget {
  final AsyncValue<T> value;
  final Widget Function(BuildContext, T) onData;

  AsyncDataHandler({super.key, required this.value, required this.onData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
      
      data: (data) {
        final isEmpty = (data is Iterable && data.isEmpty) ||
            (data is Map && data.isEmpty) ||
            (data is String && data.isEmpty);
        if (data == null || isEmpty) {
        return NoTaskWidget();
      }

      return onData(context, data);
      },
      error: (error, stackTrace) {
        return CustomErrorWidget(lbError: error.toString(), color: Colors.red);
      },
      loading: () {
        return Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              Text('Loading')
            ]
          ),
        );
      },
    );
  }
}


