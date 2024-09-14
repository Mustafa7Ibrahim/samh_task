import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:samh_task/core/extensions/local_extension.dart';
import 'package:samh_task/core/resource/resource.dart';
import 'package:samh_task/core/router/routes/app_router.dart';
import 'package:samh_task/modules/book/domain/countries_fake.dart';
import 'package:samh_task/modules/book/domain/trip_class.dart';
import 'package:samh_task/modules/book/domain/trip_travelers.dart';

class BookForm extends HookWidget {
  const BookForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useRef(GlobalKey<FormBuilderState>());
    final size = MediaQuery.of(context).size;
    final tripClass = useState(TripClass.economy);
    final tripTravelers = useState(TripTravelers.adult);
    final tripDateFrom = useState(DateTime.now());
    final tripDateTo = useState(DateTime.now().add(Duration(days: 7)));
    final from = useState(Countries.egypt);
    final to = useState(Countries.china);

    useEffect(() {
      formKey.value.currentState?.save();
      return null;
    }, [
      formKey.value.currentState,
      tripClass.value,
      tripTravelers.value,
      tripDateFrom.value,
      tripDateTo.value,
      from.value,
      to.value,
    ]);

    return Positioned(
      top: size.height * 0.32,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.all(34),
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: FormBuilder(
          key: formKey.value,
          child: SingleChildScrollView(
            key: UniqueKey(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          FormBuilderDropdown<Countries>(
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                            valueTransformer: (value) => value.toString(),
                            items: [
                              for (var country in Countries.values)
                                DropdownMenuItem(
                                  value: country,
                                  child: Text(country.name(context)),
                                ),
                            ],
                            initialValue: from.value,
                            name: 'from',
                            decoration: InputDecoration(
                              labelText: context.tr.from,
                              prefixIconConstraints: BoxConstraints(
                                minWidth: 34,
                                minHeight: 8,
                              ),
                              prefixIcon: SvgPicture.asset(R.ASSETS_DOT_SVG),
                            ),
                            onChanged: (value) {
                              if (value != null) {
                                from.value = value;
                              }
                            },
                            validator: FormBuilderValidators.required(),
                          ),
                          SizedBox(height: 28),
                          FormBuilderDropdown<Countries>(
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                            items: [
                              for (var country in Countries.values)
                                DropdownMenuItem(
                                  value: country,
                                  child: Text(country.name(context)),
                                ),
                            ],
                            initialValue: to.value,
                            name: 'to',
                            decoration: InputDecoration(
                              labelText: context.tr.to,
                              prefixIconConstraints: BoxConstraints(
                                minWidth: 34,
                                minHeight: 12,
                              ),
                              prefixIcon: SvgPicture.asset(R.ASSETS_FLY_SVG),
                            ),
                            onChanged: (value) {
                              if (value != null) {
                                to.value = value;
                              }
                            },
                            validator: FormBuilderValidators.required(),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {
                          final fromSwap = from.value;
                          final toSwap = to.value;
                          from.value = toSwap;
                          to.value = fromSwap;
                          // Force the form fields to update their values
                          formKey.value.currentState?.patchValue({
                            'from': from.value,
                            'to': to.value,
                          });
                        },
                        child: Icon(Icons.swap_vert),
                      ),
                      PositionedDirectional(
                        top: 34,
                        start: 17,
                        bottom: 34,
                        child: DottedLine(
                          direction: Axis.vertical,
                          dashColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  FormBuilderField<DateTimeRange>(
                    name: 'date',
                    initialValue: DateTimeRange(
                      start: tripDateFrom.value,
                      end: tripDateTo.value,
                    ),
                    builder: (FormFieldState<DateTimeRange> field) {
                      return TextFormField(
                        readOnly: true,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelText: context.tr.date,
                        ),
                        onTap: () async {
                          // Open the date range picker
                          final picked = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            locale: Locale(context.tr.localeName),
                            initialDateRange: field.value,
                          );

                          if (picked != null) {
                            field.didChange(picked);
                            tripDateFrom.value = picked.start;
                            tripDateTo.value = picked.end;
                          }
                        },
                        controller: TextEditingController(
                          text: field.value != null
                              ? '${DateFormat("d, MMM yyyy", context.tr.localeName).format(field.value!.start)} - '
                                  '${DateFormat("d, MMM yyyy", context.tr.localeName).format(field.value!.end)}'
                              : '',
                        ),
                        validator: FormBuilderValidators.required(),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderDropdown<TripTravelers>(
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                          items: [
                            for (var tripTravelers in TripTravelers.values)
                              DropdownMenuItem(
                                value: tripTravelers,
                                child: Text(tripTravelers.title(context)),
                              ),
                          ],
                          name: 'travelers',
                          initialValue: tripTravelers.value,
                          decoration: InputDecoration(
                            labelText: context.tr.travelers,
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              tripTravelers.value = value;
                            }
                          },
                          validator: FormBuilderValidators.required(),
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: FormBuilderDropdown<TripClass>(
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                          items: [
                            for (var tripClass in TripClass.values)
                              DropdownMenuItem(
                                value: tripClass,
                                child: Text(tripClass.title(context)),
                              ),
                          ],
                          name: 'class',
                          initialValue: tripClass.value,
                          decoration: InputDecoration(
                            labelText: context.tr.class_tr,
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              tripClass.value = value;
                            }
                          },
                          validator: FormBuilderValidators.required(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.value.currentState?.validate() ?? false) {
                        formKey.value.currentState?.save();
                        if (from.value == to.value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content:
                                  Text(context.tr.fromAndToShouldBeDifferent),
                            ),
                          );
                          return;
                        }
                        SearchFlightRoute(
                          from: from.value.shortName,
                          to: to.value.shortName,
                        ).go(context);
                        print(formKey.value.currentState?.value);
                      }
                    },
                    child: Text(context.tr.searchFlights),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
