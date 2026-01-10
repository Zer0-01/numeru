import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/presentation/common_widgets/app_app_bar_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/bill_setting_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/person_list_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/person_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/receipt_settings_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/summary_button_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/who_is_paying_widget.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});

  @override
  State<SplitScreen> createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  final TextEditingController _nameController = TextEditingController();
  final Map<int, TextEditingController> _foodControllers = {};
  final Map<int, TextEditingController> _quantityControllers = {};
  final Map<int, TextEditingController> _priceControllers = {};
  final TextEditingController _serviceChargeController =
      TextEditingController();
  final TextEditingController _totalBillController = TextEditingController();
  final TextEditingController _roundingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onChanged);
    _totalBillController.addListener(_onChanged);
    _serviceChargeController.addListener(_onChanged);
    _roundingController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    for (var c in _foodControllers.values) {
      c.dispose();
    }
    for (var c in _quantityControllers.values) {
      c.dispose();
    }
    for (var c in _priceControllers.values) {
      c.dispose();
    }
    _serviceChargeController.dispose();
    _totalBillController.dispose();
    _roundingController.dispose();
    super.dispose();
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget.back(
        onPressedBack: () => context.router.maybePop(),
        title: "Split",
      ),

      body: CustomScrollView(
        slivers: [
          const WhoIsPayingWidget(),
          const ReceiptSettingsWidget(),
          PersonWidget(nameController: _nameController),
          PersonListWidget(
            foodControllers: _foodControllers,
            quantityControllers: _quantityControllers,
            priceControllers: _priceControllers,
          ),
          BillSettingWidget(
            serviceChargeController: _serviceChargeController,
            totalBillController: _totalBillController,
            roundingController: _roundingController,
          ),
          SummaryButtonWidget(
            serviceChargeController: _serviceChargeController,
            totalBillController: _totalBillController,
            roundingController: _roundingController,
          ),
        ],
      ),
    );
  }
}
