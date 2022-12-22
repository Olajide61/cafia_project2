import 'package:cafia_project2/screens/auths/verify_screen.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/state_utils.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  bool isChecked = false;
  final countrypicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/loginimage.png'),
              fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Just your phone\n number',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Please confirm your country code and \n enter your phone number',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final code = await countrypicker.showPicker(
                          context: context,
                          fullScreen: true,
                        );
                        setState(() {
                          countryCode = code;
                        });
                      },
                      child: TextField(
                        enabled: false,
                        maxLines: 1,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Type in your State or Country',
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          labelText: countryCode?.name,
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    final code =
                        await countrypicker.showPicker(context: context);
                    setState(() {
                      countryCode = code;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '+234',
                            labelText: countryCode?.dialCode,
                            hintStyle: TextStyle(color: AppColors.darkGrey),
                            labelStyle: TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: textController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Phone number',
                            hintStyle: TextStyle(color: AppColors.darkGrey),
                            labelStyle: TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        shape: const CircleBorder(),
                        activeColor: const Color(0xff74BDCB),
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'I agree to the',
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff667085)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Terms of Use',
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff74BDCB),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text('and'),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Privacy Policy',
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff74BDCB),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const VerifyScreen();
                          }),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.pink),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
