import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printer_app2/controllers/home.controller.dart';
import 'package:printer_app2/pages/home.view.dart';
import 'package:printer_app2/testprint.dart';

class RecuView extends StatelessWidget {
  RecuView({super.key});

  HomeController _controller = Get.find();

  TestPrint testPrint = TestPrint();

  void showMySnackBar(BuildContext context, number) {
    final snackBar = SnackBar(
      content: Text('Impression du N° ${number}'),
      duration:
          Duration(seconds: 3), // Durée d'affichage du SnackBar (optionnel)
      action: SnackBarAction(
        label: 'Action',
        onPressed: () {
          // Actions à effectuer lorsque l'utilisateur appuie sur le bouton de l'action
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildReceiptItem(String itemName, String itemPrice,
      {bool isTotal = false}) {
    return ListTile(
      title: Text(
        itemName,
        style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
      ),
      trailing: Text(
        itemPrice,
        style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              _buildReceiptItem(
                  'Bienvenue', '',
                  isTotal: true),
              _buildReceiptItem(
                  'Votre numéro d\'attente est le', '${_controller.number}',
                  isTotal: true),
              _buildReceiptItem('Date', '${_controller.listAttente.last.date}'),
              Divider(), // Séparateur pour les éléments du reçu
              _buildReceiptItem(
                  'Nous vous prions de patienter Merci pour votre compréhension',
                  '',
                  isTotal: true),
        
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  testPrint.sample();
                  showMySnackBar(context,_controller.number);
                  Get.off(() => HomeView());
                },
                icon: Icon(Icons.print),
                label: Text("Imprimer"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orangeAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
