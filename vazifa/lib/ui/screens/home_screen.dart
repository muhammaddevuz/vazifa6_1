import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa/signin_bloc/signin_bloc.dart';
import 'package:vazifa/signin_bloc/signin_event.dart';
import 'package:vazifa/ui/screens/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is SignInLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SignInErrorState) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is SignedOutState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SigninScreen()));
        }

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  context.read<SignInBloc>().add(SignOut());
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: Center(
            child: Text("Hello World"),
          ),
        );
      },
    );
  }
}
