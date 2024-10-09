import 'dart:math';

import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/app_bottom_sheet.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/packages/controller/cubit/packages_cubit.dart';
import 'package:bulka/modules/packages/controller/cubit/packages_state.dart';
import 'package:bulka/modules/packages/data/entity/subscribe_entity.dart';
import 'package:bulka/modules/packages/data/params/pay_subscribtion_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
    required this.subscribe,
  });

  final SubscribeEntity subscribe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select payment method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.opactiyPrimary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: RadioListTile(
                    value: 'cash',
                    groupValue: 'card',
                    onChanged: (value) {
                      AppBottomSheet.open(
                        context: context,
                        child: PaymentDetailsForm(
                          subscribe: subscribe,
                        ),
                        backgroundColor: AppColors.white,
                      );
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          color: AppColors.black,
                        ),
                        Text(
                          'Debit / Credit card',
                          style: TextStyles.rubik14W500Black,
                        ),
                      ],
                    ),
                    subtitle: const Text('pay by debit / credit card'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentDetailsForm extends StatefulWidget {
  const PaymentDetailsForm({
    super.key,
    required this.subscribe,
  });
  final SubscribeEntity subscribe;
  @override
  State<PaymentDetailsForm> createState() => _PaymentDetailsFormState();
}

class _PaymentDetailsFormState extends State<PaymentDetailsForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PackagesCubit(sl()),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const DefaultFormField(
              keyboardType: TextInputType.number,
              hintText: 'Card Number',
              labelText: 'Card Number',
              suffixIcon: Icon(Icons.credit_card),
            ),
            const SizedBox(height: 16),
            const DefaultFormField(
              labelText: 'Name on the card',
              hintText: 'Name on the card',
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: DefaultFormField(
                    keyboardType: TextInputType.number,
                    labelText: 'Date of expiration',
                    hintText: 'MM/YY',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DefaultFormField(
                    keyboardType: TextInputType.number,
                    labelText: 'CVV',
                    hintText: 'CVV',
                    suffixIcon: Icon(Icons.info_outline),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: BlocConsumer<PackagesCubit, PackagesState>(
                listenWhen: (previous, current) =>
                    current is PaySubscribtionLoading ||
                    current is PaySubscribtionSuccess ||
                    current is PaySubscribtionError,
                listener: (context, state) {
                  if (state is PaySubscribtionSuccess) {
                    Dialogs.successDialog(
                      context,
                      onSuccessFinishedCallback: (p0) {
                        context.pop();
                        context.pop();
                        context.pop();
                      },
                    );
                  }
                  if (state is PaySubscribtionError) {
                    Dialogs.errorDialog(context: context, error: state.error);
                  }
                },
                buildWhen: (previous, current) =>
                    current is PaySubscribtionLoading ||
                    current is PaySubscribtionSuccess ||
                    current is PaySubscribtionError,
                builder: (context, state) {
                  final cubit = context.read<PackagesCubit>();
                  return DefaultButton(
                    isLoading: state is PaySubscribtionLoading ? true : false,
                    onPressed: () {
                      cubit.paySubscribtionStatesHandled(
                        PaySubscribtionParams(
                          subscribtionId: widget.subscribe.subscribeId,
                          transctionId: Random().nextInt(1000).toString(),
                        ),
                      );
                    },
                    child: const Text('Pay'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
