import 'package:epra/pages/employee_details.dart';
import 'package:epra/pages/epra_portal.dart';
import 'package:epra/pages/licence_status.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 211, 211),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0), // Set a custom height
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            //title: Text('Centered Image in AppBar'),
            flexibleSpace: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'lib/img/epralogo.png', // Replace with your image asset path
                    width: 400, // Set the width of the image
                    height: 100, // Set the height of the image
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          
          padding: const EdgeInsets.all(
            40.0,
          ), // Add padding around the Column
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Image.asset('lib/img/epralogo.png'),
                SizedBox(
                  height: 30,
                ),
                Card(
                  color: Colors.green,
                  elevation: 4, // Add elevation for a card-like effect
                  child: ListTile(
                    leading: Icon(Icons.badge_outlined),
                    title: Text('CONFIRM EPRA LICENCE'),
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
                  color: Colors.blue,
                  elevation: 4,
                  child: ListTile(
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
                  color: Colors.red,
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.handshake),
                    title: Text('CONFIRM PPA STATUS'),
                    // subtitle: Text('Subtitle 3'),
                    onTap: () {
                      // Add your onTap action here for ListTile 3
                    },
                  ),
                ),
                SizedBox(height: 16.0), // Add spacing between ListTiles
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.person_2_outlined),
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
