
import 'package:geolocator/geolocator.dart';

class MyPermissionGps {
  Future<Position> init() async{
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("Le gps n'est pas activé");
    } else {
      LocationPermission locationPermission =
          await Geolocator.checkPermission();
      return checkPermission(locationPermission);
    }
  }
  Future<Position> checkPermission(LocationPermission locationPermission) {
    switch (locationPermission) {
      case LocationPermission.deniedForever:
        return Future.error("refus de donnée l'accès");
      case LocationPermission.denied:
        return Geolocator.requestPermission()
            .then((value) => checkPermission(value));
      case LocationPermission.unableToDetermine:
        return Geolocator.checkPermission()
            .then((value) => checkPermission(value));
      case LocationPermission.whileInUse:
        return Geolocator.getCurrentPosition();
      case LocationPermission.always:
        return Geolocator.getCurrentPosition();
    }
  }
}
