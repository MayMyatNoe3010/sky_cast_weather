import '../../data/models/forecast_response.dart';
import 'coord.dart';

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int timezone;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.timezone,
  });
}
