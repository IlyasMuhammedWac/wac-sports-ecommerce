// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wac_sports/config/styles/font_palette.dart';
// import 'package:wac_sports/core/extension/context.dart';
// import 'package:wac_sports/feature/category/view/widgets/text_button_with_icon_widget.dart';

// class FilterSortCompareBar extends StatefulWidget {
//   const FilterSortCompareBar({super.key});

//   @override
//   State<FilterSortCompareBar> createState() => _FilterSortCompareBarState();
// }

// class _FilterSortCompareBarState extends State<FilterSortCompareBar> {
//   // Filtering options
//   final List<String> _availableSizes = ['S', 'M', 'L', 'XL'];
//   final List<String> _selectedSizes = [];

//   // Price range filter
//   RangeValues _currentPriceRange = const RangeValues(0, 5000);

//   // Sort options
//   final List<String> _sortOptions = [
//     'Newest Arrivals',
//     'Price: Low to High',
//     'Price: High to Low',
//     'Ratings'
//   ];
//   String _currentSortOption = 'Newest Arrivals';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40.h,
//       width: double.maxFinite,
//       decoration:
//           BoxDecoration(color: Colors.white, border: Border.all(width: 0.2)),
//       child: Row(
//         children: [
//           TextButtonWithIconWidget(
//             iconData: Icons.sort,
//             title: "Sort",
//             onPressed: () {},
//           ),
//           const Spacer(),
//           _buildHorizontalDivider(),
//           const Spacer(),
//           TextButtonWithIconWidget(
//             iconData: Icons.filter_alt_outlined,
//             title: "Filter",
//             onPressed: () {
//               _showFilterBottomSheet();
//             },
//           ),
//           const Spacer(),
//           _buildHorizontalDivider(),
//           const Spacer(),
//           TextButtonWithIconWidget(
//             iconData: Icons.compare_arrows,
//             title: "Compare",
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }

//   Container _buildHorizontalDivider() {
//     return Container(
//       height: 30.h,
//       width: 0.5,
//       color: Colors.grey,
//     );
//   }

//   void _showFilterBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//       ),
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Container(
//               height: MediaQuery.of(context).size.height * 0.85,
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Filter Header
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Filter Products',
//                         style: FontPalette.blackMedium.copyWith(
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.close, size: 24.r),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                     ],
//                   ),

//                   // Size Filter
//                   SizedBox(height: 16.h),
//                   Text(
//                     'Size',
//                     style: FontPalette.blackMedium.copyWith(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: 8.h),
//                   Wrap(
//                     spacing: 8.w,
//                     runSpacing: 8.h,
//                     children: _availableSizes.map((size) {
//                       return ChoiceChip(
//                         label: Text(size),
//                         selected: _selectedSizes.contains(size),
//                         onSelected: (bool selected) {
//                           setState(() {
//                             if (selected) {
//                               _selectedSizes.add(size);
//                             } else {
//                               _selectedSizes.remove(size);
//                             }
//                           });
//                         },
//                         selectedColor: context.green.withOpacity(0.2),
//                         labelStyle: TextStyle(
//                           color: _selectedSizes.contains(size)
//                               ? context.green
//                               : context.textColor,
//                         ),
//                       );
//                     }).toList(),
//                   ),

//                   // Price Range Filter
//                   SizedBox(height: 16.h),
//                   Text(
//                     'Price Range',
//                     style: FontPalette.blackMedium.copyWith(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   RangeSlider(
//                     values: _currentPriceRange,
//                     min: 0,
//                     max: 5000,
//                     divisions: 100,
//                     activeColor: context.green,
//                     labels: RangeLabels(
//                         'INR ${_currentPriceRange.start.round()}',
//                         'INR ${_currentPriceRange.end.round()}'),
//                     onChanged: (RangeValues values) {
//                       setState(() {
//                         _currentPriceRange = values;
//                       });
//                     },
//                   ),

//                   // Sort Options
//                   SizedBox(height: 16.h),
//                   Text(
//                     'Sort By',
//                     style: FontPalette.blackMedium.copyWith(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: 8.h),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                     child: DropdownButton<String>(
//                       value: _currentSortOption,
//                       isExpanded: true,
//                       underline: const SizedBox(),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
//                       items: _sortOptions.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: FontPalette.blackMedium.copyWith(
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _currentSortOption = newValue!;
//                         });
//                       },
//                     ),
//                   ),

//                   // Apply Filters Button
//                   const Spacer(),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: context.green,
//                         padding: EdgeInsets.symmetric(vertical: 15.h),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                       ),
//                       onPressed: () {
//                         // Apply filters logic
//                         Navigator.pop(context);
//                         setState(() {});
//                       },
//                       child: Text(
//                         'Apply Filters',
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/extension/context.dart';
import 'package:wac_sports/feature/category/view/widgets/text_button_with_icon_widget.dart';

class FilterSortCompareBar extends StatefulWidget {
  final List<dynamic> products; // Assuming you have a list of products

  const FilterSortCompareBar({super.key, required this.products});

  @override
  State<FilterSortCompareBar> createState() => _FilterSortCompareBarState();
}

