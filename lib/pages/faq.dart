import 'package:flutter/material.dart';

class FAQPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAQs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FAQPage(),
    );
  }
}

class FAQPage extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What should I do if I am a victim of adulterated fuel?',
      answer:
          'Whenever encountered with such a problem, kindly call EPRA using the following numbers: 0709336000 or 020 284700 or email through info@epra.go.ke. EPRA will be able to dispatch inspectors to test for adulteration for both the fuel at the station and that in your car’s tank.',
    ),
    FAQItem(
      question: 'Why doesn\'t EPRA Regulate the prices of LPG?',
      answer:
          'LPG prices are very competitive at the moment. If there are signs of market failure, the Authority will not hesitate to control LPG prices.',
    ),
    FAQItem(
      question: 'How do I apply for a petroleum licence?',
      answer:
          'To apply for a licence, visit our online licensing portal. You will be required to register as a user and then access credentials will be sent to the indicated email address. Using the access credentials, you will be required to log into your profile. Fill in the required details with correct information. Depending on the licence category selected, you will be required to attach soft copies of the documents as listed by the system. You are cautioned not to leave any space blank without attaching the requisite document. On completion of attachment and after being satisfied with the filled in information, you will be required to click “submit”.',
    ),
    FAQItem(
      question: 'How much does a petroleum business licence cost?',
      answer:
          'No licensing fees are charged at the moment for petroleum business licences.',
    ),
    FAQItem(
      question: 'How long does it take to obtain a petroleum business licence?',
      answer:
          'An application will take a maximum of 30 days from the date of successful submission of the application to the response either by grant or deferral of a licence. In case a license is deferred one will be notified the specific reasons.',
    ),
    FAQItem(
      question: 'What are the licences issued under Energy Efficiency?',
      answer: 'Energy Auditors licence and Energy Audit Firm Licence',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(faqItems[index].question),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(faqItems[index].answer),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}
