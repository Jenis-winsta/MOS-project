import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = "dashboard-page";

  @override
  Widget build(BuildContext context) {
    Widget analyticsWidget(String title, String value) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple,
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value,style: TextStyle(fontSize: 45,color: Colors.white),),
                    //Icon(Icons.show_chart),
                  ],
                ),
              )
            ]),
          ),
        ),
      );
    }

    return Column(
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.start,
              children: [
                analyticsWidget("Total users", "10"),
                // analyticsWidget("Applicaton", "0"),
                // analyticsWidget("Candidates", "0"),
                analyticsWidget("Employees", "2"),
              ],
            ),
          ],
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                CustomCard(
                  title: 'Post Vacancy',
                  subtitle: 'Post a new job vacancy',
                  icon: Icons.add_circle_outline,
                ),
                CustomCard(
                  title: 'Application Status',
                  subtitle: 'Update applications status',
                  icon: Icons.assignment,
                ),
                CustomCard(
                  title: 'Candidates',
                  subtitle: 'View job candidates',
                  icon: Icons.group,
                ),
              ],
            ),
          ],
        ),
      ],
    );
    // Center(
    //   child: Text("Dashboard Screen", style: TextStyle(fontSize: 30,color: Colors.blue),),
    // );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CustomCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 400,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            Icon(
              icon,
              size: 36,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
