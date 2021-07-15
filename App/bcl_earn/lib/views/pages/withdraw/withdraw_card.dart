import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/views/widgets/form_field.dart';
import 'package:bcl_earn/views/widgets/login_button.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/constants/payment_method.dart';

class WithDrawCard extends StatefulWidget {
  @override
  _WithDrawCardState createState() => _WithDrawCardState();
}

class _WithDrawCardState extends State<WithDrawCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              /*SizedBox(
                height: Get.size.height / 16,
              ),*/
              Padding(
                padding: EdgeInsets.all(Get.size.height / 16),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: MyText(
                              label: "Your Balance:\n321",
                              color: Colors.black,
                              size: 24,
                              fontWeight: FontWeight.bold,
                              textAlignment: TextAlign.center,
                            ),
                          ),
                          Wrap(
                            children: [
                              Radio(
                                value: PaymentMethod.flexy,
                                groupValue: _site,
                                onChanged: (PaymentMethod value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 10, 16),
                                child: Text("Flexy"),
                              ),
                              Radio(
                                value: PaymentMethod.nagot,
                                groupValue: _site,
                                onChanged: (PaymentMethod value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 10, 16),
                                child: Text("Nagot"),
                              ),
                              Radio(
                                value: PaymentMethod.bkash,
                                groupValue: _site,
                                onChanged: (PaymentMethod value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 10, 16),
                                child: Text("Bkash"),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MyText(
                                    label: "170",
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MyTextFormField(
                            labelText: 'Number',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.number,
                          ),

                          ///button
                          Center(
                            child: MyLoginButton(
                              label: "Withdraw",
                              onClick: () {},
                              color: MyColors.appBarColor,
                              labelColor: Colors.white,
                            ),
                          ),

                          ///text
                          MyText(
                            label: "Recharge 1700 = 10 Taka",
                            color: Colors.black,
                            size: 16,
                            textAlignment: TextAlign.center,
                          ),

                          MyText(
                            label: "Recharge 1700 = 10 Taka",
                            color: Colors.black,
                            size: 16,
                            textAlignment: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// note
                          MyText(
                            label:
                                "We will confirmed your payment within 1 hours",
                            color: Colors.black,
                            size: 16,
                            textAlignment: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PaymentMethod _site = PaymentMethod.bkash;
}
