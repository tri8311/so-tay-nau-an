import 'package:flutter/material.dart';
import 'package:sotaynauan/models/dish_model.dart';

class DishCard extends StatelessWidget {
  final Dish dish;
  final VoidCallback onTap;
  final bool isFavorite;
  final ValueChanged<bool> onToggleFavorite;

  const DishCard({
    super.key,
    required this.dish,
    required this.onTap,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate image height as approximately 2/3 of available space
            final imageHeight = constraints.maxHeight * 0.6;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image section - takes about 2/3 of the card height
                SizedBox(
                  height: imageHeight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      dish.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Content section - takes remaining space
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                dish.name,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                              ),
                              onPressed: () {
                                onToggleFavorite(!isFavorite);
                              },
                              tooltip: isFavorite
                                  ? 'Remove from favorites'
                                  : 'Add to favorites',
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${dish.prepTimeMinutes}min prep • ${dish.cookTimeMinutes}min cook',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: dish.tags
                              .take(3)
                              .map(
                                (tag) => Chip(
                                  label: Text(
                                    tag,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                  backgroundColor: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.grey[700]
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                  labelPadding:
                                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}