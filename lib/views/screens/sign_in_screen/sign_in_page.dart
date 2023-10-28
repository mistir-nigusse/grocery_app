import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/views/custom_widgets/rounded_textfield.dart';
import 'package:grocery_app/views/screens/sign_in_screen/sign_in_container.dart';

import '../../../blocs/authentication_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool authSuccess = false;
  void _handleAuthenticationSuccess(BuildContext context) {
  Future.delayed(Duration.zero, () {
    Navigator.of(context).pushNamed('/home');
  });
}


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is AuthenticationSuccess) {
          _handleAuthenticationSuccess(context);
                   return Scaffold(body: Center(child: CircularProgressIndicator()));

        } else if (state is AuthenticationFailure) {
          print(state.error);
          return Text('Failed: ${state.error}');
        } else {
          return SignIn_Container(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 25, left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CustomRoundedTextField(
                        onChanged: (email) {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(PhoneChanged(email));
                        },
                        labelText: "Email",
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CustomRoundedTextField(
                        onChanged: (password) {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(PasswordChanged(password));
                        },
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        ),
                        labelText: "Password",
                        controller: passwordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(SignInRequested(
                              phone: emailController.text,
                              password: passwordController.text,
                            ));

                            print('pressed');
                          },
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
