import 'package:flutter/material.dart';
import '../models/place_model.dart';
import '../theme/app_theme.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 0;
  int _selectedNav = 0;

  @override
  Widget build(BuildContext context) {
    // ===== MEDIAQUERY: ukuran responsif =====
    final screenWidth  = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final hPad = screenWidth * 0.055;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(hPad),
            Expanded(
              // ===== EXPANDED: isi sisa ruang layar =====
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    _buildSearchBar(hPad),
                    SizedBox(height: screenHeight * 0.025),
                    _buildCategoryTabs(hPad),
                    SizedBox(height: screenHeight * 0.025),
                    _buildSectionHeader('Popular', hPad),
                    SizedBox(height: 12),
                    _buildPopularList(screenHeight),
                    SizedBox(height: screenHeight * 0.025),
                    _buildSectionHeader('Recommended', hPad),
                    SizedBox(height: 12),
                    _buildRecommendedGrid(hPad, screenWidth),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ===== HEADER: Row kiri-kanan =====
  Widget _buildHeader(double hPad) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Explore',
                  style: TextStyle(fontSize: 13, color: AppColors.grey)),
              SizedBox(height: 2),
              Text('Aspen',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppColors.dark)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyLight, width: 1.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.location_on, color: AppColors.primary, size: 14),
                SizedBox(width: 4),
                Text('Aspen, USA',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===== SEARCH BAR: Row + Expanded =====
  Widget _buildSearchBar(double hPad) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.search, color: AppColors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Find things to do',
                  hintStyle: TextStyle(color: AppColors.grey, fontSize: 14),
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== CATEGORY TABS: ListView horizontal =====
  Widget _buildCategoryTabs(double hPad) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: hPad),
        physics: const BouncingScrollPhysics(),
        itemCount: AppData.categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedCategory == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = index),
            child: Container(
              margin: const EdgeInsets.only(right: 28),
              child: Column(
                children: [
                  Text(
                    AppData.categories[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 2.5,
                    width: isSelected ? 30 : 0,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ===== SECTION HEADER: Row + Spacer =====
  Widget _buildSectionHeader(String title, double hPad) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.dark)),
          TextButton(
            onPressed: () {},
            child: const Text('See all',
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  // ===== POPULAR LIST: ListView horizontal + Stack =====
  Widget _buildPopularList(double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        physics: const BouncingScrollPhysics(),
        itemCount: AppData.popularPlaces.length,
        itemBuilder: (context, index) {
          final place = AppData.popularPlaces[index];
          return GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => DetailPage(place: place))),
            child: Container(
              width: screenHeight * 0.21,
              margin: const EdgeInsets.only(right: 16),
              child: Stack(
                // ===== STACK: gambar + badge + favorite =====
                children: [
                  // Gambar background
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(place.imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover),
                  ),
                  // Gradient overlay
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6)
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Nama tempat
                  Positioned(
                    bottom: 40, left: 12, right: 12,
                    child: Text(place.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                  // Rating badge
                  Positioned(
                    bottom: 12, left: 12,
                    child: Row(children: [
                      const Icon(Icons.star,
                          color: AppColors.star, size: 14),
                      const SizedBox(width: 3),
                      Text(place.rating.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
                    ]),
                  ),
                  // Favorite button
                  Positioned(
                    bottom: 8, right: 8,
                    child: Container(
                      width: 30, height: 30,
                      decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle),
                      child: const Icon(Icons.favorite,
                          color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ===== RECOMMENDED: GridView 2 kolom =====
  Widget _buildRecommendedGrid(double hPad, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: screenWidth > 400 ? 1.0 : 0.95,
        ),
        itemCount: AppData.recommendedPlaces.length,
        itemBuilder: (context, index) {
          final place = AppData.recommendedPlaces[index];
          return GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => DetailPage(place: place))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(children: [
                Positioned.fill(
                  child: Image.asset(place.imageUrl,
                      fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 0, left: 0, right: 0, height: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7)
                        ],
                      ),
                    ),
                  ),
                ),
                if (place.duration != null)
                  Positioned(
                    bottom: 36, right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(place.duration!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                Positioned(
                  bottom: 10, left: 10, right: 10,
                  child: Text(place.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  // ===== BOTTOM NAV: Row merata =====
  Widget _buildBottomNav() {
    final icons = [
      Icons.home_rounded,
      Icons.crop_square_rounded,
      Icons.favorite_border,
      Icons.person_outline,
    ];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, -4))
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              final isSelected = _selectedNav == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedNav = index),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryLight
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icons[index],
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.grey,
                      size: 24),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}