import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../constant.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    Box settings = Hive.box(settingBox);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Light'),
            ValueListenableBuilder(
                valueListenable: settings.listenable(),
                builder: (context, box, _) {
                  Box darkModeBox = settings;
                  bool darkModeValue =
                      darkModeBox.get("darkMode", defaultValue: false);
                  return Switch(
                    value: darkModeValue,
                    onChanged: (val) =>
                        darkModeBox.put('darkMode', !darkModeValue),
                  );
                }),
            const Text('dark'),
          ],
        ),
      ],
    );
  }
}
