import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:news/pages/screens.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          'Add New Card',
          style: primaryColor20SemiBoldTextStyle,
        ),
      ),
      body: Column(
        children: <Widget>[
          creditCard(),
          cardForm(),
        ],
      ),
    );
  }

  creditCard() {
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
    );
  }

  cardForm() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CreditCardForm(
              cursorColor: primaryColor,
              formKey: formKey,
              obscureCvv: true,
              obscureNumber: true,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              themeColor: Colors.blue,
              cardNumberDecoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: fixPadding),
                border: OutlineInputBorder(),
                labelText: 'Number',
                labelStyle: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Kodchasan',
                ),
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDateDecoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: fixPadding),
                border: OutlineInputBorder(),
                labelText: 'Expired Date',
                labelStyle: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Kodchasan',
                ),
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: fixPadding),
                border: OutlineInputBorder(),
                labelText: 'CVV',
                labelStyle: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Kodchasan',
                ),
                hintText: 'XXX',
              ),
              cardHolderDecoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: fixPadding),
                border: OutlineInputBorder(),
                labelText: 'Card Holder',
                labelStyle: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Kodchasan',
                ),
              ),
              onCreditCardModelChange: onCreditCardModelChange,
            ),
            InkWell(
              onTap: () {
                if (formKey.currentState.validate()) {
                  // ignore: avoid_print
                  print('valid!');
                } else {
                  // ignore: avoid_print
                  print('invalid!');
                }
              },
              child: Container(
                margin: const EdgeInsets.all(fixPadding * 2.0),
                padding: const EdgeInsets.all(fixPadding * 1.2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'Validate',
                  style: whiteColor20BoldTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
