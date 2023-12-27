import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers.dart';

class EmailTextFormWidget extends StatelessWidget {
  const EmailTextFormWidget({
    Key? key,
    required TextEditingController emailController,
    required this.context,

  }) : _emailController = emailController, super(key: key);

  final TextEditingController _emailController;
  final BuildContext context;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppStrings.EMAIL,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.merge(TextStyle(
                color: AppColors.TITLE_COLOR)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _emailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          validator: (input) =>
              Helpers.validateEmail(input!),
          onFieldSubmitted: (_) =>
              FocusScope.of(context).nextFocus(),
          decoration: InputDecoration(
            hintText: "Enter " + AppStrings.EMAIL,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey), //<-- SEE HERE
              borderRadius: BorderRadius.circular(
                  AppTextSizes.CIRCULAR_RADIUS_SIZE),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Colors.redAccent),
              borderRadius: BorderRadius.circular(
                  AppTextSizes.CIRCULAR_RADIUS_SIZE),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Colors.redAccent),
              borderRadius: BorderRadius.circular(
                  AppTextSizes.CIRCULAR_RADIUS_SIZE),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.5,
                  color: AppColors.PRIMARY_COLOR),
              borderRadius: BorderRadius.circular(
                  AppTextSizes.CIRCULAR_RADIUS_SIZE),
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.email,
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