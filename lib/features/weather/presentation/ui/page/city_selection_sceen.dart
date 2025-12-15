import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/core/utils/app_routes.dart';
import '../../../../../core/res/dimensions.dart';
import '../../providers/weather_provider.dart';
import 'current_weather_screen.dart';

class CitySelectionScreen extends ConsumerStatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  ConsumerState<CitySelectionScreen> createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends ConsumerState<CitySelectionScreen> {
  final _controller = TextEditingController();
  final  _searchFocusNode = FocusNode();
  void _search() {
    final city = _controller.text.trim();
    if (city.isNotEmpty) {
      _searchFocusNode.unfocus();
      ref.read(weatherProvider.notifier).fetchWeather(city);
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.initial, (Route route) => false);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Container(
       decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          focusNode: _searchFocusNode,
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Enter city name',
            hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: Dimensions.paddingS),
            prefixIcon: Icon(Icons.search, color: colorScheme.onSurfaceVariant),
          ),
          style: TextStyle(color: colorScheme.onSurface),
          cursorColor: colorScheme.primary,
          onSubmitted: (String value){
            _search.call();
          },
        ),
      ),

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed:_search,
          ),
        ],),

    );
  }
}
