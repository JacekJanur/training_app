import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/global/cubit/global_training_cubit.dart';
import 'package:training_app/home/home.dart';
import 'package:training_app/overview/overview.dart';
import 'package:training_app/profile/profile.dart';
import 'package:training_app/workout/workout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalTrainingCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  final List<Widget> _pages = const [
    Home(),
    Overview(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training App'),
      ),
      floatingActionButton: Visibility(
        visible: _selectedPage == 0,
        child: FloatingActionButton.extended(
          label: const Text('Start workout'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Workout(),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _createBottomNavigationBar(),
      body: _pages[_selectedPage],
    );
  }

  BottomNavigationBar _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedPage,
      onTap: (value) {
        setState(() {
          _selectedPage = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.data_exploration,
          ),
          label: 'Overview',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
