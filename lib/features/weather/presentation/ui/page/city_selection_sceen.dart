import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/weather_provider.dart';
import 'current_weather_screen.dart';

class CitySelectionScreen extends ConsumerStatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  ConsumerState<CitySelectionScreen> createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends ConsumerState<CitySelectionScreen> {
  final _controller = TextEditingController();

  void _search() {
    final city = _controller.text.trim();
    if (city.isNotEmpty) {
      ref.read(weatherProvider.notifier).fetchWeather(city);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CurrentWeatherScreen(city: city)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select City')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter city name',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _search, child: const Text('Search')),
          ],
        ),
      ),
    );
  }
}
