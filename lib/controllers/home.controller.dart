// import 'package:blue_thermal_printer/blue_thermal_printer.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:printer_app2/models/user.model.dart';


class HomeController  extends GetxController{
  RxInt number = 0.obs;
  RxList<UersModel> listAttente = <UersModel>[].obs;
   UersModel? userModel;
     String formatDate(DateTime date) {
    // Formater la date
    String formattedDate = DateFormat('dd/MM/yyyy à HH:mm').format(date);
    return formattedDate;
  }
  int suivant(){
    print("object");
    number.value++;

    listAttente.add(UersModel(number.value,formatDate(DateTime.now())));
    print(listAttente.value);

    return number.value;

  }




}