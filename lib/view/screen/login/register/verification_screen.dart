import 'package:animate_do/animate_do.dart';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:pinput/pinput.dart';

class VerificationScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  final String verificationId;
  final String resendToken;
  const VerificationScreen(
      {super.key,
      required this.verificationId,
      required this.phoneNumber,
      required this.resendToken});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;
  final TextEditingController _pinPutController = TextEditingController();

  final String _code = '';

  late Timer _timer;
  int _start = 60;
  int _currentIndex = 0;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 2000);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex++;

        if (_currentIndex == 3) {
          _currentIndex = 0;
        }
      });
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
                      opacity: _currentIndex == 0 ? 1 : 0,
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
                      opacity: _currentIndex == 1 ? 1 : 0,
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
                      opacity: _currentIndex == 2 ? 1 : 0,
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
                  onSubmitted: (pin) async {},
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
                        if (_isResendAgain) return;
                        resend();
                      },
                      child: Text(
                        _isResendAgain
                            ? "Còn $_start giây"
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
                  onPressed: _code.length < 6
                      ? () {
                          showSnackBarSuccess(
                            context: context,
                            title: 'Xác minh',
                            message: '     Resend code: ${
                                widget.resendToken.toString()
                            }',
                          );
                          // Navigator.pushNamed(
                          //   context,
                          //   ConstantStringsRoute.routeToLoginScreen,
                          // );
                        }
                      : () {
                          verify();
                        },
                  color: appColor.primaryColor,
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  child: _isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: appColor.cardColor,
                            strokeWidth: 3,
                            color: appColor.canvasColor,
                          ),
                        )
                      : _isVerified
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
