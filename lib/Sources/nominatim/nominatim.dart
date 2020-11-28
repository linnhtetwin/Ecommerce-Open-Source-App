import 'package:http/http.dart' as http;
import 'dart:convert';

class NominatimService {
  Future<List<Map>> getAddressLatLng(String address) async {
    var url =
        "https://nominatim.openstreetmap.org/search?q=${address.replaceAll(RegExp(' '), '+')}&format=json&addressdetails=1";
    // print(url);
    var response = await http.get(url);
    //  print('Response status: ${response.statusCode}');
    //  print('Response body: ${response.body}');
    List addresses = jsonDecode(response.body);
    List<Map> share = List<Map>();
    for (Map ad in addresses) {
      share.add({
        'lat': ad['lat'],
        'lng': ad['lon'],
        'description': ad['display_name'],
        'state': ad['address']['state'] == null ? " " : ad['address']['state'],
        'city': ad['address']['city'] == null ? " " : ad['address']['city'],
        'suburb':
            ad['address']['suburb'] == null ? " " : ad['address']['suburb'],
        'postcode':
            ad['address']['postcode'] == null ? " " : ad['address']['postcode'],
        'neighbourhood': ad['address']['neighbourhood'] == null
            ? " "
            : ad['address']['neighbourhood'],
        'road': ad['address']['road'] == null ? " " : ad['address']['road'],
      });
    }
    return share;
  }
}
