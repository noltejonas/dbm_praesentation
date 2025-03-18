import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final double totalPrice;
  final double totalWaterConsumption;
  final double totalEnergyConsumption;
  final double totalCarbonDioxideEmission;

  const ResultsScreen({
    super.key,
    required this.totalPrice,
    required this.totalWaterConsumption,
    required this.totalEnergyConsumption,
    required this.totalCarbonDioxideEmission,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate comparisons
    final phoneCharges = (totalEnergyConsumption * 2).toInt(); // Example: Assuming a phone charge uses 0.5 kWh

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Shower Cost Results',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Results:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ResultRow(
              icon: Icons.euro_symbol,
              color: Colors.green,
              label: 'Total Price',
              value: '€${totalPrice.toInt()}', // Removed digits after decimal
            ),
            ResultRow(
              icon: Icons.water_drop,
              color: Colors.blue,
              label: 'Total Water Consumption',
              value: '${totalWaterConsumption.toInt()} liters', // Removed digits after decimal
            ),
            ResultRow(
              icon: Icons.bolt,
              color: Colors.orange,
              label: 'Total Energy Consumption',
              value: '${totalEnergyConsumption.toInt()} kWh', // Removed digits after decimal
            ),
            ResultRow(
              icon: Icons.cloud,
              color: Colors.grey,
              label: 'Total CO2 Emission',
              value: '${totalCarbonDioxideEmission.toInt()} kg', // Removed digits after decimal
            ),
            const SizedBox(height: 20),
            Text(
              'That\'s equivalent to charging your phone approximately $phoneCharges times!',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const ResultRow({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}