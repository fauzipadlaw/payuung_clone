import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/personal_info/components/address_form.dart';
import 'package:payuung_clone/presentation/personal_info/components/bio_form.dart';
import 'package:payuung_clone/presentation/personal_info/components/company_form.dart';
import 'package:payuung_clone/presentation/personal_info/components/personal_info_appbar.dart';
import 'package:payuung_clone/utils/colors.dart';

import 'components/circle_step.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  int _step = 1;
  final _bioFormkey = GlobalKey<FormState>();
  final _addressFormkey = GlobalKey<FormState>();
  final _companyFormkey = GlobalKey<FormState>();

  void _nextStep() {
    if (_step != 3) {
      setState(() {
        _step++;
      });
    }
  }

  void _previousStep() {
    if (_step != 1) {
      setState(() {
        _step--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: PersonalInfoAppbar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleStep(
                      isActive: _step >= 1,
                      step: '1',
                      label: 'Biodata Diri',
                    ),
                    CircleStep(
                      isActive: _step >= 2,
                      step: '2',
                      label: 'Alamat Pribadi',
                    ),
                    CircleStep(
                      isActive: _step >= 3,
                      step: '3',
                      label: 'Informasi Perusahaan',
                    ),
                  ],
                ),
                Positioned(
                  left: 62.5,
                  child: Container(
                    width: (size.width - 210) / 2,
                    height: 45,
                    alignment: Alignment.center,
                    child: LinearProgressIndicator(
                      value: _step > 1 ? 1 : 1 / 2,
                      backgroundColor: AppColors.yellowLight,
                      color: AppColors.yellow,
                    ),
                  ),
                ),
                Positioned(
                  right: 62.5,
                  child: Container(
                    width: (size.width - 210) / 2,
                    height: 45,
                    alignment: Alignment.center,
                    child: LinearProgressIndicator(
                      value: _step < 2 ? 0 : (_step > 2 ? 1 : 1 / 2),
                      backgroundColor: AppColors.yellowLight,
                      color: AppColors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Builder(builder: (BuildContext context) {
                  switch (_step) {
                    case 1:
                      return BioForm(
                        formKey: _bioFormkey,
                        onSubmit: _nextStep,
                      );
                    case 2:
                      return AddressForm(
                        formKey: _addressFormkey,
                        onSubmit: _nextStep,
                        onBack: _previousStep,
                      );
                    case 3:
                      return CompanyForm(
                        formKey: _companyFormkey,
                        onSubmit: _nextStep,
                        onBack: _previousStep,
                      );
                    default:
                      return BioForm(
                        formKey: _bioFormkey,
                        onSubmit: _nextStep,
                      );
                  }
                })),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
