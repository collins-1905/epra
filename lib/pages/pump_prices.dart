import 'dart:io';

import 'package:epra/models/pump_prices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petroleum Towns',
      home: PetroleumTownWidget(),
    );
  }
}

class PetroleumTownWidget extends StatefulWidget {
  @override
  _PetroleumTownWidgetState createState() => _PetroleumTownWidgetState();
}

class _PetroleumTownWidgetState extends State<PetroleumTownWidget> {
  String selectedTownID = '';
  String townName = '';
  String productText = '';
  String pumpPrice = '';

  Future<List<PetroleumPrice>> getPumpPrices(String townID) async {
    try {
      var response = await http.get(Uri.parse(
          'https://portal.erc.go.ke:8200/api/ussdservices/pumpprice?token=w8VcxKr77f6tn4GSVfBe5jiJYag5R4km&PetroleumTownID=${townID}'));
      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body)['message'];
        List<PetroleumPrice> prices = responseData.map((data) {
          return PetroleumPrice.fromJson(data);
        }).toList();

        // Now 'prices' contains the parsed data for each product in the town
        // Do what you need to do with this data
        for (var price in prices) {
          print(
              'Town: ${price.townName}, Product: ${price.productText}, Price: ${price.pumpPrice}');
        }
        return prices;
      } else {
        throw Exception('Failed to Load');
      }
    } catch (e) {
      if (e is SocketException) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                  'Failed to fetch pump prices. Please check your internet connection.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
      // Re-throw the exception to propagate it to the calling code
      throw e;
    }
  }

  Future<void> showPumpPricesDialog(
      String townName, List<PetroleumPrice> prices) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(townName),
          content: SingleChildScrollView(
            child: ListBody(
              children: prices.map((price) {
                return ListTile(
                  title: Text(price.productText),
                  subtitle: Text('Price: ${price.pumpPrice}'),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Sample list of petroleum towns with IDs
  List<Map<String, dynamic>> petroleumTowns = [
    {"PetroleumTownID": "1", "PetroleumTownName": "Mombasa"},
    {"PetroleumTownID": "2", "PetroleumTownName": "Kilifi"},
    {"PetroleumTownID": "3", "PetroleumTownName": "Likoni Mainland"},
    {"PetroleumTownID": "4", "PetroleumTownName": "Kwale"},
    {"PetroleumTownID": "5", "PetroleumTownName": "Malindi"},
    {"PetroleumTownID": "6", "PetroleumTownName": "Lungalunga"},
    {"PetroleumTownID": "7", "PetroleumTownName": "Voi"},
    {"PetroleumTownID": "8", "PetroleumTownName": "Taveta"},
    {"PetroleumTownID": "9", "PetroleumTownName": "Lamu"},
    {"PetroleumTownID": "10", "PetroleumTownName": "Nairobi"},
    {"PetroleumTownID": "11", "PetroleumTownName": "Thika"},
    {"PetroleumTownID": "12", "PetroleumTownName": "Machakos"},
    {"PetroleumTownID": "13", "PetroleumTownName": "Kajiado"},
    {"PetroleumTownID": "14", "PetroleumTownName": "Makuyu"},
    {"PetroleumTownID": "15", "PetroleumTownName": "Muranga"},
    {"PetroleumTownID": "16", "PetroleumTownName": "Sagana"},
    {"PetroleumTownID": "17", "PetroleumTownName": "Embu"},
    {"PetroleumTownID": "18", "PetroleumTownName": "Kerugoya"},
    {"PetroleumTownID": "19", "PetroleumTownName": "Narok"},
    {"PetroleumTownID": "20", "PetroleumTownName": "Nyeri"},
    {"PetroleumTownID": "21", "PetroleumTownName": "Namanga"},
    {"PetroleumTownID": "22", "PetroleumTownName": "Kiganjo"},
    {"PetroleumTownID": "23", "PetroleumTownName": "Chuka"},
    {"PetroleumTownID": "24", "PetroleumTownName": "Kitui"},
    {"PetroleumTownID": "25", "PetroleumTownName": "Mwingi"},
    {"PetroleumTownID": "26", "PetroleumTownName": "Nanyuki"},
    {"PetroleumTownID": "27", "PetroleumTownName": "Nkubu"},
    {"PetroleumTownID": "28", "PetroleumTownName": "Mtito Andei"},
    {"PetroleumTownID": "29", "PetroleumTownName": "Meru"},
    {"PetroleumTownID": "30", "PetroleumTownName": "Isiolo"},
    {"PetroleumTownID": "31", "PetroleumTownName": "Maua"},
    {"PetroleumTownID": "32", "PetroleumTownName": "Garisa"},
    {"PetroleumTownID": "33", "PetroleumTownName": "Marsabit"},
    {"PetroleumTownID": "34", "PetroleumTownName": "Liboi"},
    {"PetroleumTownID": "35", "PetroleumTownName": "Wajir"},
    {"PetroleumTownID": "36", "PetroleumTownName": "Mandera"},
    {"PetroleumTownID": "37", "PetroleumTownName": "Nakuru"},
    {"PetroleumTownID": "38", "PetroleumTownName": "Gilgil"},
    {"PetroleumTownID": "39", "PetroleumTownName": "Mogotio"},
    {"PetroleumTownID": "40", "PetroleumTownName": "Molo"},
    {"PetroleumTownID": "41", "PetroleumTownName": "Londiani"},
    {"PetroleumTownID": "42", "PetroleumTownName": "Nyahururu"},
    {"PetroleumTownID": "43", "PetroleumTownName": "Naivasha"},
    {"PetroleumTownID": "44", "PetroleumTownName": "Marigat"},
    {"PetroleumTownID": "45", "PetroleumTownName": "Kabarnet"},
    {"PetroleumTownID": "46", "PetroleumTownName": "Bomet"},
    {"PetroleumTownID": "47", "PetroleumTownName": "Maral"},
    {"PetroleumTownID": "48", "PetroleumTownName": "Eldoret"},
    {"PetroleumTownID": "49", "PetroleumTownName": "Kapsabet"},
    {"PetroleumTownID": "50", "PetroleumTownName": "Webuye"},
    {"PetroleumTownID": "51", "PetroleumTownName": "Kitale"},
    {"PetroleumTownID": "52", "PetroleumTownName": "Kapenguria"},
    {"PetroleumTownID": "53", "PetroleumTownName": "Bungoma"},
    {"PetroleumTownID": "54", "PetroleumTownName": "Malaba"},
    {"PetroleumTownID": "55", "PetroleumTownName": "Lokichogio"},
    {"PetroleumTownID": "56", "PetroleumTownName": "Kisumu"},
    {"PetroleumTownID": "57", "PetroleumTownName": "Sondu"},
    {"PetroleumTownID": "58", "PetroleumTownName": "Oyugis"},
    {"PetroleumTownID": "59", "PetroleumTownName": "Kakamega"},
    {"PetroleumTownID": "60", "PetroleumTownName": "Bondo"},
    {"PetroleumTownID": "61", "PetroleumTownName": "Siaya"},
    {"PetroleumTownID": "62", "PetroleumTownName": "Kericho"},
    {"PetroleumTownID": "63", "PetroleumTownName": "Nyamira"},
    {"PetroleumTownID": "64", "PetroleumTownName": "Kisii"},
    {"PetroleumTownID": "65", "PetroleumTownName": "Sotik"},
    {"PetroleumTownID": "66", "PetroleumTownName": "Keroka"},
    {"PetroleumTownID": "67", "PetroleumTownName": "Busia"},
    {"PetroleumTownID": "68", "PetroleumTownName": "Homabay"},
    {"PetroleumTownID": "69", "PetroleumTownName": "Migori"},
    {"PetroleumTownID": "70", "PetroleumTownName": "Isebania"},
    {"PetroleumTownID": "71", "PetroleumTownName": "Hola"},
    {"PetroleumTownID": "72", "PetroleumTownName": "Olenguruone"},
    {"PetroleumTownID": "73", "PetroleumTownName": "Moyale"},
    {"PetroleumTownID": "74", "PetroleumTownName": "Sololo"},
    {"PetroleumTownID": "75", "PetroleumTownName": "Habaswein"},
    {"PetroleumTownID": "76", "PetroleumTownName": "Dadaab"},
    {"PetroleumTownID": "77", "PetroleumTownName": "Tarbaj"},
    {"PetroleumTownID": "78", "PetroleumTownName": "Elwak"},
    {"PetroleumTownID": "79", "PetroleumTownName": "Archers Post"},
    {"PetroleumTownID": "80", "PetroleumTownName": "Lodosoit"},
    {"PetroleumTownID": "81", "PetroleumTownName": "Moiben"},
    {"PetroleumTownID": "82", "PetroleumTownName": "Matunda"},
    {"PetroleumTownID": "83", "PetroleumTownName": "Burnt Forest"},
    {"PetroleumTownID": "84", "PetroleumTownName": "Tambach"},
    {"PetroleumTownID": "85", "PetroleumTownName": "Kapsowar"},
    {"PetroleumTownID": "86", "PetroleumTownName": "Chebara"},
    {"PetroleumTownID": "87", "PetroleumTownName": "Kimwarer"},
    {"PetroleumTownID": "88", "PetroleumTownName": "Timboroa"},
    {"PetroleumTownID": "89", "PetroleumTownName": "Nandi Hills"},
    {"PetroleumTownID": "90", "PetroleumTownName": "Kaiboi"},
    {"PetroleumTownID": "91", "PetroleumTownName": "Kiminini"},
    {"PetroleumTownID": "92", "PetroleumTownName": "Endebes"},
    {"PetroleumTownID": "93", "PetroleumTownName": "Saboti"},
    {"PetroleumTownID": "94", "PetroleumTownName": "Chepareria"},
    {"PetroleumTownID": "95", "PetroleumTownName": "Lomut"},
    {"PetroleumTownID": "96", "PetroleumTownName": "Burgich"},
    {"PetroleumTownID": "97", "PetroleumTownName": "Sigor"},
    {"PetroleumTownID": "98", "PetroleumTownName": "Lodwar"},
    {"PetroleumTownID": "99", "PetroleumTownName": "Kakuma"},
    {"PetroleumTownID": "100", "PetroleumTownName": "Lokori"},
    {"PetroleumTownID": "101", "PetroleumTownName": "Lokitaung"},
    {"PetroleumTownID": "102", "PetroleumTownName": "Kapedo"},
    {"PetroleumTownID": "103", "PetroleumTownName": "Maralal"},
    {"PetroleumTownID": "104", "PetroleumTownName": "Lokichar"},
    {"PetroleumTownID": "105", "PetroleumTownName": "Kalokol"},
    {"PetroleumTownID": "106", "PetroleumTownName": "Modogashe"},
    {"PetroleumTownID": "107", "PetroleumTownName": "Kiplombe"},
    {"PetroleumTownID": "108", "PetroleumTownName": "Iten"},
    {"PetroleumTownID": "109", "PetroleumTownName": "Naiberi"},
    {"PetroleumTownID": "110", "PetroleumTownName": "Kesses"},
    {"PetroleumTownID": "111", "PetroleumTownName": "Ziwa"},
    {"PetroleumTownID": "112", "PetroleumTownName": "Soy"},
    {"PetroleumTownID": "113", "PetroleumTownName": "Moi's Bridge"},
    {"PetroleumTownID": "114", "PetroleumTownName": "Turbo"},
    {"PetroleumTownID": "115", "PetroleumTownName": "Kibish"},
    {"PetroleumTownID": "116", "PetroleumTownName": "Nakalale"},
    {"PetroleumTownID": "117", "PetroleumTownName": "Loima"},
    {"PetroleumTownID": "118", "PetroleumTownName": "Lokiriama"},
    {"PetroleumTownID": "119", "PetroleumTownName": "Kainuk"},
    {"PetroleumTownID": "120", "PetroleumTownName": "Kacheliba"},
    {"PetroleumTownID": "121", "PetroleumTownName": "Kiwawa"},
    {"PetroleumTownID": "122", "PetroleumTownName": "Ortum"},
    {"PetroleumTownID": "123", "PetroleumTownName": "Kachibora"},
    {"PetroleumTownID": "124", "PetroleumTownName": "Kwanza"},
    {"PetroleumTownID": "125", "PetroleumTownName": "Kaplamai"},
    {"PetroleumTownID": "126", "PetroleumTownName": "Eldama Ravine"},
    {"PetroleumTownID": "127", "PetroleumTownName": "Tenges"},
    {"PetroleumTownID": "128", "PetroleumTownName": "Barwessa"},
    {"PetroleumTownID": "129", "PetroleumTownName": "Kipsaraman"},
    {"PetroleumTownID": "130", "PetroleumTownName": "Loruk"},
    {"PetroleumTownID": "131", "PetroleumTownName": "Kabartonjo"},
    {"PetroleumTownID": "132", "PetroleumTownName": "Tindiret"},
    {"PetroleumTownID": "133", "PetroleumTownName": "O'lessos"},
    {"PetroleumTownID": "134", "PetroleumTownName": "Kobujoj"},
    {"PetroleumTownID": "135", "PetroleumTownName": "Serem"},
    {"PetroleumTownID": "136", "PetroleumTownName": "Kabiyet"},
    {"PetroleumTownID": "137", "PetroleumTownName": "Cheptulu"},
    {"PetroleumTownID": "138", "PetroleumTownName": "Songor"},
    {"PetroleumTownID": "139", "PetroleumTownName": "Kapcherop"},
    {"PetroleumTownID": "140", "PetroleumTownName": "Sambalat"},
    {"PetroleumTownID": "141", "PetroleumTownName": "Arror"},
    {"PetroleumTownID": "142", "PetroleumTownName": "Tot"},
    {"PetroleumTownID": "143", "PetroleumTownName": "Kaptarakwa"},
    {"PetroleumTownID": "144", "PetroleumTownName": "Mumias"},
    {"PetroleumTownID": "145", "PetroleumTownName": "Muhoroni"},
    {"PetroleumTownID": "146", "PetroleumTownName": "Mbita"},
    {"PetroleumTownID": "147", "PetroleumTownName": "Mbale"},
    {"PetroleumTownID": "148", "PetroleumTownName": "Etago"},
    {"PetroleumTownID": "149", "PetroleumTownName": "Magenche"},
    {"PetroleumTownID": "150", "PetroleumTownName": "Kilgoris"},
    {"PetroleumTownID": "151", "PetroleumTownName": "Samburu"},
    {"PetroleumTownID": "152", "PetroleumTownName": "Taru"},
    {"PetroleumTownID": "153", "PetroleumTownName": "Kaloleni"},
    {"PetroleumTownID": "154", "PetroleumTownName": "Marereni"},
    {"PetroleumTownID": "155", "PetroleumTownName": "Garsen"},
    {"PetroleumTownID": "156", "PetroleumTownName": "Minjila"},
    {"PetroleumTownID": "158", "PetroleumTownName": "Mpeketoni"},
    {"PetroleumTownID": "159", "PetroleumTownName": "Mwatate"},
    {"PetroleumTownID": "160", "PetroleumTownName": "Wundanyi"},
    {"PetroleumTownID": "161", "PetroleumTownName": "Bute"},
    {"PetroleumTownID": "162", "PetroleumTownName": "Eldas"},
    {"PetroleumTownID": "163", "PetroleumTownName": "Hadado"},
    {"PetroleumTownID": "164", "PetroleumTownName": "Kalacha"},
    {"PetroleumTownID": "165", "PetroleumTownName": "Korr"},
    {"PetroleumTownID": "166", "PetroleumTownName": "Laisamis"},
    {"PetroleumTownID": "167", "PetroleumTownName": "Loyangalani"},
    {"PetroleumTownID": "168", "PetroleumTownName": "Maikona"},
    {"PetroleumTownID": "169", "PetroleumTownName": "Merille"},
    {"PetroleumTownID": "170", "PetroleumTownName": "North Horr"},
    {"PetroleumTownID": "171", "PetroleumTownName": "Turbi"},
    {"PetroleumTownID": "172", "PetroleumTownName": "Merti"},
    {"PetroleumTownID": "173", "PetroleumTownName": "Oldonyiro"},
    {"PetroleumTownID": "174", "PetroleumTownName": "Marimanti"},
    {"PetroleumTownID": "175", "PetroleumTownName": "Mutuobare"},
    {"PetroleumTownID": "176", "PetroleumTownName": "Matuu"},
    {"PetroleumTownID": "177", "PetroleumTownName": "Kalemngorok"},
    {"PetroleumTownID": "178", "PetroleumTownName": "Kapese"},
    {"PetroleumTownID": "179", "PetroleumTownName": "Alale"},
    {"PetroleumTownID": "180", "PetroleumTownName": "Asilong"},
    {"PetroleumTownID": "181", "PetroleumTownName": "Chepkorniswo"},
    {"PetroleumTownID": "182", "PetroleumTownName": "Kaibichbich"},
    {"PetroleumTownID": "183", "PetroleumTownName": "Keringet"},
    {"PetroleumTownID": "184", "PetroleumTownName": "Kunyao"},
    {"PetroleumTownID": "185", "PetroleumTownName": "Marich"},
    {"PetroleumTownID": "186", "PetroleumTownName": "Morpus"},
    {"PetroleumTownID": "187", "PetroleumTownName": "Orolwo"},
    {"PetroleumTownID": "188", "PetroleumTownName": "Sebit"},
    {"PetroleumTownID": "189", "PetroleumTownName": "Wamba"},
    {"PetroleumTownID": "190", "PetroleumTownName": "Doldo"},
    {"PetroleumTownID": "191", "PetroleumTownName": "Lamuria"},
    {"PetroleumTownID": "192", "PetroleumTownName": "Rumuruti"},
    {"PetroleumTownID": "193", "PetroleumTownName": "Sipili"},
    {"PetroleumTownID": "194", "PetroleumTownName": "Mai Mahiru"},
    {"PetroleumTownID": "197", "PetroleumTownName": "Lugari"},
    {"PetroleumTownID": "198", "PetroleumTownName": "Malava"},
    {"PetroleumTownID": "199", "PetroleumTownName": "Chwele"},
    {"PetroleumTownID": "200", "PetroleumTownName": "Kaspokwony"},
    {"PetroleumTownID": "201", "PetroleumTownName": "Kimilili"},
    {"PetroleumTownID": "202", "PetroleumTownName": "Funyula"},
    {"PetroleumTownID": "203", "PetroleumTownName": "Nambale"},
    {"PetroleumTownID": "204", "PetroleumTownName": "Port Bunyala"},
    {"PetroleumTownID": "205", "PetroleumTownName": "Sio Port"},
    {"PetroleumTownID": "206", "PetroleumTownName": "Asembo"},
    {"PetroleumTownID": "207", "PetroleumTownName": "Harambee"},
    {"PetroleumTownID": "208", "PetroleumTownName": "Ugunja"},
    {"PetroleumTownID": "209", "PetroleumTownName": "Usenge"},
    {"PetroleumTownID": "210", "PetroleumTownName": "Ahero"},
    {"PetroleumTownID": "211", "PetroleumTownName": "Awasi"},
    {"PetroleumTownID": "212", "PetroleumTownName": "Ndhiwa"},
    {"PetroleumTownID": "213", "PetroleumTownName": "Rangwe"},
    {"PetroleumTownID": "214", "PetroleumTownName": "Rodi Kopany"},
    {"PetroleumTownID": "215", "PetroleumTownName": "Sindo"},
    {"PetroleumTownID": "216", "PetroleumTownName": "Kehancha"},
    {"PetroleumTownID": "217", "PetroleumTownName": "Muhuru Bay"},
    {"PetroleumTownID": "218", "PetroleumTownName": "Ntimaru"},
    {"PetroleumTownID": "219", "PetroleumTownName": "Rongo"},
    {"PetroleumTownID": "220", "PetroleumTownName": "Kerina"},
    {"PetroleumTownID": "221", "PetroleumTownName": "Keumbu"},
    {"PetroleumTownID": "222", "PetroleumTownName": "Marani"},
    {"PetroleumTownID": "223", "PetroleumTownName": "Nyangusu"},
    {"PetroleumTownID": "224", "PetroleumTownName": "Ogembo"},
    {"PetroleumTownID": "225", "PetroleumTownName": "Sengera"},
    {"PetroleumTownID": "226", "PetroleumTownName": "Ikonge"},
    {"PetroleumTownID": "227", "PetroleumTownName": "Nyansiongo"}
  ];

  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];

  void updateSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults.clear();
      });
      return;
    }

    List<Map<String, dynamic>> _searchResults = petroleumTowns
        .where((town) => town['PetroleumTownName']
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    setState(() {
      searchResults = _searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CURRENT PUMP PRICES'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                updateSearchResults(value);
              },
              decoration: InputDecoration(
                labelText: 'Search Towns',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index]['PetroleumTownName']),
                    onTap: () {
                      // Pass the selected town ID to the text editing controller
                      String selectedTownID =
                          searchResults[index]['PetroleumTownID'];
                      getPumpPrices(selectedTownID).then((prices) {
                        showPumpPricesDialog(
                            searchResults[index]['PetroleumTownName'], prices);
                      });
                      // Here you can use selectedTownID as needed
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
