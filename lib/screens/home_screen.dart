import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ro_shops/providers/mainprovider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // Breakpoints
  static const double _tablet = 600;
  static const double _desktop = 1200;

  double _hPad(double w) => w >= _desktop ? 80 : w >= _tablet ? 32 : 16;
  int _gridCols(double w) => w >= _desktop ? 4 : w >= _tablet ? 3 : 2;
  double _titleSize(double w) => w >= _desktop ? 30 : w >= _tablet ? 26 : 22;
  double _subtitleSize(double w) => w >= _desktop ? 20 : w >= _tablet ? 18 : 15;
  double _bannerTitleSize(double w) => w >= _desktop ? 22 : 16;
  double _bannerBodySize(double w) => w >= _desktop ? 15 : 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= _desktop;
    final hPad = _hPad(width);
    final username = ref.watch(usernameProvider);
    final email = ref.watch(emailProvider);
    final id = ref.watch(idProvider);

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 76, 35, 226),
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(20),
              bottomEnd: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  "Hello, $username",
                  style: TextStyle(
                    fontSize: _titleSize(width),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Enjoy your services",
                  style: TextStyle(fontSize: _subtitleSize(width), color: Colors.white),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Scrollable body
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 76, 35, 226),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: isDesktop ? 2 : 1,
                          child: Padding(
                            padding: EdgeInsets.all(isDesktop ? 24 : 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: isDesktop
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Free Consultation",
                                  style: TextStyle(
                                    fontSize: _bannerTitleSize(width),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Get free support from our customer services",
                                  textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                                  style: TextStyle(
                                    fontSize: _bannerBodySize(width),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: isDesktop ? 24 : 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: isDesktop
                                        ? const EdgeInsets.symmetric(horizontal: 32, vertical: 14)
                                        : null,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Contact Us",
                                    style: TextStyle(fontSize: isDesktop ? 15 : 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/images/homeimg1.png',
                            fit: BoxFit.contain,
                            height: isDesktop ? 200 : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Section header
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: hPad),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Featured Product",
                        style: TextStyle(
                          fontSize: isDesktop ? 22 : 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "See All",
                        style: TextStyle(fontSize: 14, color: Color(0xFF585858)),
                      ),
                    ],
                  ),
                ),

                // Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(horizontal: hPad),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _gridCols(width),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: isDesktop ? 1.2 : 1.0,
                  ),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 76, 35, 226),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Item $index",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isDesktop ? 16 : 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: isDesktop
            ? Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1400),
                  child: content,
                ),
              )
            : content,
      ),
    );
  }
}
