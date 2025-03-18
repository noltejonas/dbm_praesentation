class ShowerCalculator {
  double showerDuration = 10;
  int numberOfShowers = 30;
  double waterPerMinute = 10;
  double pricePer1000Liter = 2.0; // Changed
  double pricePerKWh = 0.30;
  double showerTemperature = 40;
  double coldWaterTemperature = 10;

  double totalPrice = 0;
  double totalWaterConsumption = 0;
  double totalEnergyConsumption = 0;
  double totalCarbonDioxideEmission = 0;

  void calculate() {
    // Water consumption calculation
    totalWaterConsumption = showerDuration * waterPerMinute * numberOfShowers;

    // Energy calculation (simplified, needs more accurate model)
    // Assuming 4.2 kJ to heat 1 liter of water by 1 degree Celsius
    double energyPerLiter = 4.2 * (showerTemperature - coldWaterTemperature) / 3600; // kWh
    totalEnergyConsumption = energyPerLiter * totalWaterConsumption;

    // Price calculation
    totalPrice = (totalWaterConsumption / 1000 * pricePer1000Liter) + (totalEnergyConsumption * pricePerKWh); // Changed

    // CO2 emission calculation (very rough estimate)
    // Assuming 0.4 kg CO2 per kWh (average for Germany)
    totalCarbonDioxideEmission = totalEnergyConsumption * 0.4;
  }
}