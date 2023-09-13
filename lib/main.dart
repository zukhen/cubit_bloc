import 'dart:math';

import 'package:cubit_bloc/cubit/counter_cubit.dart';
import 'package:cubit_bloc/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo', theme: ThemeData(), home: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.black,
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.blue
    ];
    final random = Random();
    return Scaffold(
        backgroundColor: context.read<CounterCubit>().state.counter % 2 == 0
            ? colors[random.nextInt(colors.length)]
            : Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${context.watch<CounterCubit>().state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              //context.watch theo dõi sự biến đổi
              InkWell(
                onTap: () =>
                    context.read<CounterCubit>().navigateToHomeScree(context),
                child: Text(
                  context.watch<CounterCubit>().state.counter == 10
                      ? "navigate to Home"
                      : "counter is not 10",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              //context.read để đọc giá trị, lấy các phần tử trong CounterCubit
              onPressed: () => context.read<CounterCubit>().incrementState(),
              tooltip: '+',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              //context.read để đọc giá trị, lấy các phần tử trong CounterCubit
              onPressed: () => context.read<CounterCubit>().decrementState(),
              tooltip: '-',
              child: const Icon(Icons.remove),
            ),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
