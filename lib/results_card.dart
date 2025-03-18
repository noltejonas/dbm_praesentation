import 'package:flutter/material.dart';

class ResultsCard extends StatelessWidget {
  final double totalPrice;
  final double totalWaterConsumption;
  final double totalEnergyConsumption;
  final double totalCarbonDioxideEmission;

  const ResultsCard({
    super.key,
    required this.totalPrice,
    required this.totalWaterConsumption,
    required this.totalEnergyConsumption,
    required this.totalCarbonDioxideEmission,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Results:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.euro_symbol, color: Colors.green),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Total Price: €${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.water_drop, color: Colors.blue),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Total Water Consumption: ${totalWaterConsumption.toStringAsFixed(2)} liters',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.bolt, color: Colors.orange),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Total Energy Consumption: ${totalEnergyConsumption.toStringAsFixed(2)} kWh',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cloud, color: Colors.grey),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Total CO2 Emission: ${totalCarbonDioxideEmission.toStringAsFixed(2)} kg',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}