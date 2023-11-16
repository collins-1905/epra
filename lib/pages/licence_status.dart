import 'package:epra/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LicenceStatusWidget extends StatefulWidget {
  const LicenceStatusWidget({super.key});

  @override
  State<LicenceStatusWidget> createState() => _LicenceStatusWidgetState();
}

class _LicenceStatusWidgetState extends State<LicenceStatusWidget> {
  String contactCompanyName = '';
  String licenceExpiryDate = '';
  String licenceType = '';
  String licenceClass = '';
  String licenceStatus = '';
  bool isLoading = false;
  bool showErrorMessage = false;
  Future<void> getLicenceStatus() async {
    var response = await http.get(Uri.parse(
        'https://portal.erc.go.ke:8200/api/ussdservices/licencestatus?token=w8VcxKr77f6tn4GSVfBe5jiJYag5R4km&LicenceNumber=${_licenceNumberController.text}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> finalResponse = jsonDecode(response.body);

      setState(() {
        contactCompanyName = finalResponse['message']['ContactCompanyName'];
        licenceExpiryDate = finalResponse['message']['LicenceExpiryDate'];
        licenceType = finalResponse['message']['LicenceType'];
        licenceClass = finalResponse['message']['LicenceClass'];
        licenceStatus = finalResponse['message']['LicenceStatus'];
        //isLoading = false;
      });
    } else {
      showErrorMessage = true;
    }
    // print(finalResponse['message']['ContactCompanyName']);
  }

  final _licenceNumberController = TextEditingController();

  @override
  void dispose() {
    _licenceNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(237, 9, 137, 160),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
        title: const Text("CONFIRM EPRA LICENCE"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (isLoading)
              const CircularProgressIndicator()
            else if (contactCompanyName.isNotEmpty)
              // Show data only if it's not empty

              Column(children: [
                if (contactCompanyName.isEmpty)
                  const CircularProgressIndicator(),
                SizedBox(
                  height: 150,
                  child: Card(
                    color: Color.fromARGB(255, 0, 187, 212),
                    child: ListTile(
                      title: Text(contactCompanyName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expires on $licenceExpiryDate"),
                          Text("Licence Class: $licenceClass"),
                          Text("Licence Type: $licenceType"),
                          Text(licenceStatus),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            const SizedBox(height: 30),
            TextField(
              controller: _licenceNumberController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _licenceNumberController.clear();
                    },
                    icon: const Icon(Icons.clear),
                    color: Colors.red,
                  ),
                  hintText: "Enter Licence Number",
                  border: const OutlineInputBorder()),
            ),
            Text(
              showErrorMessage
                  ? "Licence not found"
                  : "", // Show the message if licenceStatus is empty
              style: TextStyle(
                  color: Colors.red), // You can customize the text style
            ),
            const SizedBox(height: 25),
            MaterialButton(
              elevation: 0,
              onPressed: () {
                getLicenceStatus();
              },
              color: Colors.green,
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
