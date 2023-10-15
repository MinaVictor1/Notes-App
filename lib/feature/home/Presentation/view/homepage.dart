import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/feature/home/Presentation/view/widgets/customfloatingactionbutton.dart';
import 'package:flutterapp/feature/home/data/cubit/getdata_cubit.dart';
import 'widgets/drawer.dart';
import 'widgets/homepagebody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const CustomFloatingActionButton(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home Page'),
        ),
        endDrawer: const DrawerPage(),
        body: BlocProvider(
          create: (context) => GetdataCubit()..fetchData(),
          child: const HomePageBody(),
        ),
      ),
    );
  }
}
