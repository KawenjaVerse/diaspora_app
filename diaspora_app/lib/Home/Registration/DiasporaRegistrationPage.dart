import 'package:diaspora_app/utils/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class DiasporaRegistrationPage extends StatefulWidget {
  @override
  State<DiasporaRegistrationPage> createState() {
    return _DiasporaRegistrationPage();
  }
}

class _DiasporaRegistrationPage extends State<DiasporaRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
//country, surname, given names, other names,
  var _country = "";
  var _surname = "";
  var _givenNames = "";
  var _otherNames = "";
  var _gender = "";
  var _dob = "";
  var _email = "";
  var _phone = "";
  var _address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Diaspora Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text("Fill the details below to register"),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // artyTechTextInput("Country", (v) {
                      //   _country = v;
                      // },
                      //     prefixIcon: Icons.place_sharp,
                      //     keyboardType: TextInputType.text),
                      artyTechCountryPicker(
                        "Country",
                        (v) {
                          _country = v;
                        },
                        prefixIcon: Icons.place_sharp,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      artyTechTextInput("Surname", (v) {
                        _surname = v;
                      },
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      artyTechTextInput("Given Names", (v) {
                        _givenNames = v;
                      },
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      artyTechTextInput("Other Names", (v) {
                        _otherNames = v;
                      },
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.text),

                      //gender, dob, email, phone, address,
                      SizedBox(
                        height: 10,
                      ),
                      artyTechGenderPicker("Gender", (v) {
                        _gender = v;
                      }, prefixIcon: Icons.person),

                      const SizedBox(height: 10),

                      artyTechDatePicker("Date of Birth", (v) {
                        _dob = v;
                      }, prefixIcon: Icons.cake),

                      SizedBox(
                        height: 10,
                      ),
                      artyTechTextInput("Email", (v) {
                        _email = v;
                      },
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(
                        height: 10,
                      ),
                      artyTechTextInput("Phone", (v) {
                        _phone = v;
                      },
                          prefixIcon: Icons.phone,
                          keyboardType: TextInputType.phone),
                      SizedBox(
                        height: 10,
                      ),
                      artyTechTextInput("Address", (v) {
                        _address = v;
                      },
                          prefixIcon: Icons.place,
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      _loading
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : artyTechButtonOvalFilled("Submit", () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState?.save();
                                action();
                              }
                            })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget artyTechCountryPicker(
    String label,
    Function(String) onSaved, {
    IconData? prefixIcon,
  }) {
    String? selectedCountry;

    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              onSelect: (Country country) {
                setState(() {
                  selectedCountry = country.name;
                });
                onSaved(country.name);
              },
            );
          },
          child: Container(
            height: 60.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                if (prefixIcon != null)
                  Icon(prefixIcon, size: 20.0, color: Colors.black54),
                if (prefixIcon != null) const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    selectedCountry ?? label,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: selectedCountry != null
                          ? Colors.black
                          : Colors.black54,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.black54),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget artyTechGenderPicker(
    String label,
    Function(String) onSaved, {
    IconData? prefixIcon,
  }) {
    String? selectedGender;
    final genders = ['Male', 'Female'];

    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () async {
            final result = await showModalBottomSheet<String>(
              context: context,
              builder: (_) => ListView(
                children: genders.map((gender) {
                  return ListTile(
                    title: Text(gender),
                    onTap: () => Navigator.pop(context, gender),
                  );
                }).toList(),
              ),
            );

            if (result != null) {
              setState(() => selectedGender = result);
              onSaved(result);
            }
          },
          child: Container(
            height: 60.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                if (prefixIcon != null)
                  Icon(prefixIcon, size: 20.0, color: Colors.black54),
                if (prefixIcon != null) const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    selectedGender ?? label,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: selectedGender != null
                          ? Colors.black
                          : Colors.black54,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.black54),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget artyTechDatePicker(
    String label,
    Function(String) onSaved, {
    IconData? prefixIcon,
  }) {
    String? selectedDate;

    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              final formatted =
                  "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
              setState(() => selectedDate = formatted);
              onSaved(formatted);
            }
          },
          child: Container(
            height: 60.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                if (prefixIcon != null)
                  Icon(prefixIcon, size: 20.0, color: Colors.black54),
                if (prefixIcon != null) const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    selectedDate ?? label,
                    style: TextStyle(
                      fontSize: 14.0,
                      color:
                          selectedDate != null ? Colors.black : Colors.black54,
                    ),
                  ),
                ),
                const Icon(Icons.calendar_today,
                    size: 18, color: Colors.black54),
              ],
            ),
          ),
        );
      },
    );
  }

  var _loading = false;
  void action() {
    //country, surname, given names,
    if (_country.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Country is required"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    if (_surname.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Surname is required"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    if (_givenNames.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Given names are required"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    //send data
    //diaspora/register
    requestAPI("diaspora/register", {
      "country": _country,
      "surname": _surname,
      "given_names": _givenNames,
      "other_names": _otherNames,
      "gender": _gender,
      "dob": _dob,
      "email": _email,
      "phone": _phone,
      "address": _address
    }, (loading) {
      setState(() {
        _loading = loading;
      });
    }, (response) {
      if (response["status"] == "success") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Registration successful"),
          backgroundColor: Colors.green,
        ));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response["message"]),
          backgroundColor: Colors.red,
        ));
      }
    }, (e) {}, method: "POST");
  }
}
