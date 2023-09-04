import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tekamovie/cubit.dart';
import 'package:tekamovie/model.dart';
import 'package:tekamovie/states.dart';

class UI extends StatelessWidget {
  const UI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMovie(),
      child: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          buildItem(cubit.allList[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: cubit.allList.length),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildItem(Results model) => Column(
        children: [
          Image.network(model.backdropPath),
          Text(model.title),
        ],
      );
}
