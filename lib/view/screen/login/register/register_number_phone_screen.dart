import 'package:animate_do/animate_do.dart';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/provider/phone_number_notifier.dart';
import 'package:chat_app/view/component/widget/show_snackbar.dart';
import 'package:chat_app/view/screen/login/login_vew_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterWithPhoneNumber extends ConsumerStatefulWidget {
  const RegisterWithPhoneNumber({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterWithPhoneNumberState();
}

class _RegisterWithPhoneNumberState
    extends ConsumerState<RegisterWithPhoneNumber> {
  final bool _isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String initialCountry = 'VN';

  void sendPhoneNumber(String phoneNumber) {
    if (phoneNumber.isNotEmpty) {
      ref.read(authViewModelProvider).signInWithPhone(context, phoneNumber);
    } else {
      showSnackBarFailure(
        context: context,
        title: ConstantStrings.reload,
        message: ConstantStrings.notValidNumberPhone,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    PhoneNumber phoneNumber = ref.watch(phoneNumberProvider).phoneNumber;

    return Scaffold(
      backgroundColor: appColor.cardColor,
      body: SingleChildScrollView(
        child: Container(
          color: appColor.cardColor,
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInDown(
                  child: Text(
                    ConstantStrings.register,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: appColor.primaryColor),
                  ),
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20),
                    child: Text(
                      ConstantStrings.pleaseEnterNumberPhone,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: appColor.canvasColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 400),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: appColor.cardColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: appColor.cardColor),
                      boxShadow: [
                        BoxShadow(
                          color: appColor.canvasColor.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            ref
                                .read(phoneNumberProvider)
                                .updatePhoneNumber(number);
                          },
                          onInputValidated: (bool value) {
                            //print(value);
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          searchBoxDecoration: InputDecoration(
                            labelText: ConstantStrings.search,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: appColor.canvasColor.withOpacity(0.5),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: appColor.canvasColor.withOpacity(0.5),
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: appColor.canvasColor.withOpacity(0.5),
                            ),
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(
                            color: appColor.canvasColor,
                          ),
                          initialValue: phoneNumber,
                          formatInput: false,
                          maxLength: 12,
                          keyboardType: const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
                          cursorColor: appColor.canvasColor.withOpacity(0.5),
                          inputDecoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              bottom: 15,
                              left: 0,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: appColor.canvasColor.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                          onSaved: (PhoneNumber number) {},
                          validator: (value) {
                            if (value.toString().isEmpty ||
                                !RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$")
                                    .hasMatch(value!.toString())) {
                              return ConstantStrings.notValidNumberPhone;
                            } else {
                              return null;
                            }
                          },
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: appColor.canvasColor.withOpacity(0.2),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 600),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // ignore: use_build_context_synchronously
                        final String tmp =
                            phoneNumber.phoneNumber.toString().trim();
                        sendPhoneNumber(tmp);
                        Navigator.pushNamed(
                          context,
                          ConstantStringsRoute.routeToVerificationScreen,
                          arguments: {
                            'phoneNumber': tmp,
                            'verificationId': 'verificationId',
                            'resendToken': 'resendToken',
                          },
                        );
                      }
                    },
                    color: appColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                    child: _isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: appColor.cardColor,
                              color: appColor.canvasColor,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            ConstantStrings.sendOTP,
                            style: TextStyle(
                              color: appColor.cardColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantStrings.haveAccount,
                        style: TextStyle(
                          color: appColor.canvasColor.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ConstantStringsRoute.routeToLoginScreen,
                          );
                        },
                        child: Text(
                          ConstantStrings.login,
                          style: TextStyle(
                            color: appColor.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 24,
                // ),
                // FadeInDown(
                //   delay: const Duration(milliseconds: 600),
                //   child: MaterialButton(
                //     minWidth: double.infinity,
                //     onPressed: () {
                //       final String tmp =
                //           phoneNumber.phoneNumber.toString().trim();
                //       sendPhoneNumber(tmp);
                //       // Navigator.pushNamed(
                //       //   context,
                //       //   ConstantStringsRoute.routeToVerificationScreen,
                //       //   arguments: {
                //       //     'phoneNumber': tmp,
                //       //     'verificationId': 'verificationId',
                //       //     'resendToken': 'resendToken',
                //       //   },
                //       // );
                //     },
                //     color: appColor.primaryColor,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //       vertical: 15,
                //       horizontal: 30,
                //     ),
                //     child: _isLoading
                //         ? SizedBox(
                //             width: 20,
                //             height: 20,
                //             child: CircularProgressIndicator(
                //               backgroundColor: appColor.cardColor,
                //               color: appColor.canvasColor,
                //               strokeWidth: 2,
                //             ),
                //           )
                //         : Text(
                //             ConstantStrings.sendOTP,
                //             style: TextStyle(
                //               color: appColor.cardColor,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // FadeInDown(
                //   delay: const Duration(milliseconds: 800),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         ConstantStrings.haveAccount,
                //         style: TextStyle(
                //           color: appColor.canvasColor.withOpacity(0.5),
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 5,
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamed(
                //             context,
                //             ConstantStringsRoute.routeToLoginScreen,
                //           );
                //         },
                //         child: Text(
                //           ConstantStrings.login,
                //           style: TextStyle(
                //             color: appColor.primaryColor,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
