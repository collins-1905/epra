import 'package:epra/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeDetailsWidget extends StatefulWidget {
  const EmployeeDetailsWidget({Key? key}) : super(key: key);

  @override
  State<EmployeeDetailsWidget> createState() => _EmployeeDetailsWidgetState();
}

class _EmployeeDetailsWidgetState extends State<EmployeeDetailsWidget> {
  //variables

  String name = "";
  String jobTitle = "";
  String department = "";
  bool isLoading = false;

  //http request
  Future<void> getEmployeeDetails() async {
    var response = await http.get(Uri.parse(
        'https://portal.erc.go.ke:8200/api/ussdservices/employee?token=w8VcxKr77f6tn4GSVfBe5jiJYag5R4km&IDNumber=${_employeeIDController.text}&MobileNumber=${_employeePhoneController.text}'));
    if (!response.body.contains("Invalid")) {
      Map<String, dynamic> finalResponse = jsonDecode(response.body);

      setState(() {
        name = finalResponse['message']['Name'];
        jobTitle = finalResponse['message']['JobTitle'];
        department = finalResponse['message']['Department'];

        isLoading = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Text("Not Found"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
    // print(finalResponse['message']['ContactCompanyName']);
  }

  //controller
  final _employeeIDController = TextEditingController();
  final _employeePhoneController = TextEditingController();

  @override
  void dispose() {
    _employeeIDController.dispose();
    _employeePhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
        title: const Text("CONFIRM EPRA EMPLOYEE"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const CircularProgressIndicator()
            else if (name.isNotEmpty)
              // Show data only if it's not empty

              Column(children: [
                if (name.isEmpty) const CircularProgressIndicator(),
                SizedBox(
                  height: 100,
                  child: Card(
                    color: Color.fromARGB(255, 0, 187, 212),
                    child: ListTile(
                      title: Text(name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(jobTitle),
                          Text(department),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            const SizedBox(
              height: 30,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _employeeIDController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        _employeeIDController.clear();
                      },
                      icon: const Icon(Icons.clear)),
                  hintText: "Enter ID Number",
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _employeePhoneController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _employeePhoneController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  hintText: "Enter Phone Number (07XX XXX XXX)",
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              onPressed: () {
                getEmployeeDetails();
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
