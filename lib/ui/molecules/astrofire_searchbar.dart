import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class AstroFireSearchBar extends StatelessWidget {
  AstroFireSearchBar({
    super.key,
  });

  final List<String> ciudades = [
    "Manaus, Brasil",
    "Yakarta, Indonesia",
    "Cali, Colombia",
    "São Paulo, Brasil",
    "Santiago de Chile",
    "Los Ángeles, Estados Unidos",
    "San Francisco, Estados Unidos",
    "Madrid, España",
    "Roma, Italia",
  ];

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 300),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: 0.0,
      openAxisAlignment: 0.0,
      width: 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Container(
              height: 500,
              child: ListView.builder(
                itemCount: ciudades.length,
                itemBuilder: (context, index) {
                  return Text(
                    ciudades[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