class _FilterSortCompareBarState extends State<FilterSortCompareBar> {
  // Filtering options
  final List<String> _availableSizes = ['S', 'M', 'L', 'XL'];
  final List<String> _selectedSizes = [];

  // Price range filter
  RangeValues _currentPriceRange = const RangeValues(0, 5000);

  // Sort options
  final List<String> _sortOptions = [
    'Newest Arrivals',
    'Price: Low to High',
    'Price: High to Low',
    'Ratings'
  ];
  String _currentSortOption = 'Newest Arrivals';

  // Compare functionality
  final List<dynamic> _comparedProducts = [];
  final int _maxCompareLimit = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.maxFinite,
      decoration:
          BoxDecoration(color: Colors.white, border: Border.all(width: 0.2)),
      child: Row(
        children: [
          TextButtonWithIconWidget(
            iconData: Icons.sort,
            title: "Sort",
            onPressed: () {
              _showSortBottomSheet();
            },
          ),
          const Spacer(),
          _buildHorizontalDivider(),
          const Spacer(),
          TextButtonWithIconWidget(
            iconData: Icons.filter_alt_outlined,
            title: "Filter",
            onPressed: () {
              _showFilterBottomSheet();
            },
          ),
          const Spacer(),
          _buildHorizontalDivider(),
          const Spacer(),
          TextButtonWithIconWidget(
            iconData: Icons.compare_arrows,
            title: "Compare",
            onPressed: () {
              _showCompareBottomSheet();
            },
          ),
        ],
      ),
    );
  }

  Container _buildHorizontalDivider() {
    return Container(
      height: 30.h,
      width: 0.5,
      color: Colors.grey,
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sort Products',
                style: FontPalette.blackMedium.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              ..._sortOptions
                  .map((option) => ListTile(
                        title: Text(option),
                        onTap: () {
                          setState(() {
                            _currentSortOption = option;
                            _sortProducts(option);
                          });
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ],
          ),
        );
      },
    );
  }

  void _sortProducts(String sortOption) {
    switch (sortOption) {
      case 'Newest Arrivals':
        // Assuming products have a 'createdAt' or similar field
        widget.products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'Price: Low to High':
        widget.products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        widget.products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Ratings':
        widget.products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
  }

  void _showCompareBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Compare Products',
                        style: FontPalette.blackMedium.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 24.r),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.products.length,
                      itemBuilder: (context, index) {
                        final product = widget.products[index];
                        return CheckboxListTile(
                          title: Text(product.name),
                          subtitle: Text('Price: \$${product.price}'),
                          value: _comparedProducts.contains(product),
                          onChanged: (bool? selected) {
                            setState(() {
                              if (selected == true) {
                                if (_comparedProducts.length <
                                    _maxCompareLimit) {
                                  _comparedProducts.add(product);
                                } else {
                                  // Show a snackbar or dialog about max compare limit
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Maximum $_maxCompareLimit products can be compared'),
                                    ),
                                  );
                                }
                              } else {
                                _comparedProducts.remove(product);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.green,
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: _comparedProducts.length >= 2
                          ? () {
                              // Navigate to comparison page or show comparison dialog
                              _showProductComparison();
                            }
                          : null,
                      child: Text(
                        'Compare (${_comparedProducts.length}/3)',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Filter Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter Products',
                        style: FontPalette.blackMedium.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 24.r),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  // Size Filter
                  SizedBox(height: 16.h),
                  Text(
                    'Size',
                    style: FontPalette.blackMedium.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: _availableSizes.map((size) {
                      return ChoiceChip(
                        label: Text(size),
                        selected: _selectedSizes.contains(size),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedSizes.add(size);
                            } else {
                              _selectedSizes.remove(size);
                            }
                          });
                        },
                        selectedColor: context.green.withOpacity(0.2),
                        labelStyle: TextStyle(
                          color: _selectedSizes.contains(size)
                              ? context.green
                              : context.textColor,
                        ),
                      );
                    }).toList(),
                  ),

                  // Price Range Filter
                  SizedBox(height: 16.h),
                  Text(
                    'Price Range',
                    style: FontPalette.blackMedium.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RangeSlider(
                    values: _currentPriceRange,
                    min: 0,
                    max: 5000,
                    divisions: 100,
                    activeColor: context.green,
                    labels: RangeLabels(
                        'INR ${_currentPriceRange.start.round()}',
                        'INR ${_currentPriceRange.end.round()}'),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentPriceRange = values;
                      });
                    },
                  ),

                  // Sort Options
                  SizedBox(height: 16.h),
                  Text(
                    'Sort By',
                    style: FontPalette.blackMedium.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: DropdownButton<String>(
                      value: _currentSortOption,
                      isExpanded: true,
                      underline: const SizedBox(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      items: _sortOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: FontPalette.blackMedium.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentSortOption = newValue!;
                        });
                      },
                    ),
                  ),

                  // Apply Filters Button
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.green,
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {
                        // Apply filters logic
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text(
                        'Apply Filters',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showProductComparison() {
    // Implementation for showing product comparison
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Product Comparison'),
          content: SingleChildScrollView(
            child: Column(
              children: _comparedProducts.map((product) {
                return ListTile(
                  title: Text(product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: \$${product.price}'),
                      Text('Size: ${product.size}'),
                      Text('Rating: ${product.rating}/5'),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
