import 'package:flutter/material.dart';
import 'package:routes/Model/Model.dart';
import 'package:routes/MyTextFormField.dart';
import 'package:routes/routes.dart';
import 'package:validators/validators.dart' as validator;

class TestForm extends StatefulWidget {
  const TestForm({Key? key}) : super(key: key);

  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final fKey = GlobalKey<FormState>();
  Model model = Model();
  double halfMediaWidth = 0;
  @override
  void didChangeDependencies() {
    halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: fKey,
        child: Material(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: halfMediaWidth,
                    child: MyTextFormField(
                        hintText: "First Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your first name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          model.firstName = value;
                        }),
                  ),
                  Container(
                    width: halfMediaWidth,
                    child: MyTextFormField(
                        hintText: "Last Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your last name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          model.lastName = value;
                        }),
                  )
                ],
              ),
            ),
            MyTextFormField(
              hintText: "Email",
              isEmail: true,
              validator: (value) {
                if (!validator.isEmail(value!)) {
                  return "Please enter A Valid email";
                }
                return null;
              },
              onSaved: (value) {
                model.email = value;
              },
            ),
            MyTextFormField(
              hintText: "Pssword",
              isPassword: true,
              validator: (value) {
                if (value!.length < 7) {
                  return 'Password should be minimum 7 characters';
                }
                fKey.currentState!.save();
                return null;
              },
              onSaved: (value) {
                model.password = value;
              },
            ),
            MyTextFormField(
              hintText: "confirm password",
              isPassword: true,
              validator: (value) {
                if (value!.length < 7) {
                  return 'Password should be minimum 7 characters';
                } else if (model.password == null || value != model.password) {
                  return "password no match";
                }
                return null;
              },
              onSaved: (value) {
                  model.password = value;
              },
            ),
            Container(
                margin: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                    onPressed: () {
                      if (fKey.currentState!.validate()) {
                        fKey.currentState!.save();
                        Navigator.pushNamed(context, Routes.Result);
                      }
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )))
          ],
        )));
  }
}
