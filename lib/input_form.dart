import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange}) : assert(decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    String value = newValue.text;

    if (value.contains(".") && value.substring(value.indexOf(".") + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == ".") {
      truncated = "0.";

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(truncated.length, truncated.length + 1),
        extentOffset: math.min(truncated.length, truncated.length + 1),
      );
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}

class InputForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function(String?) onShowerDurationSaved;
  final Function(String?) onNumberOfShowersSaved;
  final Function(String?) onWaterPerMinuteSaved;
  final Function(String?) onPricePer1000LiterSaved; // Changed
  final Function(String?) onPricePerKWhSaved;
  final Function(String?) onShowerTemperatureSaved;
  final Function(String?) onColdWaterTemperatureSaved;

  const InputForm({
    Key? key,
    required this.formKey,
    required this.onShowerDurationSaved,
    required this.onNumberOfShowersSaved,
    required this.onWaterPerMinuteSaved,
    required this.onPricePer1000LiterSaved, // Changed
    required this.onPricePerKWhSaved,
    required this.onShowerTemperatureSaved,
    required this.onColdWaterTemperatureSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Duration of each Shower (minutes)'),
            keyboardType: TextInputType.number,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            onSaved: onShowerDurationSaved,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the duration';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Total Number of Showers'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSaved: onNumberOfShowersSaved,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the number of showers';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Water per Minute (liters)'),
            keyboardType: TextInputType.number,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            onSaved: onWaterPerMinuteSaved,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter water consumption per minute';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Price per 1000 Liter Water (€)'), // Changed
            keyboardType: TextInputType.number,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            onSaved: onPricePer1000LiterSaved, // Changed
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the price per 1000 liters'; // Changed
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Price per kWh (€)'),
            keyboardType: TextInputType.number,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            onSaved: onPricePerKWhSaved,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the price per kWh';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Temperature of the Shower (°C)'),
            keyboardType: TextInputType.number,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            onSaved: onShowerTemperatureSaved,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the shower temperature';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Temperature of the cold Water (°C)'),
            keyboardType: TextInputType.number,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            onSaved: onColdWaterTemperatureSaved,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the cold water temperature';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}