import 'package:flutter/material.dart';
import 'widgets/settingbody.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: const SafeArea(child: SettingBody()),
    );
  }
}
