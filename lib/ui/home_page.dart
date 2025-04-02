import 'package:bloc_cubit/controllers/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  
  final String title;

  const MyHomePage({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => CounterCubit(),
        
      child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state){
                      return Text(
                      state.count.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                    }
                  ),
                  const Text('You have pushed the button this many times:'),
                ],
              ),
            ),
            floatingActionButton: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Column(
                mainAxisAlignment: MainAxisAlignment.end,
               children: [
                FloatingActionButton(onPressed: ((){
                  context.read<CounterCubit>().increment();
                }),
                tooltip: 'Increment',
                 child: Icon(Icons.add),
                ),
                SizedBox(height: 4,),
                FloatingActionButton(onPressed: (){
                  context.read<CounterCubit>().decrement();
                },
                tooltip: 'Decrement',
                 child: Icon(Icons.remove
                ),)
               ],
               
                        );
              },
              
            )
          ),
    );
  }
}
