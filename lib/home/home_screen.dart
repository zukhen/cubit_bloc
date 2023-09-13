import 'package:cubit_bloc/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == Status.initial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Data is initialized"),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().fetchData();
                    },
                    child: const Text('Fetch Data'),
                  ),
                ],
              ),
            );
          } else if (state.status == Status.fetching) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == Status.success) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];
                return ListTile(
                  title: Text(item['title'].toString()),
                  subtitle: Text(item['id'].toString()),
                );
              },
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
