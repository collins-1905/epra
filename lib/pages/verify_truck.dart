import 'package:epra/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerifyTruckWidget extends StatefulWidget {
  const VerifyTruckWidget({super.key});

  @override
  State<VerifyTruckWidget> createState() => _VerifyTruckWidgetState();
}

class _VerifyTruckWidgetState extends State<VerifyTruckWidget> {
  String licenceNumber = '';
  String contactCompanyName = '';
  String vehicleType = '';
  String licenceExpiryDate = '';
  bool isLoading = false;

  //http request
  Future<void> getTruck() async {
    var response = await http.get(Uri.parse(
        'https://portal.erc.go.ke:8200/api/ussdservices/verify-truck?token=w8VcxKr77f6tn4GSVfBe5jiJYag5R4km&TrackNumber=${_firstPlate.text}%20${_secondPlate.text}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> finalResponse =
          jsonDecode(response.body.replaceAll(RegExp(r'\[\s*|\s*\]'), ''));

      setState(() {
        licenceNumber = finalResponse['message']['LicenceNumber'];
        contactCompanyName = finalResponse['message']['ContactCompanyName'];
        vehicleType = finalResponse['message']['VehicleType'];
        licenceExpiryDate = finalResponse['message']['LicenceExpiryDate'];

        isLoading = false;
      });
      print(finalResponse);
    }
  }

  final _firstPlate = TextEditingController();
  final _secondPlate = TextEditingController();

  @override
  void dispose() {
    _firstPlate.dispose();
    _secondPlate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
        title: const Text("VERIFY TRUCK"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const CircularProgressIndicator()
            else if (licenceNumber.isNotEmpty)
              Column(children: [
                if (licenceNumber.isEmpty) const CircularProgressIndicator(),
                SizedBox(
                  height: 100,
                  child: Card(
                    color: const Color.fromARGB(255, 0, 187, 212),
                    child: ListTile(
                      title: Text(contactCompanyName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Licence Number $licenceNumber"),
                          Text(vehicleType),
                          Text("Expires on $licenceExpiryDate"),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            const Text(
              'Enter Vehicle Number Plate',
              style: TextStyle(
                fontSize: 18, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Adjust the font weight as needed
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // First Input Field
                  Flexible(
                    child: TextField(
                      controller: _firstPlate,
                      maxLength: 3,
                      //keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        //labelText: 'Field 1',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 20), // Add some space between the fields
                  // Second Input Field
                  Flexible(
                    child: TextField(
                      controller: _secondPlate,
                      maxLength: 4,
                      //keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        //labelText: 'Field 2',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              onPressed: () {
                getTruck();
              },
              color: Colors.blueGrey,
              child: const Text(
                "Check",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
