// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:your_employee/Screens/OtherPages/SettingPage.dart';

import 'ResultsOfsearch.dart';

class SearchFields extends StatefulWidget {
  const SearchFields({Key? key}) : super(key: key);

  @override
  State<SearchFields> createState() => _SearchFieldsState();
}

class _SearchFieldsState extends State<SearchFields> {
  //The selected job type  --------------------------------->
  //And the variable to use in DataBase for search for this type of employees !!!!
  String JobType = 'Professor';
  final Joblist = [
    'Professor',
    'Carpenter',
    'Plumber',
    'Mechanical',
    'Smith'
  ]; //used var !!!

  //These variables are for The Form widget below !!!
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  //And these two are for db variable and all the cities in our app !!!
  String CityDB = "";
  static const cities = [
    "Casablanca",
    "Fez",
    "Tangier",
    "Marrakesh",
    "Salé",
    "Meknes",
    "Rabat",
    "Oujda",
    "Kenitra",
    "Agadir",
    "Tetouan",
    "Temara",
    "Safi",
    "Mohammedia",
    "Khouribga",
    "El Jadida",
    "Beni Mellal",
    "Ait Melloul",
    "Nador",
    "Dar Bouazza",
    "Taza",
    "Settat",
    "Berrechid",
    "Khemisset",
    "Inezgane",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("Service"),
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 295,
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 156, 156, 156), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          //Here the list of all services you can find in the app !
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              // hint: Text('Select a job'),
              value: JobType,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  JobType = newValue!;
                });
              },
              //Here we give all the Jobs list ------------------------------->
              items: <String>[
                'Professor',
                'Carpenter',
                'Plumber',
                'Mechanical',
                'Smith'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("City"),
            )),
        SizedBox(
          height: 10,
        ),
        // Here the text field for cities (you can enter your city here)
        Form(
          key: this._formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 40),
            child: TypeAheadField(
              suggestionsCallback: (pattern) => cities.where((item) => item
                  .toString()
                  .toLowerCase()
                  .contains(pattern.toLowerCase())),
              itemBuilder: (_, String item) => ListTile(title: Text(item)),
              onSuggestionSelected: (String city) {
                this._textEditingController.text = city;
                print(city);
                CityDB = city;
              },
              getImmediateSuggestions: true,
              hideSuggestionsOnKeyboardHide: false,
              hideOnEmpty: false,
              noItemsFoundBuilder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No item found'),
              ),
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  hintText: 'Enter a city ',
                  labelText: "City",
                  border: OutlineInputBorder(),
                ),
                controller: this._textEditingController,
              ),
            ),
          ),
        ),
        //Here the button search
        SizedBox(
          width: 250,
          height: 50,
          child: ElevatedButton(
            child: const Text('Search'),
            onPressed: () {
              //TO-DO : Search for the selected choices in DataBase
              //and move to another page or change the contenue of the search page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsOftsearch()),
              );
            },
          ),
        ),
      ],
    );
  }
}
