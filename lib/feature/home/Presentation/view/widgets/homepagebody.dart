import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/core/widgets/custom_Loading_indicator.dart';
import 'package:flutterapp/feature/home/Presentation/view/widgets/customcard.dart';
import 'package:flutterapp/feature/home/data/cubit/getdata_cubit.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<GetdataCubit, GetdataState>(
      builder: (context, state) {
        if (state is GetdataSuccess) {
          final notes = state.data;
          return GridView.builder(
            itemCount: notes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: height / 3.6,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomCard(
                  note: notes[index],
                ),
              );
            },
          );
        } else if (state is GetdataFaluire) {
          return Center(
            child: Text('Failed to fetch data: ${state.errMessage}'),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
