// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FormController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String prefix = "";
  bool isEmpty = false;
  bool emailBool = false;
  bool phoneBool = false;

  sendEmail(type, BuildContext context) async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_6953okb";
    const templateId = "template_b610uxq";
    const userId = "repviaV9Tv4t00S4C";
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      isEmpty = true;
      update();
    } else {
      isEmpty = false;
      update();
      validateEmail(emailController.text).then((validEmail) {
          validatePhone(phoneController.text).then((validPhone) async {
          if(validEmail && validPhone){
            var response = await http.post(url,
          headers: {"Content-type": "Application/json"},
          body: jsonEncode({
            "service_id": serviceId,
            "template_id": templateId,
            "user_id": userId,
            "template_params": {
              "user_subject": "reservation",
              "user_message": noteController.text,
              "user_email": emailController.text,
              "user_phone": prefix + phoneController.text,
              "user_firstname": firstNameController.text,
              "user_lastname": lastNameController.text,
              "reserv_type": type
            }
          }));
      if (response.statusCode == 200) {
        Get.back();
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Reservation successed"),
          backgroundColor: Color.fromARGB(255, 6, 206, 13),
        ));
      } else {
        Get.back();
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error occured"),
          backgroundColor: Color.fromARGB(255, 240, 6, 6),
        ));
      }
          }
        });
      
        });
    }
  }

  Future<bool> validatePhone(String phone) async  {
    if (phone.length >= 9) {
      phoneBool = false;
      update();
      return true;
    } else {
      phoneBool = true;
      update();
      return false;
    }
  }

  Future<bool> validateEmail(String email)  async{
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      emailBool = false;
      update();
      return true;
    } else {
      emailBool = true;
      update();
      return false;
    }
  }
}
