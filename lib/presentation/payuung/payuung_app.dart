import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/home/home_page.dart';
import 'package:payuung_clone/presentation/payuung/nav_item.dart';

class PayuungApp extends StatefulWidget {
  const PayuungApp({super.key});

  @override
  State<PayuungApp> createState() => _PayuungAppState();
}

class _PayuungAppState extends State<PayuungApp> {
  int _selectedIndex = 0;
  bool _isExpanded = false;
  double _initialChildSize = 0.15;
  final double _minChildSize = 0.15;
  final double _maxChildSize = 0.5;

  final List<Widget> _screens = [
    const HomePage(),
    Container(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggleDraggableScrollableSheet() {
    setState(() {
      _initialChildSize = _isExpanded ? _minChildSize : _maxChildSize;
      _isExpanded = !_isExpanded;
    });
    DraggableScrollableActuator.reset(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                setState(() {
                  _isExpanded = notification.extent == notification.maxExtent;
                });
                return true;
              },
              child: DraggableScrollableActuator(
                key: Key(_initialChildSize.toString()),
                child: DraggableScrollableSheet(
                  initialChildSize: _initialChildSize,
                  minChildSize: _minChildSize,
                  maxChildSize: _maxChildSize,
                  snap: true,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    scrollController.addListener(() {});
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 14),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              border: Border(
                                top: BorderSide(color: Colors.grey.shade200),
                              ),
                            ),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              physics: const ClampingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Column(
                                  children: [
                                    if (!_isExpanded)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          NavItem(
                                            icon: Icons.home,
                                            label: "Beranda",
                                            index: 0,
                                            isSelected: _selectedIndex == 0,
                                            onTap: _onNavItemTapped,
                                          ),
                                          NavItem(
                                            icon: Icons.search,
                                            label: "Cari",
                                            index: 1,
                                            isSelected: _selectedIndex == 1,
                                            onTap: _onNavItemTapped,
                                          ),
                                          NavItem(
                                            icon: Icons.shopping_cart,
                                            label: "Keranjang",
                                            index: 2,
                                            isSelected: _selectedIndex == 2,
                                            onTap: _onNavItemTapped,
                                          ),
                                        ],
                                      )
                                    else
                                      GridView.count(
                                        crossAxisCount: 3,
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(10),
                                        children: [
                                          NavItem(
                                            icon: Icons.home,
                                            label: "Beranda",
                                            index: 0,
                                            isSelected: _selectedIndex == 0,
                                            onTap: _onNavItemTapped,
                                          ),
                                          NavItem(
                                            icon: Icons.search,
                                            label: "Cari",
                                            index: 1,
                                            isSelected: _selectedIndex == 1,
                                            onTap: _onNavItemTapped,
                                          ),
                                          NavItem(
                                            icon: Icons.shopping_cart,
                                            label: "Keranjang",
                                            index: 2,
                                            isSelected: _selectedIndex == 2,
                                            onTap: _onNavItemTapped,
                                          ),
                                          NavItem(
                                            icon: Icons.list_outlined,
                                            label: "Daftar Transaksi",
                                            index: 2,
                                            isSelected: _selectedIndex == 3,
                                            onTap: _onNavItemTapped,
                                          ),
                                          NavItem(
                                            icon: Icons.discount_outlined,
                                            label: "Voucher Saya",
                                            index: 2,
                                            isSelected: _selectedIndex == 4,
                                            onTap: _onNavItemTapped,
                                          ),
                                          NavItem(
                                            icon: Icons.pin_drop_outlined,
                                            label: "Alamat Pengiriman",
                                            index: 2,
                                            isSelected: _selectedIndex == 5,
                                            onTap: _onNavItemTapped,
                                          ),
                                          NavItem(
                                            icon: Icons.people_outline,
                                            label: "Daftar Teman",
                                            index: 2,
                                            isSelected: _selectedIndex == 6,
                                            onTap: _onNavItemTapped,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleDraggableScrollableSheet,
                          child: Container(
                            alignment: Alignment.topCenter,
                            height: 45,
                            width: 48,
                            padding: const EdgeInsets.only(bottom: 40),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.grey.shade200),
                                bottom: BorderSide.none,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              _isExpanded
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
