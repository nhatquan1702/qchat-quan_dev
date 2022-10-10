import 'package:animate_do/animate_do.dart';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/provider/verification_notifier.dart';
import 'package:chat_app/view/component/widget/show_snackbar.dart';
import 'package:chat_app/view/screen/login/login_vew_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  final String verificationId;
  final String resendToken;
  final bool isLogin;
  const VerificationScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
    required this.resendToken,
    required this.isLogin,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  final TextEditingController _pinPutController = TextEditingController();

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authViewModelProvider).verifyOTP(
          context,
          widget.verificationId,
          userOTP,
          widget.isLogin,
        );
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(verificationProvider).updateCurrentIndex();
      _pinPutController.text = "";
    });
    super.initState();
  }

  defaultPinTheme(BuildContext context) {
    return PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).canvasColor.withOpacity(0.8),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    int currentIndex = ref.watch(verificationProvider).currentIndex;
    bool isResendAgain = ref.watch(verificationProvider).isResendAgain;
    int start = ref.watch(verificationProvider).start;
    bool isLoading = ref.watch(verificationProvider).isLoading;
    bool isVerified = ref.watch(verificationProvider).isVerified;

    return Scaffold(
      backgroundColor: appColor.cardColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: AnimatedOpacity(
                      opacity: currentIndex == 0 ? 1 : 0,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/eza3-Rq5rqbcGs4EkHTolm43ZXQPGH_R4GugNLGJzuo/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNjk3/L2YzMDAzMWUzLTcz/MjYtNDg0ZS05MzA3/LTNkYmQ0ZGQ0ODhj/MS5zdmc.png',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: AnimatedOpacity(
                      opacity: currentIndex == 1 ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/pi1hTsTcrgVklEBNOJe2TLKO2LhU6OlMoub6FCRCQ5M/rs:fit:784:666/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzAv/MzA3NzBlMGUtZTgx/YS00MTZkLWI0ZTYt/NDU1MWEzNjk4MTlh/LnN2Zw.png',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: AnimatedOpacity(
                      opacity: currentIndex == 2 ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Image.network(
                        'https://ouch-cdn2.icons8.com/ElwUPINwMmnzk4s2_9O31AWJhH-eRHnP9z8rHUSS5JQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNzkw/Lzg2NDVlNDllLTcx/ZDItNDM1NC04YjM5/LWI0MjZkZWI4M2Zk/MS5zdmc.png',
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  ConstantStrings.verification,
                  style: TextStyle(
                      color: appColor.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 500),
                child: Text(
                  "Vui lòng nhập mã 6 chữ số được gửi đến \n ${widget.phoneNumber}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: appColor.canvasColor.withOpacity(0.6),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Verification Code Input
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 500),
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme(context),
                  controller: _pinPutController,
                  pinAnimationType: PinAnimationType.fade,
                  onCompleted: (pin) {},
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ConstantStrings.notSendOTP,
                      style: TextStyle(
                        fontSize: 14,
                        color: appColor.canvasColor.withOpacity(0.6),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (isResendAgain) return;
                        ref.read(verificationProvider).resend();
                      },
                      child: Text(
                        isResendAgain
                            ? "Còn $start giây"
                            : ConstantStrings.resendOTP,
                        style: TextStyle(color: appColor.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 500),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  elevation: 0,
                  onPressed: _pinPutController.text.toString().trim().length < 6
                      ? () {
                          showSnackBarFailure(
                            context: context,
                            title: ConstantStrings.verification,
                            message: ConstantStrings.verificationFalse,
                          );
                        }
                      : () {
                          verifyOTP(
                            ref,
                            context,
                            _pinPutController.text.toString().trim(),
                          );
                          ref.read(verificationProvider).verify();
                        },
                  color: appColor.primaryColor,
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  child: isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: appColor.cardColor,
                            strokeWidth: 3,
                            color: appColor.canvasColor,
                          ),
                        )
                      : isVerified
                          ? Icon(
                              Icons.check_circle,
                              color: appColor.cardColor,
                              size: 30,
                            )
                          : Text(
                              ConstantStrings.verification,
                              style: TextStyle(
                                color: appColor.cardColor,
                                fontWeight: FontWeight.w600,
                              ),
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
