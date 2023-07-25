import 'package:flutter/material.dart';



class buildBody extends StatefulWidget {
  @override
  State<buildBody> createState() => _buildBodyState();
}


class _buildBodyState extends State<buildBody> {

  final _formKey = GlobalKey<FormState>();

  final _urlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //Добавление bottomSheet
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 250,
                width: 200,
                color: Colors.white54,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: _urlController,
                            validator: validatorUrl,
                            decoration: InputDecoration(
                              labelText: "Введите URL",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                            ),

                          ),
                        ),
                        ElevatedButton(
                          child: Text('Добавить'),
                          onPressed: _submitForm,
                          // onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        label: Text(
          "Добавить",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.deepPurple.shade100,
      ),
    );
  }


  //Проверка на валидацию, переход на предыдущую страницу
  void _submitForm() {
    if(_formKey.currentState!.validate()) {
      Navigator.pop(context);
      setState(() {

      });
    }
  }

  //Валидация URL
  String? validatorUrl(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    } else if (!value.contains(".pdf")) {
      return "Введите корректный Url";
    }
    return null;
  }
}