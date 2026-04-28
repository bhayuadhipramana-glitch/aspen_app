import 'package:flutter/material.dart';
import '../models/place_model.dart';
import '../theme/app_theme.dart';

class DetailPage extends StatefulWidget {
  final PlaceModel place;
  const DetailPage({super.key, required this.place});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorite = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.place.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    // ===== MEDIAQUERY: responsif =====
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight  = screenHeight * 0.42;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        // ===== STACK UTAMA: gambar + konten berlapis =====
        children: [

          // Layer 1: Gambar fullscreen
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Image.asset(
              widget.place.imageUrl,
              fit: BoxFit.cover,
            ),
          ),

          // Layer 2: Back button (Positioned kiri atas)
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new,
                    size: 16, color: AppColors.dark),
              ),
            ),
          ),

          // Layer 3: Content card di bawah (Positioned)
          Positioned(
            top: imageHeight - 24,
            left: 0, right: 0, bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(28)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Nama + Favorite (Row)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          // ===== EXPANDED: nama isi sisa ruang =====
                          child: Text(
                            widget.place.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.dark,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _isFavorite = !_isFavorite),
                          child: Container(
                            width: 40, height: 40,
                            decoration: BoxDecoration(
                              color: _isFavorite
                                  ? AppColors.accent
                                  : AppColors.greyLight,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: _isFavorite
                                  ? Colors.white
                                  : AppColors.grey,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Rating + reviews
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: AppColors.star, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.place.rating} (355 Reviews)',
                          style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Deskripsi
                    Text(
                      widget.place.description,
                      maxLines: _isExpanded ? 100 : 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.grey,
                          height: 1.6),
                    ),
                    GestureDetector(
                      onTap: () =>
                          setState(() => _isExpanded = !_isExpanded),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            Text(
                              _isExpanded ? 'Show less' : 'Read more',
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              _isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: AppColors.primary, size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Facilities
                    const Text('Facilities',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.dark)),
                    const SizedBox(height: 12),

                    // Facility icons (Row)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _facilityItem(Icons.wifi_outlined, '1 Heater'),
                        _facilityItem(Icons.restaurant_outlined, 'Dinner'),
                        _facilityItem(Icons.bathtub_outlined, '1 Tub'),
                        _facilityItem(Icons.pool_outlined, 'Pool'),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Price + Book Now (Row + Expanded)
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Price',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.grey)),
                              Text(
                                '\$${widget.place.price.toInt()}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1DB954),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Book Now',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700)),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Layer 4: Show map button (Positioned kanan atas card)
          Positioned(
            top: imageHeight - 14,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text('Show map',
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _facilityItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 52, height: 52,
          decoration: BoxDecoration(
            color: AppColors.greyLight,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: AppColors.grey, size: 24),
        ),
        const SizedBox(height: 6),
        Text(label,
            style: const TextStyle(
                fontSize: 11, color: AppColors.grey)),
      ],
    );
  }
}