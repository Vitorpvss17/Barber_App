import 'package:url_launcher/url_launcher.dart';

void launchMaps(double latitude, double longitude) async {
  late double latitude = -11.0068294;
  late double longitude = -37.089269;
  final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'Não foi possível abrir o Google Maps';
  }
}