import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:green_grove/Data/data_sources/remote/carbon_footprint_api_service.dart';
import 'package:green_grove/Data/repository/CarbonFootprintRepositoryImpl.dart';
import 'package:green_grove/Domain/usecases/predict_carbon_footprints.dart';
import 'package:green_grove/core/Utils/constants.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_bloc.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_event.dart';
import 'package:green_grove/presentation/bloc/CarbonFootprint/remote/remote_carbon_footprint_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarbonFootprintTracker extends StatefulWidget {
  CarbonFootprintTracker({Key? key}) : super(key: key);

  @override
  _CarbonFootprintTrackerState createState() => _CarbonFootprintTrackerState();
}

class _CarbonFootprintTrackerState extends State<CarbonFootprintTracker> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final RemoteCarbonFootprintsBloc _carbonFootprintsBloc;

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
      // Dispatch an event to the bloc with the form data
      _carbonFootprintsBloc.add(
        PredictUserCarbonFootprints(
          activityType: _activityType,
          quantity: _quantity,
          vehicleType: _vehicleType,
          distance: _distance,
          fuelEfficiency: _fuelEfficiency,
          foodType: _foodType,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the bloc and set default values for dropdowns
    _carbonFootprintsBloc = RemoteCarbonFootprintsBloc(
      PredictCarbonFootprintUseCase(
        CarbonFootprintRepositoryImpl(
          CarbonFootprintApiService(Dio()), // You might need to pass a Dio instance here
        ),
      ),
    );
    _activityType = _activityTypes.first;
    _vehicleType = _vehicleTypes.first;
    _foodType = _foodTypes.first;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => _carbonFootprintsBloc,
      child: Scaffold(
        body: BlocBuilder<RemoteCarbonFootprintsBloc, RemoteCarbonFootprintState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Section for adding journey details
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
                  // Form for capturing carbon footprint details
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Dropdown for selecting activity type
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
                          // Conditionally render form fields based on activity type
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
                            // Form fields for other activity types
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
                          // Submit button to trigger form submission
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
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Close the bloc when the widget is disposed
    _carbonFootprintsBloc.close();
    super.dispose();
  }
}
