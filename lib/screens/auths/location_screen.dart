import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';
import 'category_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final countrypicker = const FlCountryCodePicker();
  CountryCode? countryCode;
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
                    'We love places',
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
                      'So where would you love to see request from? \n you can select up to 3 places.',
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
                  height: 41,
                ),
                Column(
                  children: [
                    TextField(
                      maxLines: 1,
                      onTap: () async {
                        final code = await countrypicker.showPicker(
                          context: context,
                          fullScreen: true,
                        );
                        setState(() {
                          countryCode = code;
                        });
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Type a  State or Country',
                        labelText: countryCode?.name,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
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
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Wrap(
                      children: [
                        Chip(
                          onDeleted: () {},
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.orange,
                          ),
                          backgroundColor: const Color(0xffE5E5E5),
                          label: const Text(
                            'Lagos, Nigeria',
                            style: TextStyle(color: Color(0xffF23051)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Chip(
                          onDeleted: () {},
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.orange,
                          ),
                          backgroundColor: const Color(0xffE5E5E5),
                          label: const Text(
                            'Edertal, Germany',
                            style: TextStyle(color: Color(0xffF23051)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Wrap(
                      children: [
                        Chip(
                          onDeleted: () {},
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.orange,
                          ),
                          backgroundColor: const Color(0xffE5E5E5),
                          label: const Text(
                            'Vicenza, AO, Italy',
                            style: TextStyle(color: Color(0xffF23051)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 320,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const CategoryScreen();
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
                          children: [
                            Text(
                              'Next',
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
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
