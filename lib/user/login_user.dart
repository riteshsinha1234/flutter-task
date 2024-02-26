import 'package:flutter/material.dart';
import 'package:flutter_task/common_file.dart';
import 'package:flutter_task/user/user_home.dart';
import 'package:flutter_task/vendor/vendor.dart';

class LoginUserPage extends StatelessWidget {
  LoginUserPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("User Screen", black, 24, FontWeight.bold, false),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const VendorApp()));
                },
                child: Image.asset(
                  ImagePath.logo,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  if (!isValidEmail(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: container,
                  prefixIcon: Icon(Icons.email, color: lightgrey),
                  hintText: "Email Address",
                  hintStyle: TextStyle(
                    color: lightgrey,
                    fontSize: 15,
                    fontFamily: 'BeVietnamPro',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: container, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: container,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: container,
                  prefixIcon: Icon(Icons.lock, color: lightgrey),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: lightgrey,
                    fontSize: 15,
                    fontFamily: 'BeVietnamPro',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: container, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: container,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                elevation: 0.0,
                color: brown,
                height: 60,
                minWidth: 236,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserHome()));
                  }
                },
                child: Center(
                  child:
                      CustomText("Login", white, 18, FontWeight.normal, false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // Use a regular expression for basic email format validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
