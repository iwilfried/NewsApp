import 'package:news/pages/screens.dart';

class EditUserInformation extends StatefulWidget {
  const EditUserInformation({Key key}) : super(key: key);

  @override
  State<EditUserInformation> createState() => _EditUserInformationState();
}

class _EditUserInformationState extends State<EditUserInformation> {
  final nameController = TextEditingController(text: 'Krishna Rai');
  final passwordController = TextEditingController(text: 'KrishnaR');
  final emailController = TextEditingController(text: 'krishnarai@gmail.com');
  final mobileNumberController =
      TextEditingController(text: '(+91) 1234567890');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Edit',
          style: primaryColor20SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          heightSpace,
          heightSpace,
          profilePick(context),
          name(),
          password(),
          email(),
          mobileNumber(),
          button(context),
        ],
      ),
    );
  }

  profilePick(context) {
    return Stack(
      children: [
        Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(30.0),
            onTap: () => changeProfilePick(context),
            child: Hero(
              tag: 'profilePick',
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/users/user1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 2.0,
          right: 165.0,
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: whiteColor,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeProfilePick(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: whiteColor,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(fixPadding),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: fixPadding),
                      child: Text(
                        'Choose Option',
                        textAlign: TextAlign.center,
                        style: primaryColor14SemiBoldTextStyle,
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.camera_alt,
                              color: primaryColor,
                              size: 18.0,
                            ),
                            widthSpace,
                            widthSpace,
                            Text(
                              'Camera',
                              style: primaryColor14MediumTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.photo_library,
                              color: primaryColor,
                              size: 18.0,
                            ),
                            widthSpace,
                            widthSpace,
                            Text(
                              'Select From Gallery',
                              style: primaryColor14MediumTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  name() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 3.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding,
        vertical: fixPadding * 1.3,
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
            flex: 1,
            child: Text(
              'Name',
              style: greyColor16MediumTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              keyboardType: TextInputType.name,
              controller: nameController,
              cursorColor: primaryColor,
              style: primaryColor16MediumTextStyle,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  password() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding,
        vertical: fixPadding * 1.3,
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
            flex: 1,
            child: Text(
              'Password',
              style: greyColor16MediumTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              obscureText: true,
              controller: passwordController,
              cursorColor: primaryColor,
              style: primaryColor16MediumTextStyle,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  email() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding,
        vertical: fixPadding * 1.3,
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
            flex: 1,
            child: Text(
              'Email',
              style: greyColor16MediumTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              cursorColor: primaryColor,
              style: primaryColor16MediumTextStyle,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  mobileNumber() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding,
        vertical: fixPadding * 1.3,
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
            flex: 1,
            child: Text(
              'Mobile No',
              style: greyColor16MediumTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: mobileNumberController,
              cursorColor: primaryColor,
              style: primaryColor16MediumTextStyle,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  button(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 3.0,
      ),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: primaryColor),
          ),
          child: Text(
            'Save',
            style: whiteColor20BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
