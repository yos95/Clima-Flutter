import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class Location {
  var logger = Logger();
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      logger.d('$latitude et la long : $longitude');
    } catch (e) {
      print(e);
    }
  }
}
