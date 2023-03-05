import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

class SettingsPage extends StatefulWidget {

  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // const DashboardPage({super.key});
  var title = ['Device Settings', 'Notifications', 'App Settings'];
  // var title = ['Device Settings', 'Notifications', 'App Settings','general settings'];

  var icon = [
    Icons.app_settings_alt,
    Icons.admin_panel_settings,
    Icons.circle_notifications
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text("Settings"),
      // ),
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: title.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            //title: Text("The list item #$index"),
            title: Text(
              title[index],
              style: TextStyle(fontSize: 16),
            ),
            //subtitle: Text("The subtitle"),
            leading: Icon(icon[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              if (index == 0) {
                AppSettings.openDeviceSettings();
              } else if (index == 1) {
                AppSettings.openNotificationSettings();
              } else if (index == 2) {
                AppSettings.openAppSettings();
              } 
              // else if(index ==3){
                
              // }

              // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(index)));
            },
          ),
        );
      },
    );
  }
}
