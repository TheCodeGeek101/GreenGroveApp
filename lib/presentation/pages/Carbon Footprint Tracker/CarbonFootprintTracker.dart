import 'package:flutter/material.dart';
import 'package:green_grove/core/Utils/constants.dart';


class CarbonFootprintTracker extends StatefulWidget {
  CarbonFootprintTracker({super.key});

  @override
  _CarbonFootprintTrackerState createState() {
    return _CarbonFootprintTrackerState();
  }
}

class _CarbonFootprintTrackerState extends State<CarbonFootprintTracker> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Common form data
  String _activityType = '';
  double _quantity = 0.0;

  // Dropdown options for common form
  List<String> _activityTypes = [
    'Transportation',
    'Food',
    'Energy Use',
    'Waste Management',
    'Water Usage',
    'Shopping',
    'Travel',
    'Housing',
    'Entertainment',
    'Work',
    'Education',
    'Events'
  ];

  // Transportation form data
  String _vehicleType = '';
  double _distance = 0.0;
  double _fuelEfficiency = 0.0;
  List<String> _vehicleTypes = ['Car', 'Bike', 'Public Transport'];

  // Food form data
  String _foodType = '';
  List<String> _foodTypes = ['Vegetarian', 'Vegan', 'Meat'];

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform calculations or send data to the server
      // You can also save this data to your database
      // Add your logic here
      print('Data submitted: $_activityType, $_quantity');

      if (_activityType == 'Transportation') {
        print('Vehicle Type: $_vehicleType, Distance: $_distance km, Fuel Efficiency: $_fuelEfficiency km/L');
      } else if (_activityType == 'Food') {
        print('Food Type: $_foodType');
      }

      // Add logic for handling the submitted data on the backend
    }
  }

  @override
  void initState() {
    super.initState();
    _activityType = _activityTypes.first;
    _vehicleType = _vehicleTypes.first;
    _foodType = _foodTypes.first;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 0, top: 0),
              child: Text(
                'Add Journey',
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 0, top: 0),
              child: Text(
                'let\'s track your carbon footprint!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _activityType,
                      onChanged: (value) {
                        setState(() {
                          _activityType = value ?? '';
                        });
                      },
                      items: _activityTypes
                          .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                          .toList(),
                      decoration: InputDecoration(labelText: 'Select Activity Type'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an activity type';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    if (_activityType == 'Transportation') ...[
                      DropdownButtonFormField<String>(
                        value: _vehicleType,
                        onChanged: (value) {
                          setState(() {
                            _vehicleType = value ?? '';
                          });
                        },
                        items: _vehicleTypes
                            .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                            .toList(),
                        decoration: InputDecoration(labelText: 'Select Vehicle Type'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a vehicle type';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Enter Distance (km)'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the distance';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _distance = double.parse(value);
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Enter Fuel Efficiency (km/L)'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter fuel efficiency';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _fuelEfficiency = double.parse(value);
                          });
                        },
                      ),
                    ] else ...[
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Enter Quantity'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the quantity';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _quantity = double.parse(value);
                          });
                        },
                      ),
                    ],
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Constants.primaryColor,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        _submitForm();
                        // Add additional logic or UI changes after form submission
                      },
                      child: const Text('Submit'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
