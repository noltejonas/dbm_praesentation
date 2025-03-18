import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_form.dart';
import 'screens/results_screen.dart';
import 'shower_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shower Cost Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          primary: Colors.lightBlue,
          secondary: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Shower Cost Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _calculator = ShowerCalculator();

  // Default values
  double _defaultShowerDuration = 10.0;
  int _defaultNumberOfShowers = 30;
  double _defaultWaterPerMinute = 10.0;
  double _defaultPricePer1000Liter = 2.0;
  double _defaultPricePerKWh = 0.30;
  double _defaultShowerTemperature = 40.0;
  double _defaultColdWaterTemperature = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            InputForm(
              formKey: _formKey,
              initialShowerDuration: _defaultShowerDuration.toString(),
              initialNumberOfShowers: _defaultNumberOfShowers.toString(),
              initialWaterPerMinute: _defaultWaterPerMinute.toString(),
              initialPricePer1000Liter: _defaultPricePer1000Liter.toString(),
              initialPricePerKWh: _defaultPricePerKWh.toString(),
              initialShowerTemperature: _defaultShowerTemperature.toString(),
              initialColdWaterTemperature: _defaultColdWaterTemperature.toString(),
              onShowerDurationSaved: (value) => _calculator.showerDuration = double.tryParse(value!) ?? _calculator.showerDuration,
              onNumberOfShowersSaved: (value) => _calculator.numberOfShowers = int.tryParse(value!) ?? _calculator.numberOfShowers,
              onWaterPerMinuteSaved: (value) => _calculator.waterPerMinute = double.tryParse(value!) ?? _calculator.waterPerMinute,
              onPricePer1000LiterSaved: (value) => _calculator.pricePer1000Liter = double.tryParse(value!) ?? _calculator.pricePer1000Liter,
              onPricePerKWhSaved: (value) => _calculator.pricePerKWh = double.tryParse(value!) ?? _calculator.pricePerKWh,
              onShowerTemperatureSaved: (value) => _calculator.showerTemperature = double.tryParse(value!) ?? _calculator.showerTemperature,
              onColdWaterTemperatureSaved: (value) => _calculator.coldWaterTemperature = double.tryParse(value!) ?? _calculator.coldWaterTemperature,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _calculator.calculate();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsScreen(
                          totalPrice: _calculator.totalPrice,
                          totalWaterConsumption: _calculator.totalWaterConsumption,
                          totalEnergyConsumption: _calculator.totalEnergyConsumption,
                          totalCarbonDioxideEmission: _calculator.totalCarbonDioxideEmission,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}