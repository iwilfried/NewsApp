import 'package:news/pages/screens.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool password = false;
  bool confirmPassword = false;

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
            'Sign Up',
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
                  nameTextField(),
                  emailTextField(),
                  mobileNumberTextField(),
                  passwordTextField(),
                  confirmPasswordTextField(),
                  signinText(),
                  otherSigninOptions(),
                  signupButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  nameTextField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 1.5,
        vertical: fixPadding * 1.2,
      ),
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
        keyboardType: TextInputType.name,
        cursorColor: primaryColor,
        style: primaryColor16MediumTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintStyle: greyColor16MediumTextStyle,
          hintText: 'Name',
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  emailTextField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.5,
        fixPadding * 2.0,
        fixPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 1.5,
        vertical: fixPadding * 1.2,
      ),
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
        keyboardType: TextInputType.emailAddress,
        cursorColor: primaryColor,
        style: primaryColor16MediumTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintStyle: greyColor16MediumTextStyle,
          hintText: 'Email',
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  mobileNumberTextField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.5,
        fixPadding * 2.0,
        fixPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 1.5,
        vertical: fixPadding * 1.2,
      ),
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
        keyboardType: TextInputType.phone,
        cursorColor: primaryColor,
        style: primaryColor16MediumTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintStyle: greyColor16MediumTextStyle,
          hintText: 'Mobile Number',
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  passwordTextField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.5,
        fixPadding * 2.0,
        fixPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 1.5,
        vertical: fixPadding * 1.2,
      ),
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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: !password,
              cursorColor: primaryColor,
              style: primaryColor16MediumTextStyle,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintStyle: greyColor16MediumTextStyle,
                hintText: 'Password',
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                password = !password;
              });
            },
            child: Icon(
              password ? Icons.visibility : Icons.visibility_off,
              size: 16,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }

  confirmPasswordTextField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.5,
        fixPadding * 2.0,
        fixPadding / 2,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 1.5,
        vertical: fixPadding * 1.2,
      ),
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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: !confirmPassword,
              cursorColor: primaryColor,
              style: primaryColor16MediumTextStyle,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintStyle: greyColor16MediumTextStyle,
                hintText: 'Confirm Password',
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                confirmPassword = !confirmPassword;
              });
            },
            child: Icon(
              confirmPassword ? Icons.visibility : Icons.visibility_off,
              size: 16,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }

  signinText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: fixPadding * 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: greyColor17MediumTextStyle,
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Signin()),
            ),
            child: Text(
              'Sign In',
              style: primaryColor17MediumTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  otherSigninOptions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: fixPadding, top: fixPadding * 2.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: fixPadding * 2.0),
                  color: greyColor,
                  height: 0.8,
                  width: double.infinity,
                ),
              ),
              widthSpace,
              Text(
                'OR',
                style: greyColor17SemiBoldTextStyle,
              ),
              widthSpace,
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: fixPadding * 2.0),
                  color: greyColor,
                  height: 0.8,
                  width: double.infinity,
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color(0xff4267b2),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/facebook_icon.png',
                  height: 18,
                  width: 18,
                ),
              ),
              widthSpace,
              widthSpace,
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color(0xff1da1f2),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/twitter_icon.png',
                  height: 18,
                  width: 18,
                ),
              ),
              widthSpace,
              widthSpace,
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color(0xffea4335),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/google+_icon.png',
                  height: 18,
                  width: 18,
                ),
              ),
              widthSpace,
              widthSpace,
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff285aeb),
                      Color(0xffd6249f),
                      Color(0xfffd5949),
                      Color(0xfffdf497),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/insta_icon.png',
                  color: whiteColor,
                  height: 18,
                  width: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  signupButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.5,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Otp()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: primaryColor),
          ),
          child: Text(
            'Sign Up',
            style: whiteColor20BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
