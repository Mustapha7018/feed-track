import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/features/auth/presentation/pages/dashboard_screen.dart';
import 'package:feed_track/features/auth/presentation/pages/signup_screen.dart';
import 'package:feed_track/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.bodyPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: AppTypography.h3,
              ),
              Text(
                'Enter your credentials to continue',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textHint,
                  fontWeight: FontWeight.w300,
                ),
              ),
              AppSpacing.verticalGapXXLarge,
              AuthInputField(
                hintText: 'Enter your email',
              ),
              AppSpacing.verticalGapSmall,
              AuthInputField(
                hintText: 'Enter your password',
                isPassword: true,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              AppSpacing.verticalGapSmall,
              AppButton(
                text: 'Login',
                height: 6.h,
                isFullWidth: true,
                onPressed: () {
                  Navigator.push(context, DashboardScreen.route());
                },
              ),
              AppSpacing.verticalGapLarge,
              Align(
                child: Text(
                  'or',
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              AppSpacing.verticalGapLarge,
              AppButton(
                text: 'Continue with Google',
                textColor: AppColors.textHint,
                type: ButtonType.outlined,
                iconPosition: IconPosition.left,
                icon: SvgPicture.asset(
                  'assets/svgs/google_icon.svg',
                ),
                height: 6.h,
                isFullWidth: true,
                onPressed: () {},
              ),
              AppSpacing.verticalGapLarge,
              Align(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.normal,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, SignupScreen.route());
                          },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
