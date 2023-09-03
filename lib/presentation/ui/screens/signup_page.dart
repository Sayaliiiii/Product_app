import 'package:flutter/material.dart';
import 'package:product_app/presentation/ui/screens/product_data.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? selectedGender;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  String? selectedValue = null;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
      DropdownMenuItem(child: Text("Other"), value: "Other"),
    ];
    return menuItems;
  }

  String selectedCountry = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          'Welcome',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),

                  Image.asset(
                    "assets/images/sign-up.png",
                    height: 250,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      } else
                        return null;
                    },
                    controller: namecontroller,
                    decoration: InputDecoration(
                        prefixIconColor: Colors.black,
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        prefixIcon: Icon(Icons.person),
                        errorStyle: TextStyle(color: Colors.amber),
                        // errorText: 'Please enter your name',
                        focusColor: Colors.black,
                        fillColor: Colors.amber,
                        filled: true,
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Invalid Email';
                      } else
                        return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        prefixIconColor: Colors.black,

                        // focusColor: Colors.amber,
                        isDense: true,
                        errorStyle: TextStyle(color: Colors.amber),
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        prefixIcon: Icon(Icons.mail),
                        fillColor: Colors.amber,
                        filled: true,
                        hintText: "Enter email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Number should be 10 digits';
                      } else {
                        return null;
                      }
                    },
                    controller: phonecontroller,
                    decoration: InputDecoration(
                        prefixIconColor: Colors.black,
                        isDense: true,
                        errorStyle: TextStyle(color: Colors.amber),
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        prefixIcon: Icon(Icons.phone),
                        fillColor: Colors.amber,
                        filled: true,
                        hintText: "Enter Phone number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter city name';
                      } else
                        return null;
                    },
                    controller: citycontroller,
                    decoration: InputDecoration(
                        prefixIconColor: Colors.black,
                        errorStyle: TextStyle(color: Colors.amber),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        prefixIcon: Icon(Icons.location_city),
                        fillColor: Colors.amber,
                        filled: true,
                        hintText: "Enter city name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  // }),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter country name';
                      } else
                        return null;
                    },
                    controller: countrycontroller,
                    decoration: InputDecoration(
                        prefixIconColor: Colors.black,
                        errorStyle: TextStyle(color: Colors.amber),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        prefixIcon: Icon(Icons.location_city),
                        fillColor: Colors.amber,
                        filled: true,
                        hintText: "Enter Country",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                          isDense: true,
                          prefixIconColor: Colors.black,
                          errorStyle: TextStyle(color: Colors.amber),
                          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          hintText: 'Gender',
                          fillColor: Colors.amber,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                      validator: (value) =>
                          value == null ? "Select gender" : null,
                      dropdownColor: Colors.amber,
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),

                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.amber),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDataPAge(),
                                ));
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
