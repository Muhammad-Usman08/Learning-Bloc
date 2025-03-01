import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/counter_events.dart';
import 'package:bloc_counter_app/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment( IncrementCounter events, Emitter<CounterState> emit){
      emit(state.copywith(counter: state.counter +1));
  }

  void _decrement( DecrementCounter events, Emitter<CounterState> emit){
      emit(state.copywith(counter: state.counter -1));
  }
}
