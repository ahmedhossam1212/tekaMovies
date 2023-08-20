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
      child: BlocConsumer<MovieCubit, MoviesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieCubit.get(context);
          return Scaffold(
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    buildMovieItem(cubit.allList[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: cubit.allList.length),
          );
        },
      ),
    );
  }

  Widget buildMovieItem(Movie model) => Column(
        children: [Image.network(model.backdropPath), Text(model.title)],
      );
}
