import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/custom_dropdown.dart';
import 'package:feed_track/features/auth/presentation/pages/dashboard_screen.dart';
import 'package:feed_track/features/auth/presentation/pages/login_screen.dart';
import 'package:feed_track/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignupScreen());
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _selectedRegion;
  
  final List<String> _ghanaRegions = [
    'Ahafo Region', 
    'Ashanti Region', 
    'Bono East Region', 
    'Bono Region', 
    'Central Region', 
    'Eastern Region', 
    'Greater Accra Region', 
    'North East Region', 
    'Northern Region', 
    'Oti Region', 
    'Savannah Region', 
    'Upper East Region', 
    'Upper West Region', 
    'Volta Region', 
    'Western North Region', 
    'Western Region'
  ];

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
                'Create an Account',
                style: AppTypography.h3,
              ),
              Text(
                'Fill in your details to get started',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textHint,
                  fontWeight: FontWeight.w300,
                ),
              ),
              AppSpacing.verticalGapLarge,
              AuthInputField(
                hintText: 'Full Name',
              ),
              AppSpacing.verticalGapSmall,
              AuthInputField(
                hintText: 'Enter your email',
              ),
              AppSpacing.verticalGapSmall,
              AuthInputField(
                hintText: 'Create password',
                isPassword: true,
              ),
              AppSpacing.verticalGapSmall,
              AuthInputField(
                hintText: 'Confirm password',
                isPassword: true,
              ),
              AppSpacing.verticalGapSmall,
              CustomDropdown(
                hintText: 'Select your region',
                items: _ghanaRegions,
                value: _selectedRegion,
                onChanged: (value) {
                  setState(() {
                    _selectedRegion = value;
                  });
                },
              ),
              AppSpacing.verticalGapXLarge,
              AppButton(
                text: 'Sign Up',
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
                icon: SvgPicture.asset('assets/svgs/google_icon.svg'),
                height: 6.h,
                isFullWidth: true,
                onPressed: () {},
              ),
              AppSpacing.verticalGapLarge,
              Align(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.normal,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context, LoginScreen.route());
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
