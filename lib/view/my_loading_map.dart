import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ipssi_flutter/controller/my_permission_gps.dart';
import 'package:ipssi_flutter/view/my_map.dart';

class MyLoadingMap extends StatefulWidget {
  const MyLoadingMap({super.key});

  @override
  State<MyLoadingMap> createState() => _MyLoadingMapState();
}
class _MyLoadingMapState extends State<MyLoadingMap> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
        future: MyPermissionGps().init(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            if (!snap.hasData) {
              return const Center(
                child: Text("Nous ne pouvons afficher la carte"),
              );
            } else {
              Position myPosition = snap.data!;
              return MyMap(maPostion: myPosition);
            }
          }
        });
  }
}