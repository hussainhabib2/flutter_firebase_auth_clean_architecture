import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers.dart';

class PasswordTextFormWidget extends StatefulWidget {
  const PasswordTextFormWidget(
      {Key? key, required TextEditingController passwordController})
      : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  State<PasswordTextFormWidget> createState() => _PasswordTextFormWidgetState();
}

class _PasswordTextFormWidgetState extends State<PasswordTextFormWidget> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppStrings.PASSWORD,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.merge(TextStyle(color: AppColors.TITLE_COLOR)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget._passwordController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !_passwordVisible,
          validator: (input) => Helpers.requiredValidation(input!),
          decoration: InputDecoration(
            hintText: "Enter " + AppStrings.PASSWORD,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              borderRadius:
                  BorderRadius.circular(AppTextSizes.CIRCULAR_RADIUS_SIZE),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
              borderRadius:
                  BorderRadius.circular(AppTextSizes.CIRCULAR_RADIUS_SIZE),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
              borderRadius:
                  BorderRadius.circular(AppTextSizes.CIRCULAR_RADIUS_SIZE),
            ),
            focusedBorder: OutlineInputBorder(
              //<-- SEE HERE
              borderSide:
                  BorderSide(width: 1.5, color: AppColors.PRIMARY_COLOR),
              borderRadius:
                  BorderRadius.circular(AppTextSizes.CIRCULAR_RADIUS_SIZE),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
