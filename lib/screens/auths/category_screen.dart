import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _currentPage = 0;
  List<String> selected = [];

  List<String> categoryList = [
    'Food & Drinks',
    'Media',
    '18+ Items ',
    'Mother/ Baby',
    'Beauty/ Extensions',
    'Fashion/Accessories ',
    'Creative/Geeks ',
    'Transport /Logistics ',
    'General Request ',
    'Financial services',
    'Entertainment ',
    'Virtual Product ',
    'Energy',
    'Automobile',
    'Household Supplies ',
    'Heavy Equipment ',
    'Security/Defence ',
    'Spiritual',
    'Repairs Services ',
    'Manufacturing',
    'Oil & Gas ',
    'Gov/Political ',
    'Legal Services',
    'Health Care',
    'Gadgets',
    'Home/Garden ',
    'Office Supplies ',
    'Construction',
    'Books',
    'Relationship ',
    'Art/Artifacts ',
    'Events/Party',
    'Handymen ',
    'Animal/ Pets ',
    'Real Estate',
    'Employment ',
    'Travel/ Tour',
    'Education ',
    'Sports'
  ];

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
                    'Category',
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
                      'People make request based on categories, so\n the more your categories, the higher your \nchances of receiving request notifications.',
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
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 35,
                            childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (selected.contains(categoryList[index])) {
                            selected.remove(categoryList[index]);
                          } else {
                            selected.add(categoryList[index]);
                          }
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected.contains(categoryList[index])
                                ? Colors.lightGreen
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Column(children: [
                                Expanded(
                                  child: Image(
                                    height: 60,
                                    width: 60,
                                    image: AssetImage(
                                      'assets/images/k$index.png',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  categoryList[index],
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (c) => Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(40.0),
                                          child: Image(
                                            height: 64,
                                            width: 64,
                                            image: AssetImage(
                                                'assets/images/icon.png'),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: Text(
                                            'Eureka!!! 👏',
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
                                          height: 16,
                                        ),
                                        Text(
                                          'Now you can enjoy the wonders of Cafia',
                                          style: GoogleFonts.rubik(
                                            textStyle: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 112,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColors.pink),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Let’s Begin',
                                                  style: GoogleFonts.rubik(
                                                    textStyle: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
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
                              'Continue',
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
