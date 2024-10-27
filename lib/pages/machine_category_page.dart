import 'package:flutter/material.dart';
import '../screens/subcategoriesdetails.dart';
import 'machines.dart'; // Import the machine data



class MachineCategoryPage extends StatelessWidget {
  final String industry;

  MachineCategoryPage({required this.industry});

  @override
  Widget build(BuildContext context) {
    // Get the machines based on the selected industry
    final machines = MachineData.getMachinesForIndustry(industry);

    return Scaffold(
      appBar: AppBar(title: Text('$industry Machines')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          if (machines['packagingMachines']!.isNotEmpty)
            _buildCategorySection(context, "Packaging Machines", machines['packagingMachines']!),
          if (machines['packagingSystems']!.isNotEmpty)
            _buildCategorySection(context, "Packaging Systems", machines['packagingSystems']!),
          if (machines['fillingSystems']!.isNotEmpty)
            _buildCategorySection(context, "Filling Systems", machines['fillingSystems']!),
        ],
      ),
    );
  }

  // Helper method to build each category section
  Widget _buildCategorySection(BuildContext context, String categoryName, List<Machine> machineList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(categoryName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 10,
          children: machineList.map((machine) {
            return _buildMachineCard(context, categoryName, machine);
          }).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  // Method to build machine card with image and name
  Widget _buildMachineCard(BuildContext context, String categoryName, Machine machine) {
    return GestureDetector(
      onTap: () {
        // Navigate to the details page with machine details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubcategoryDetailsScreen(
              categoryName: categoryName,
              subcategoryName: machine.name,
              subcategoryImageUrl: machine.imageUrl,
              subcategoryDescription: machine.description // Assuming description exists
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          width: 100, // Width for each card
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(machine.imageUrl, height: 50), // Display machine image
              SizedBox(height: 8),
              Text(
                machine.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ), // Display machine name
            ],
          ),
        ),
      ),
    );
  }
}
