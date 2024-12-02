import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/color_palette.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({
    super.key,
  });

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;
  changeState() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeState();
      },
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        elevation: 2,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: Center(
            child: Icon(
              Icons.favorite_sharp,
              color: isFavorite
                  ? ColorPalette.errorColor
                  : ColorPalette.textColorGrey,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
