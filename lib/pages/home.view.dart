import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printer_app2/controllers/home.controller.dart';
import 'package:printer_app2/pages/recu.view.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});


  final _controller = Get.put(HomeController());
       void showMySnackBar(BuildContext context, number) {
  final snackBar = SnackBar(
    content: Text('Impression du N° ${number}'),
    duration: Duration(seconds: 3), // Durée d'affichage du SnackBar (optionnel)
    action: SnackBarAction(
      label: 'Action',
      onPressed: () {
        // Actions à effectuer lorsque l'utilisateur appuie sur le bouton de l'action
      },
    ),
  );
  
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


       void showMySnackBar2(BuildContext context) {
  final snackBar2 = SnackBar(
    content: Text('Imprimer et cloturer la journée'),
    duration: Duration(seconds: 3), // Durée d'affichage du SnackBar (optionnel)
    action: SnackBarAction(
      label: 'Action',
      onPressed: () {
        // Actions à effectuer lorsque l'utilisateur appuie sur le bouton de l'action
      },
    ),
  );
  
  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(label: Text("Cloturer", style: TextStyle(color:Colors.white),), icon: Icon(Icons.delete), onPressed: (){
        _controller.listAttente.value = [];
        _controller.number.value = 0;
        }),
        appBar: AppBar(
          title: const Text("Gestion de file d'attente"),
          centerTitle: true,
        ),
        body: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Center(
                        child:  Text(
                      " N Actuel ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),

                    Center(
                    child:  Text(
                  "${_controller.number.value}",
                  style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                )),

                Center(
                        child:  Text(
                      " Historique d'appels ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),

                  ],
                ),
              ],
            ),

            Expanded(
              flex: 1,
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _controller.listAttente.length,
                  itemBuilder: (context, index){
                  
                  return ListTile(
                    title: Text("${_controller.listAttente[index].id}"),
                    trailing: Text("${_controller.listAttente[index].date}"),
                  );
                }),
              ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      _controller.suivant();
                   Get.to(()=>RecuView());
                    },
                    child: Container(
                      child: Center(child: Text("Suivant", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      height: Get.width/2,
                      width: Get.width/2,
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
