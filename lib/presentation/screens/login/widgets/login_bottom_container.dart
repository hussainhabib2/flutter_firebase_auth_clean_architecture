import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';



class LoginBottomContainer extends StatelessWidget {
  const LoginBottomContainer({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text(
            AppStrings.OR_CONTINUE_WITH,
            style: Theme.of(context).textTheme.headline6?.merge(
                TextStyle(color: Colors.grey.shade400, fontSize: 16)),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppStrings.LOGIN_WITH_GOOGLE,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.merge(TextStyle(
                        color: AppColors.BUTTON_TEXT_COLOR)),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppTextSizes.CIRCULAR_RADIUS_SIZE),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.facebook,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppStrings.LOGIN_WITH_FACEBOOK,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.merge(TextStyle(
                        color: AppColors.BUTTON_TEXT_COLOR)),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade400,
                surfaceTintColor: AppColors.PRIMARY_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppTextSizes.CIRCULAR_RADIUS_SIZE),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
