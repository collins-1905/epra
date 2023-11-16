import 'package:epra/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PPAStatusWidget extends StatefulWidget {
  const PPAStatusWidget({super.key});

  @override
  State<PPAStatusWidget> createState() => _PPAStatusWidgetState();
}

class _PPAStatusWidgetState extends State<PPAStatusWidget> {
  String projectTitle = '';
  String powerGenerator = '';
  String status = '';
  bool isLoading = false;
  bool showErrorMessage = false;
  Future<void> getLicenceStatus() async {
    var response = await http.get(Uri.parse(
        'https://portal.erc.go.ke:8200/api/ussdservices/licencestatus?token=w8VcxKr77f6tn4GSVfBe5jiJYag5R4km&LicenceNumber=${_ppaStatusController.text}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> finalResponse = jsonDecode(response.body);

      setState(() {
        projectTitle = finalResponse['message']['ProjectTitle'];
        powerGenerator = finalResponse['message']['PowerGenerator'];
        status = finalResponse['message']['Status'];
        //isLoading = false;
      });
    } else {
      showErrorMessage = true;
    }
    // print(finalResponse['message']['ContactCompanyName']);
  }

  final _ppaStatusController = TextEditingController();

  @override
  void dispose() {
    _ppaStatusController.dispose();
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
        title: const Text("CONFIRM PPA LICENCE"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (isLoading)
              const CircularProgressIndicator()
            else if (projectTitle.isNotEmpty)
              // Show data only if it's not empty

              Column(children: [
                if (projectTitle.isEmpty) const CircularProgressIndicator(),
                SizedBox(
                  height: 150,
                  child: Card(
                    color: Color.fromARGB(255, 0, 187, 212),
                    child: ListTile(
                      title: Text(projectTitle),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(projectTitle),
                          Text(powerGenerator),
                          Text(status),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            const SizedBox(height: 30),
            TextField(
              controller: _ppaStatusController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _ppaStatusController.clear();
                    },
                    icon: const Icon(Icons.clear),
                    color: Colors.red,
                  ),
                  hintText: "Enter Reference Number",
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
