import 'package:flutter/material.dart';
import 'package:mvvm_strructure/res/colors.dart';
import 'package:mvvm_strructure/res/components/round_button.dart';
import 'package:mvvm_strructure/res/components/round_text_field.dart';
import 'package:mvvm_strructure/utils/routes/utils.dart';
import 'package:mvvm_strructure/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    void performLogin() {
      if (_passwordController.text.isEmpty && _emailController.text.isEmpty) {
        Utils.flushBarErrorMessage('Please enter email and password', context);
      } else if (_emailController.text.isEmpty) {
        Utils.flushBarErrorMessage('Please enter email', context);
      } else if (_passwordController.text.isEmpty) {
        Utils.flushBarErrorMessage('Please enter password', context);
      } else if (_passwordController.text.length < 6) {
        Utils.flushBarErrorMessage(
            'Pleasr enter atleast 6 digit password', context);
      } else {
        Map data = {
          'email': _emailController.text.toString(),
          'password': _passwordController.text.toString(),
        };
        authViewModel.loginApi(data, context);

        print('Api Hit');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
        foregroundColor: AppColors.whiteColor,
        elevation: 10,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundTextField(
              label: 'Email',
              hint: 'abc@gmail.com',
              prefixIcon: Icons.email,
              textEditingController: _emailController,
              inputType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            RoundTextField(
              label: 'Password ',
              hint: '********',
              prefixIcon: Icons.lock,
              isPasswordField: true,
              textEditingController: _passwordController,
              inputType: TextInputType.visiblePassword,
              focusNode: passwordFocusNode,
              onFieldSubmitted: (value) {
                performLogin();
              },
            ),
            SizedBox(height: height * 0.08),
            RoundButton(
              title: 'Login',
              onPress: performLogin,
              loading: authViewModel.loading,
            )
          ],
        ),
      ),
    );
  }
}
