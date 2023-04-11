import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../provider/dark_theme_provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.catText,
      required this.imgPath,
      required this.passedColor});
  final String catText, imgPath;
  final Color passedColor;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: passedColor.withOpacity(
            0.1,
          ),
          borderRadius: BorderRadius.circular(
            16,
          ),
          border: Border.all(
            color: passedColor.withOpacity(
              0.7,
            ),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: screenWidth * 0.3,
              width: screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // Category name
            TextWidget(
              textTitle: catText,
              textColor: color,
              textSize: 20,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
