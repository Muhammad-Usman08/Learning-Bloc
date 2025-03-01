import 'package:bloc_counter_app/bloc/counter_bloc.dart';
import 'package:bloc_counter_app/bloc/counter_events.dart';
import 'package:bloc_counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text(
          'Counter Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(state.counter.toString(),
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
          }),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: const Text('Add Counter')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: const Text('Delete Counter')),
            ],
          )
        ],
      ),
    );
  }
}
