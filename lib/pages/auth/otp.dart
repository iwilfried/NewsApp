import 'dart:async';
import 'package:news/pages/screens.dart';

class Otp extends StatefulWidget {
  const Otp({Key key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController controller1;
  TextEditingController controller2;
  TextEditingController controller3;
  TextEditingController controller4;

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Verification',
            style: primaryColor20BoldTextStyle,
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      fixPadding * 2.0,
                      0.0,
                      fixPadding * 2.0,
                      fixPadding * 2.0,
                    ),
                    child: Text(
                      'Enter the otp code from the phone we just sent you',
                      style: primaryColor13SemiBoldTextStyle,
                    ),
                  ),
                  otpTextField(),
                  resendText(),
                  doneButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  otpTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: greyColor),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color: primaryColor.withOpacity(0.1),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                ),
              ],
            ),
            child: TextField(
              onChanged: (v) {
                String value = controller1.text ?? '';
                if (value.isEmpty) {
                  return;
                }
                FocusScope.of(context).requestFocus(focusNode2);
              },
              focusNode: focusNode1,
              controller: controller1,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: primaryColor16MediumTextStyle,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: greyColor),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color: primaryColor.withOpacity(0.1),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                ),
              ],
            ),
            child: TextField(
              onChanged: (v) {
                String value = controller2.text ?? '';
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(focusNode1);
                  return;
                }
                FocusScope.of(context).requestFocus(focusNode3);
              },
              focusNode: focusNode2,
              controller: controller2,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: primaryColor16MediumTextStyle,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: greyColor),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color: primaryColor.withOpacity(0.1),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                ),
              ],
            ),
            child: TextField(
              onChanged: (v) {
                String value = controller3.text ?? '';
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(focusNode2);
                  return;
                }
                FocusScope.of(context).requestFocus(focusNode4);
              },
              focusNode: focusNode3,
              controller: controller3,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: primaryColor16MediumTextStyle,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: greyColor),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color: primaryColor.withOpacity(0.1),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                ),
              ],
            ),
            child: TextField(
              onChanged: (v) {
                String value = controller4.text ?? '';
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(focusNode3);
                  return;
                }
                waitDialog();
              },
              focusNode: focusNode4,
              controller: controller4,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              style: primaryColor16MediumTextStyle,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  resendText() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Didn\'t receive OTP Code!',
            style: primaryColor14MediumTextStyle,
          ),
          widthSpace,
          widthSpace,
          InkWell(
            onTap: () {},
            child: Text(
              'Resend',
              style: primaryColor14BoldTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  doneButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        0.0,
      ),
      child: InkWell(
        onTap: () => waitDialog(),
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: primaryColor),
          ),
          child: Text(
            'Done',
            style: whiteColor20BoldTextStyle,
          ),
        ),
      ),
    );
  }

  waitDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (contxet) {
        return Dialog(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  const CircularProgressIndicator(
                    color: primaryColor,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'Please Wait...',
                    style: greyColor16MediumTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                ],
              ),
            ],
          ),
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () {
        currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
        );
      },
    );
  }
}
