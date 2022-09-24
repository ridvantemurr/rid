import 'package:aranan_kan/models/paylasilan_kan.dart';
import 'package:location/location.dart';

import 'models/bildirimler.dart';

class Sabit {
  static final Sabit _instance = Sabit._internal();
  factory Sabit() => _instance;
  Sabit._internal();
  List<PaylasilanKan> kanListesi = [];
  List<Bildirimler> kanBildirimleri = [];
  late LocationData currentLocation;
  lokasyonAl(
      String hastane, String kanGrubu, String uzaklik, DateTime saat) async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    currentLocation = await location.getLocation();
    print(currentLocation);
    kanListesi.add(PaylasilanKan(
      hastane: hastane,
      kanGrubu: kanGrubu,
      saat: saat,
      uzaklik: uzaklik,
    ));
  }
}
