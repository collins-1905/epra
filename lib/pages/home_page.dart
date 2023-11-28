import 'package:epra/pages/employee_details.dart';
import 'package:epra/pages/epra_portal.dart';
import 'package:epra/pages/licence_status.dart';
import 'package:epra/pages/ppa_status.dart';
import 'package:epra/pages/pump_prices.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Set a custom height
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            //title: Text('Centered Image in AppBar'),
            flexibleSpace: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Image.asset(
                    'lib/img/epralogo.png', // Replace with your image asset path
                    width: 300, // Set the width of the image
                    height: 300, // Set the height of the image
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(),
        body: Padding(
          padding: const EdgeInsets.all(
            40.0,
          ), // Add padding around the Column
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Image.asset('lib/img/epralogo.png'),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  elevation: 4, // Add elevation for a card-like effect
                  child: ListTile(
                    tileColor: Colors.lightBlueAccent,
                    leading: Icon(Icons.local_gas_station_outlined),
                    title: Text('CURRENT PUMP PRICES'),
                    //subtitle: Text('Subtitle 1'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetroleumTownWidget()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  color: Colors.white,
                  elevation: 4, // Add elevation for a card-like effect
                  child: ListTile(
                    tileColor: Colors.lightBlueAccent,
                    leading: Icon(Icons.badge_outlined),
                    title: Text('VERIFY EPRA LICENCE'),
                    //subtitle: Text('Subtitle 1'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LicenceStatusWidget()));
                    },
                  ),
                ),
                SizedBox(height: 16.0), // Add spacing between ListTiles
                Card(
                  color: Colors.white,
                  elevation: 4,
                  child: ListTile(
                    tileColor: Colors.lightBlueAccent,
                    leading: Icon(Icons.person_2_outlined),
                    title: Text('CONFIRM EPRA EMPLOYEE'),
                    //. subtitle: Text('Subtitle 2'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EmployeeDetailsWidget()));
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  child: ListTile(
                    tileColor: Colors.lightBlueAccent,
                    leading: Icon(Icons.cases_outlined),
                    title: Text('CHECK PPA STATUS'),
                    // subtitle: Text('Subtitle 3'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PPAStatusWidget()));
                    },
                  ),
                ),
                SizedBox(height: 16.0), // Add spacing between ListTiles
                Card(
                  elevation: 4,
                  child: ListTile(
                    tileColor: Colors.lightBlueAccent,
                    leading: Icon(Icons.public_outlined),
                    title: Text('EPRA PORTAL LOGIN'),
                    //. subtitle: Text('Subtitle 2'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EpraPortalWidget()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
