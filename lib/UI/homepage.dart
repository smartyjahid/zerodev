import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constant.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    Widget mobileNumber = TextFormField(
      keyboardType: TextInputType.text,
      validator: (input) {
        if (input!.isEmpty) {
          return "please input something";
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 10,
      controller: searchEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(242, 242, 242, 1),
        counterText: "",
        hintText: Search_title_key,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              " https:",
              style: TextStyle(color: ColorPrimary),
            ),
          ],
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        prefixIconConstraints: BoxConstraints(
            minWidth: 50, minHeight: 25, maxWidth: 51, maxHeight: 25),
        // errorText: Validator.validateMobile(edtMobile.text, context),
      ),
    );
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(child: Image.asset('assets/images/home_logo.png')),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screensize.width - 20,
              child: mobileNumber,
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
