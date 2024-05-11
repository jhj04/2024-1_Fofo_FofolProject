import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                // padding: EdgeInsets.all(15),
                height: 100,
                child: Center(
                    child: Text(
                        "Fofol",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'YES24GothicR',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF647087),
                        ),
                      ),
                  ),
              ),
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.all(20),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  iconSize: 50,
                  onPressed: (){},
                ),
              ),
            ],
          ),
          // Container(
            // width: double.infinity,
            // height: 100,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 1,
            //   )),

          // ),
          SettingsList(
          sections: [
            SettingsSection(
              title: Text('DISPLAY ZOOM'),
              tiles: [
                SettingsTile.navigation(
                  onPressed: (_) {},
                  title: Text('View'),
                  value: Text('Standard'),
                  description: Text(
                    'Choose a view for iPhone. '
                    'Zoomed shadows larger controls. '
                    'Standart shows more content.',
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: Text('UI AUTOMATION'),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: true,
                  title: Text('Enable UI Automation'),
                ),
                SettingsTile.navigation(
                  title: Text('Multipath Networking'),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: Text('HTTP/3'),
                ),
              ],
            ),
            SettingsSection(
              title: Text('IAD DEVELOPER APP TESTING'),
              tiles: [
                SettingsTile.navigation(
                  title: Text('Fill Rate'),
                ),
                SettingsTile.navigation(
                  title: Text('Add Refresh Rate'),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: Text('Unlimited Ad Presentation'),
                ),
              ],
            ),
            SettingsSection(
              title: Text('STATE RESTORATION TESTING'),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: Text(
                    'Fast App Termination',
                  ),
                  description: Text(
                    'Terminate instead of suspending apps when backgrounded to '
                    'force apps to be relaunched when tray '
                    'are foregrounded.',
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: Text('General'),
              tiles: [
                SettingsTile.navigation(
                  title: Text('Abstract settings screen'),
                  leading: Icon(Icons.ac_unit_outlined),
                  description:
                      Text('UI created to show plugin\'s possibilities'),
                  onPressed: (context) {},
                )
              ],
            ),
            // SettingsSection(
            //   title: Text('APPEARANCE'),
            //   tiles: [
            //     SettingsTile.switchTile(
            //       onToggle: (value) {
            //         setState(() {
            //           darkTheme = value;
            //         });
            //       },
            //       initialValue: darkTheme,
            //       title: Text('Dark Appearance'),
            //     ),
            //   ],
            // ),
            SettingsSection(
              title: Text('Common'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  value: Text('English'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: Icon(Icons.format_paint),
                  title: Text('Enable custom theme'),
                ),
              ],
            ),
          ],
        ),
      // SettingsList(
      //   sections: [
      //     SettingsSection(
      //         tiles: <SettingsTile>[
      //           SettingsTile.navigation(
      //             leading: Icon(Icons.language),
      //             title: Text('Language'),
      //             value: Text('English'),
      //           ),
      //           SettingsTile.switchTile(
      //             onToggle: (value) {},
      //             initialValue: true,
      //             leading: Icon(Icons.format_paint),
      //             title: Text('Enable custom theme'),
      //           ),
      //         ],
      //       ),     
      //     ],
      // ),
      ],
      ),
    );
  }
}