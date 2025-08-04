import 'package:day_1/ui/screens/description_page.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class PopularCardList extends StatelessWidget {
  const PopularCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, 
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(width: 16),
          PopularCard(
            imagePath: 'assets/images/tasty-breakfast-meal-composition.jpg',
            title: 'Tasty Breakfast with Eggs, Beef, Bacon and Cheese',
            subtitle: 'Cheesy treat',
            price: '\$15',
            rating: 4,
          ),
          SizedBox(width: 16),
          PopularCard(
            imagePath: 'assets/images/close-up-refreshing-alcoholic-drink-with-grapefruit.jpg',
            title: 'Iced Grapefruit Drink with Mint and Lime',
            subtitle: 'Juicy & big',
            price: '\$12',
            rating: 3,
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

class PopularCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final int rating;

  const PopularCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width * 0.45;

    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionPage(imageUrl: imagePath, price: double.parse(price.replaceAll('\$', '')),title: title, subtitle: subtitle,),
          ),
        );
      },
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
      
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
      
                    const SizedBox(height: 4),
      
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withAlpha(150),
                        fontSize: 12,
                      ),
                    ),
      
                    const SizedBox(height: 12),
      
                    /// Stars and Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Stars
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              size: 16,
                              color: index < rating ? Colors.amber[700] : Colors.grey[600],
                            );
                          }),
                        ),
      
                        /// Price Tag
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: const BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            price,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
