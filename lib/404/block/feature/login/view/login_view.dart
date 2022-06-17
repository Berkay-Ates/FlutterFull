import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../../../200/image_learn_200.dart';
import '../service/login_service.dart';
import '../../../../../product/service/vexana_network_manager.dart';

import '../cubit/login_state.dart';
import '../cubit/modal_view_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String _login = 'Login';
  final String _appbarTitle = 'Login View';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(networkManager: VexanaNetworkManager())),
      child: Scaffold(
          appBar: AppBar(title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary)
                  : Text(_appbarTitle);
            },
          )),
          body: Form(
            key: _formLoginKey,
            child: BlocSelector<LoginCubit, LoginState, bool>(
              selector: (state) => state.isLoading,
              builder: (context, state) {
                return IgnorePointer(
                  ignoring: state,
                  child: AnimatedOpacity(
                    opacity: !state ? 1 : 0.2,
                    duration: const Duration(seconds: 1),
                    child: Column(
                      children: [
                        _LocalColumn(cMail: _emailController, cPassword: _passwordController),
                        const SizedBox(height: 15),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            //* Block consumer surekli dinliyor ve bize ona gore sonuclar donduruyor
                            if (state.isCompleted) {
                              context.navigateToPage(const ImageLearn200());
                            }
                          },
                          builder: (context, state) {
                            return BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                    onPressed: () {
                                      if ((_formLoginKey.currentState?.validate() ?? false)) {
                                        context
                                            .read<LoginCubit>()
                                            .checkUser(_emailController.text, _passwordController.text);
                                      }
                                    },
                                    child: SizedBox(
                                      child: Text(
                                        '$_login ${(state.loginModel?.email ?? '- no mail exists')}',
                                        textAlign: TextAlign.center,
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.3,
                                    ));
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}

class _LocalColumn extends StatelessWidget {
  const _LocalColumn({
    Key? key,
    required TextEditingController cMail,
    required TextEditingController cPassword,
  })  : _controllerM1 = cMail,
        _controllerP2 = cPassword,
        super(key: key);

  final TextEditingController _controllerM1;
  final TextEditingController _controllerP2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controllerM1,
          validator: (String? value) => (value?.isValidEmail ?? false) ? null : 'there are problem',
          decoration: const InputDecoration(label: Text('email')),
        ),
        TextFormField(
          controller: _controllerP2,
          obscureText: true,
          decoration: const InputDecoration(label: Text('password')),
          validator: (String? value) => ((value?.length ?? 0) > 6) ? null : 'there are problem',
        ),
      ],
    );
  }
}

class Paddings {
  static const _paddingLow = EdgeInsets.symmetric(vertical: 10, horizontal: 15);
}
