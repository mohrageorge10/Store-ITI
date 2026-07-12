import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/features/account/cubit/location_cubit.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LocationFailure) {
          return Center(child: Text(state.message));
        }
        if (state is LocationSuccess) {
          return Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.addresses.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final address = state.addresses[index];

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.grey,
                        size: 28,
                      ),
                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    address.name,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                if (index == 0) ...[
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text(
                                      "Default",
                                      style: AppTextStyles.kText10Black,
                                    ),
                                  ),
                                ],
                              ],
                            ),

                            const SizedBox(height: 6),

                            Text(
                              address.description,

                              style: AppTextStyles.kText16Gray,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
