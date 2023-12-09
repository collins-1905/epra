import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPRA Functions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EPRAFunctionsPage(),
    );
  }
}

class EPRAFunctionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Functions of EPRA'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Functions of the Energy and Petroleum Regulatory Authority (EPRA)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'The Energy and Petroleum Regulatory Authority (EPRA) is established as the successor to the Energy Regulatory Commission (ERC) under the Energy Act, 2019. The Authority is responsible for the economic and technical regulation of the electric power, renewable, and petroleum subsectors. The mandate of the Authority as provided by the Energy Act 2019 include:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // List of functions (you can use a ListView instead for better scroll behavior)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (String function in functionsList)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '• $function',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sample functions list (copy from the provided content)
List<String> functionsList = [
  "(a) Regulate— (i) Generation, importation, exportation, transmission, distribution, supply and use of electrical energy with the exception of licensing of nuclear facilities; (ii) Importation, refining, exportation, transportation, storage and sale of petroleum and petroleum products with the exception of crude oil; (iii) Production, conversion, distribution, supply, marketing and use of renewable energy (iv) Exploration, extraction, production, processing, transportation, storage exportation, importation and sale of coal bed methane gas and other energy forms;",
  "(b) Regulate, monitor and supervise upstream petroleum operations in Kenya in accordance with the law relating to petroleum, the regulations made thereunder and the relevant petroleum agreement;",
  "(c) Provide such information and statistics in relations to upstream petroleum operations in Kenya to the Cabinet Secretary responsible for matters relating to petroleum as may be required from time to time;",
  "(d) Collect, maintain and manage upstream petroleum data;",
  "(e) Receive, review and grant an application for a nonexclusive exploration;",
  // Add the rest of the functions below...
  "(f) Co-ordinate the development of upstream petroleum infrastructure and promote capacity building in upstream petroleum operations;",
  "(g) Inspect and test any machinery or equipment that has been used, is used or shall be used in upstream petroleum operations;",
  "(h) Assess field development plans and make recommendations to the Cabinet Secretary responsible for matters relating to petroleum for approval, amendment or rejection of the plans;",
  "(i) Assess tail-end production and cessation of upstream petroleum operations and oversee decommissioning by a contractor;",
  "(j) Verify the measurements of petroleum production to allow for estimation and assessment of royalties and profits of oil and gas due to the National Government;",
  "(k) Verify the recoverable cost of oil and gas due to the parties to a petroleum agreement;",
  "(l) Audit contractors for cost recovery;",
  "(m) Monitor in consultation with the Competition Authority conditions of contractors’ operations and their trade practices;",
  "(n) Provide information to the relevant authority for the collection of taxes and fees from upstream petroleum operations;",
  "(o) Set, review and approve contracts, tariffs and charges for common user upstream petroleum facilities;",
  "(p) Make proposals to the Cabinet Secretary responsible for matters relating to petroleum in relation to regulations which may be necessary or expedient for the regulation of the upstream petroleum sector or for carrying out the objects and purposes of this Act;",
  "(q) Work with the relevant statutory authorities to formulate, enforce and review environmental, health, safety and quality standards for the upstream petroleum sector;",
  "(r) Develop guidelines, in consultation with other statutory authorities, in relation to the implementation of treaties, conventions or protocols affecting the upstream petroleum sector that have been ratified by Kenya;",
  "(s) Regulate contracts on upstream petroleum operations not specifically provided for under the law relating to petroleum;",
  "(t) Advice the Cabinet Secretary responsible for matters relating to petroleum in the evaluation of the bids and applications made for upstream petroleum blocks;",
  "(u) Ensure that contractors uphold the relevant laws, regulations and petroleum agreement terms;",
  "(v) Ensure optimal levels of recovery of petroleum resources;",
  "(w) Promote well planned, executed and cost-efficient operations;",
  "(x) Ensure optimal utilization of existing and planned facilities;",
  "(y) Ensure the establishment of a central database of persons involved in upstream petroleum operations",
  "(z) Manage upstream petroleum data and provide periodic updates and publication of the status of upstream petroleum operations;",
  "(aa) Take such action as is necessary to enforce the requirements in a petroleum agreement or any regulations and to protect the environment, the health and safety of workers and the public;",
  "(bb) Ensure and facilitate competition, access and utilization of facilities by third parties;",
  "(cc) Prescribe the form and manner in which any application for any authority, consent or approval under the law relating to petroleum shall be made;",
  "(dd) Investigate complaints or disputes arising from petroleum operations;",
  "(ee) Enforce local content requirements;",
  "(ff) Issue operational permits and non-exclusive exploration permits in accordance with the law relating to petroleum;",
  "(gg) Ensure enforcement and compliance with the national values and principles;",
  "(hh) Protect consumer, investor and other stakeholder interests;",
  "(ii) Provide such information and statistics to the Cabinet Secretary as the Cabinet Secretary may from time to time require;",
  "(jj) Collect and maintain energy data;",
  "(kk) Develop guidelines on applicable treaties, conventions and protocols affecting the energy sector in consultation with other statutory authorities except those relating to nuclear energy;",
  "(ll) Co-ordinate the development and implementation of a national energy efficiency and conservation action plan, in consultation with relevant statutory authorities and other stakeholders;",
  "(mm) Develop testing and certification procedures, in conjunction with relevant statutory agencies, for certification and testing for energy consumption of equipment and appliances;",
  "(nn) Ensure, in collaboration the Kenya Bureau of Standards, that only energy efficient and cost effective appliances and equipment are imported into the country;",
  "(oo) Certify energy managers and license energy auditors;",
  "(pp) Promote, in consultation with the Kenya National Accreditation Service, the establishment of accredited laboratories for energy efficiency; and",
  "(qq) Perform any other function that is incidental or consequential to its functions under this Act or any other written law.",
];
