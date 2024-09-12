import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaui_cs/common/components/bottom_bar.dart';
import 'package:kaui_cs/common/components/custom_filled_button.dart';
import 'package:kaui_cs/common/router/app_routes.dart';
import 'package:kaui_cs/gen/assets.gen.dart';
import 'package:sizer/sizer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Image.asset(
                        Assets.icons.coffee.path,
                        height: 200,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Taste Paradise. \n One Cup at a time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Coffee anytime',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown),
                ),
                onPressed: () => context.pushNamed(AppRoutes.products),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text('Explore More'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
