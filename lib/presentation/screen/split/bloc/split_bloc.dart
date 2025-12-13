import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/data/models/summary_model.dart';

part 'split_event.dart';
part 'split_state.dart';

class SplitBloc extends Bloc<SplitEvent, SplitState> {
  SplitBloc() : super(SplitState()) {
    on<OnAddPersonEvent>(_onAddPersonEvent);
    on<OnAddFoodEvent>(_onAddFoodEvent);
    on<OnChangedIncludeSstEvent>(_onChangedIncludeSstEvent);
    on<OnChangedHaveServiceChargeEvent>(_onChangedHaveServiceChargeEvent);
    on<OnPressedSummaryEvent>(_onPressedSummaryEvent);

    on<OnDeletePersonEvent>(_onDeletePersonEvent);
    on<OnDeleteFoodEvent>(_onDeleteFoodEvent);
  }

  void _onAddPersonEvent(OnAddPersonEvent event, Emitter<SplitState> emit) {
    final PersonModel person = PersonModel(
      id: state.persons.length + 1,
      name:
          event.name.isNotEmpty
              ? event.name
              : (state.persons.length + 1).toString(),
      foods: [],
    );

    emit(state.copyWith(persons: [...state.persons, person]));
  }

  void _onAddFoodEvent(OnAddFoodEvent event, Emitter<SplitState> emit) {
    final updatedPersons =
        state.persons.map((person) {
          if (person.id == event.personId) {
            final updatedFoods = [
              ...person.foods,
              PersonFood(
                id: person.foods.length + 1,
                name: event.name,
                quantity: event.quantity,
                price: event.cost,
              ),
            ];
            return PersonModel(
              id: person.id,
              name: person.name,
              foods: updatedFoods,
            );
          }
          return person;
        }).toList();

    emit(state.copyWith(persons: updatedPersons));
  }

  void _onChangedIncludeSstEvent(
    OnChangedIncludeSstEvent event,
    Emitter<SplitState> emit,
  ) {
    emit(state.copyWith(isIncludeSst: !state.isIncludeSst));
  }

  void _onChangedHaveServiceChargeEvent(
    OnChangedHaveServiceChargeEvent event,
    Emitter<SplitState> emit,
  ) {
    emit(state.copyWith(isHaveServiceCharge: !state.isHaveServiceCharge));
  }

  void _onPressedSummaryEvent(
    OnPressedSummaryEvent event,
    Emitter<SplitState> emit,
  ) {
    emit(state.copyWith(splitStatus: SplitStatus.loading));

    final bool includeSst = state.isIncludeSst;
    final bool haveService = state.isHaveServiceCharge;

    final double totalServiceChargeInput = event.serviceCharge;

    final int totalPersons = state.persons.length;
    final double serviceChargePerPerson =
        haveService ? totalServiceChargeInput / totalPersons : 0;

    final double totalServiceChargeCalculate =
        serviceChargePerPerson * totalPersons;

    final List<SummaryPerson> summaryList = [];
    double totalBillInput = event.totalBill;
    double totalSst = 0;
    double totalBillCalculate = 0;
    double totalSubtotal = 0;

    for (var p in state.persons) {
      List<SummaryFood> foods = [];
      double personSubtotal = 0;
      double personSstTotal = 0;
      double personNeedToPay = 0;

      for (var f in p.foods) {
        double sst = includeSst ? (f.price * 0.06) : 0;
        double priceWithSst = f.price + sst;
        double totalFoodPrice = priceWithSst * f.quantity;

        personSubtotal += totalFoodPrice;
        personSstTotal += sst * f.quantity;

        foods.add(
          SummaryFood(
            id: f.id,
            name: f.name,
            quantity: f.quantity,
            basePrice: f.price,
            sst: sst,
            priceWithSst: priceWithSst,
          ),
        );
      }

      personNeedToPay += personSubtotal;

      if (haveService) {
        personNeedToPay += serviceChargePerPerson;
      }

      totalSst += personSstTotal;
      totalBillCalculate += personNeedToPay;
      totalSubtotal += personSubtotal;

      summaryList.add(
        SummaryPerson(
          id: p.id,
          name: p.name,
          needToPay: personNeedToPay,
          foods: foods,
          serviceCharge: serviceChargePerPerson,
          sst: personSstTotal,
          subtotal: personSubtotal,
        ),
      );
    }

    final double totalBillDifference = totalBillInput - totalBillCalculate;
    final double serviceChargeDifference =
        totalServiceChargeInput - totalServiceChargeCalculate;

    debugPrint("total bill input: $totalBillInput");
    debugPrint("total bill calculate: $totalBillCalculate");
    debugPrint("total bill difference: $totalBillDifference");
    debugPrint("total service charge input: $totalServiceChargeInput");
    debugPrint("total service charge calculate: $totalServiceChargeCalculate");
    debugPrint("total service charge difference: $serviceChargeDifference");

    final SummaryModel summaryModel = SummaryModel(
      persons: totalPersons,
      totalBillInput: totalBillInput,
      totalServiceChargeInput: totalServiceChargeInput,
      summaryPerson: summaryList,
      totalSst: totalSst,
      isIncludeSst: includeSst,
      isHaveServiceCharge: haveService,
      totalServiceChargeCalculate: totalServiceChargeCalculate,
      totalBillCalculate: totalBillCalculate,
      totalBillDifference: totalBillDifference,
      totalServiceChargeDifference: serviceChargeDifference,
      totalSubtotal: totalSubtotal,
    );

    emit(
      state.copyWith(
        splitStatus: SplitStatus.success,
        summaryModel: summaryModel,
      ),
    );
  }

  void _onDeletePersonEvent(
    OnDeletePersonEvent event,
    Emitter<SplitState> emit,
  ) {
    final updated = state.persons.where((p) => p.id != event.personId).toList();
    emit(state.copyWith(persons: updated));
  }

  void _onDeleteFoodEvent(OnDeleteFoodEvent event, Emitter<SplitState> emit) {
    final updated =
        state.persons.map((p) {
          if (p.id == event.personId) {
            final updatedFoods =
                p.foods.where((f) => f.id != event.foodId).toList();
            return PersonModel(id: p.id, name: p.name, foods: updatedFoods);
          }
          return p;
        }).toList();
    emit(state.copyWith(persons: updated));
  }
}
