import 'dart:io';
import 'package:dio/dio.dart';
import 'package:doctor_application/Widget/login_and_register_button.dart';
import 'package:doctor_application/Widget/navigation_bar.dart';
import 'package:doctor_application/Widget/or_connect_using_button.dart';
import 'package:doctor_application/Widget/or_connect_using_button_g.dart';
import 'package:doctor_application/Widget/text_style_subtitle_One.dart';
import 'package:doctor_application/Widget/text_style_subtitle_One_blue.dart';
import 'package:doctor_application/Widget/title_headline_small.dart';
import 'package:doctor_application/core/constants.dart';
import 'package:doctor_application/service/post_comments.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DoctorInfo extends StatefulWidget {
  const DoctorInfo({super.key});

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  PageController pageController = PageController(initialPage: 0);

  int _selectindex = 0;

  final String _name = "Name";
  final String _email = "Email";
  final String _phone = "Phone";
  final String _passoword = "Passoword";
  final String _confirimPassoword = "Confirim Passoword";

  TextEditingController _textEditingControllerName = TextEditingController();
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerPhone = TextEditingController();
  TextEditingController _textEditingControllerPassoword =
      TextEditingController();
  TextEditingController _textEditingControllerConfirimPas =
      TextEditingController();

  late final Dio _dio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/comments";
  bool _isLoading = false;

  void _isLoadingCheck() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  // Dio'nun BaseUrl'sini Tanımlama işlemini burada yaptır.
  @override
  void initState() {
    super.initState();
    _dio = Dio(
      BaseOptions(baseUrl: _baseUrl),
    );
  }

  Future<void> insertApi(PostComments model) async {
    _isLoadingCheck(); //Butonu Pasif hale getirmek için.
    final response = await _dio.post("comments", data: model);

    if (response.statusCode == HttpStatus.created) {
      print("Login successful  => Mobil Developer");
    }
  }

  Future openDialog() => showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title:
                  TitleHeadlineSmall(text: DoctorConst.doctorInfoAlertMessage),
              content: Lottie.asset(DoctorConst.doctorAlert),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: GoToLogin,
                    child: TextStyleSubtitleOneBlue(
                        text: DoctorConst.doctorInfoAlertButton),
                  ),
                ),
              ],
            )),
      );

  void GoToLogin() {
    Navigator.of(context).pop(
      MaterialPageRoute(
        builder: ((context) => DoctorInfo()),
      ),
    );
  }

  Future openDialogTwo() => showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: TitleHeadlineSmall(
                  text: DoctorConst.doctorInfoLoginNoConnect),
              content: Lottie.asset(DoctorConst.doctorNoConmnect),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: OK,
                    child: TextStyleSubtitleOneBlue(
                        text: DoctorConst.doctorInfoAlertOk),
                  ),
                ),
              ],
            )),
      );

  void OK() {
    Navigator.of(context).pop(
      MaterialPageRoute(
        builder: ((context) => DoctorInfo()),
      ),
    );
  }

  Future openDialogLogin() => showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: TitleHeadlineSmall(
                  text: DoctorConst.doctorInfoLoginSuccessfuly),
              content: Lottie.asset(DoctorConst.doctorLoginSuccessfuly),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: Login,
                    child: TextStyleSubtitleOneBlue(
                        text: DoctorConst.doctorInfoLoginAlertButton),
                  ),
                ),
              ],
            )),
      );

  void Login() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => NavigationBottomBar()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _selectindex = index;
          });
        },
        children: [
          _paddingColmunExpandeds(context),
          _paddingColumnRegister(context),
          _paddingColumnExpandedss(context),
        ],
      ),
    );
  }

  Padding _paddingColumnExpandedss(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _expandedRowScips(context),
          _expandedAnimationimage(),
          _expandedColmunLoginTexts(),
          _expandedTextfieldLogin(),
          _expandedScrollClomunLogin(),
          _expandedRowButton(),
          _expandedPaddingRowNexttoPage(),
        ],
      ),
    );
  }

  Expanded _expandedScrollClomunLogin() {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            LoginAndRegisterButton(
              onPressed: () {
                openDialogLogin();
              },
              widget: Text(DoctorConst.doctorInfoLoginButton),
            ),
            DoctorConst.sizedBoxHeight25,
            TextStyleSubtitleOne(text: DoctorConst.doctorInfoLoginOrconnet),
          ],
        ),
      ),
    );
  }

  Expanded _expandedTextfieldLogin() {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _textfieldEmailLogin(),
            DoctorConst.sizedBoxHeight20,
            _textfieldPassowordLogin(),
            DoctorConst.sizedBoxHeight5,
            TextStyleSubtitleOne(text: DoctorConst.doctorInfoLoginForget),
          ],
        ),
      ),
    );
  }

  Expanded _expandedColmunLoginTexts() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          TitleHeadlineSmall(text: DoctorConst.doctorInfoLoginTitle),
          TextStyleSubtitleOne(text: DoctorConst.doctorInfoLoginText),
        ],
      ),
    );
  }

  Expanded _expandedAnimationimage() {
    return Expanded(
      flex: 1,
      child: Lottie.asset(DoctorConst.doctorRegister),
    );
  }

  Expanded _expandedRowScips(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(""),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: ((context) => NavigationBottomBar()),
                ),
              );
            },
            child: Text(
              DoctorConst.doctorInfoPageScip,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: DoctorConst.colorBlue),
            ),
          ),
        ],
      ),
    );
  }

  Padding _paddingColumnRegister(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _expandedRowScip(context),
          _expandedColmunTitleText(),
          _expandedColmunTextfileds(),
          DoctorConst.sizedBoxHeight20,
          _expandedColmunButton(),
          _expandedPaddingRowNextPage(),
        ],
      ),
    );
  }

  Expanded _expandedPaddingRowNexttoPage() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // _selectindex+1 ==> sayfa sayısı 0dan başladığı için eklenmiştir, doğru sayfa sayısını göstermesi içindir.
            TextButton(
              onPressed: () {
                pageController.previousPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.slowMiddle);
              },
              child:
                  Text("${_selectindex + 1} / ${DoctorConst.doctorInfoPageNo}"),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.slowMiddle);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: ((context) => NavigationBottomBar()),
                      ),
                    );
                  },
                );
              },
              child: Text(DoctorConst.doctorInfoPageNext),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _expandedRowButton() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OrConnectUsingFacebook(
            onPressed: () {
              openDialogTwo();
            },
            widget: Text(DoctorConst.doctorInfoLoginFacebook),
            icon: Icon(Icons.facebook),
          ),
          DoctorConst.sizedBoxWidth20,
          OrConnectUsingGoogle(
            onPressed: () {
              openDialogTwo();
            },
            widget: Text(DoctorConst.doctorInfoLoginGoogle),
            icon: Icon(Icons.g_mobiledata_outlined),
          ),
        ],
      ),
    );
  }

  TextField _textfieldPassowordLogin() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: DoctorConst.colorBlue),
            borderRadius: DoctorConst.borderRadius30,
          ),
          labelText: _passoword,
          prefixIcon: Icon(Icons.lock_open),
          prefixIconColor: DoctorConst.colorBlue),
      controller: _textEditingControllerPassoword,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      obscureText: true,
    );
  }

  TextField _textfieldEmailLogin() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: DoctorConst.colorBlue),
            borderRadius: DoctorConst.borderRadius30,
          ),
          labelText: _email,
          prefixIcon: Icon(Icons.markunread_outlined),
          prefixIconColor: DoctorConst.colorBlue),
      controller: _textEditingControllerEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Padding _paddingColumnExpandedsPageTwo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _expandedRowScip(context),
          _expandedColmunTitleText(),
          _expandedColmunTextfileds(),
          DoctorConst.sizedBoxHeight20,
          _expandedColmunButton(),
          _expandedPaddingRowNextPage(),
        ],
      ),
    );
  }

  Expanded _expandedPaddingRowNextPage() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // _selectindex+1 ==> sayfa sayısı 0dan başladığı için eklenmiştir, doğru sayfa sayısını göstermesi içindir.
            TextButton(
              onPressed: () {
                pageController.previousPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.slowMiddle);
              },
              child:
                  Text("${_selectindex + 1} / ${DoctorConst.doctorInfoPageNo}"),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.slowMiddle);
                  },
                );
              },
              child: Text(DoctorConst.doctorInfoPageNext),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _expandedColmunButton() {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            LoginAndRegisterButton(
              onPressed: () {
                openDialog();
                if (_textEditingControllerName.text.isNotEmpty &&
                    _textEditingControllerEmail.text.isNotEmpty &&
                    _textEditingControllerPhone.text.isNotEmpty &&
                    _textEditingControllerPassoword.text.isNotEmpty &&
                    _textEditingControllerConfirimPas.text.isNotEmpty) {
                  final model = PostComments(
                    name: _textEditingControllerName.text,
                    email: _textEditingControllerEmail.text,
                    body: _textEditingControllerPhone.text,
                    id: int.tryParse(_textEditingControllerPassoword.text),
                    postId:
                        int.tryParse(_textEditingControllerConfirimPas.text),
                  );
                }
              },
              widget: Text(DoctorConst.doctorInfoCreatedButton),
            ),
            DoctorConst.sizedBoxHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextStyleSubtitleOne(text: DoctorConst.doctorInfoAccount),
                TextStyleSubtitleOneBlue(text: DoctorConst.doctorInfoLoginHere),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded _expandedColmunTextfileds() {
    return Expanded(
      flex: 4,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textfieldName(),
            DoctorConst.sizedBoxHeight20,
            _textfiledEmail(),
            DoctorConst.sizedBoxHeight20,
            textfiledPhone(),
            DoctorConst.sizedBoxHeight20,
            _textfieldPassoword(),
            DoctorConst.sizedBoxHeight20,
            _textfieldConfirimPass(),
          ],
        ),
      ),
    );
  }

  TextField _textfieldConfirimPass() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: DoctorConst.colorBlue),
            borderRadius: DoctorConst.borderRadius30,
          ),
          labelText: _confirimPassoword,
          prefixIcon: Icon(Icons.lock_open),
          prefixIconColor: DoctorConst.colorBlue),
      controller: _textEditingControllerConfirimPas,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      obscureText: true,
    );
  }

  TextField _textfieldPassoword() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: DoctorConst.colorBlue),
            borderRadius: DoctorConst.borderRadius30,
          ),
          labelText: _passoword,
          prefixIcon: Icon(Icons.lock_open),
          prefixIconColor: DoctorConst.colorBlue),
      controller: _textEditingControllerPassoword,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      obscureText: true,
    );
  }

  TextField textfiledPhone() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: DoctorConst.colorBlue),
            borderRadius: DoctorConst.borderRadius30,
          ),
          labelText: _phone,
          prefixIcon: Icon(Icons.phone_iphone),
          prefixIconColor: DoctorConst.colorBlue),
      controller: _textEditingControllerPhone,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
    );
  }

  TextField _textfiledEmail() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: DoctorConst.colorBlue),
            borderRadius: DoctorConst.borderRadius30,
          ),
          labelText: _email,
          prefixIcon: Icon(Icons.markunread_outlined),
          prefixIconColor: DoctorConst.colorBlue),
      controller: _textEditingControllerEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  TextField _textfieldName() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: DoctorConst.colorBlue),
            borderRadius: DoctorConst.borderRadius30,
          ),
          labelText: _name,
          prefixIcon: Icon(Icons.person_outline),
          prefixIconColor: DoctorConst.colorBlue),
      controller: _textEditingControllerName,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  Expanded _expandedColmunTitleText() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          TitleHeadlineSmall(text: DoctorConst.doctorInfoRegisterTitle),
          TextStyleSubtitleOne(text: DoctorConst.doctorInfoRegisterText),
        ],
      ),
    );
  }

  Expanded _expandedRowScip(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(""),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: ((context) => NavigationBottomBar()),
                ),
              );
            },
            child: Text(
              DoctorConst.doctorInfoPageScip,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: DoctorConst.colorBlue),
            ),
          ),
        ],
      ),
    );
  }

  Padding _paddingColmunExpandeds(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _expandedRowTextScip(context),
          _animationImage(),
          _spacer(),
          _expandedColumnTitleText(),
          _expandexPageNoNext(),
        ],
      ),
    );
  }

  Spacer _spacer() => Spacer();

  Expanded _expandedRowTextScip(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(""),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: ((context) => NavigationBottomBar()),
                ),
              );
            },
            child: Text(
              DoctorConst.doctorInfoPageScip,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: DoctorConst.colorBlue),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _animationImage() {
    return Expanded(
      flex: 2,
      child: Lottie.asset(DoctorConst.doctorSearch),
    );
  }

  Expanded _expandedColumnTitleText() {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          TitleHeadlineSmall(text: DoctorConst.doctorInfoTitle),
          DoctorConst.sizedBoxHeight15,
          TextStyleSubtitleOne(text: DoctorConst.doctorInfoText),
        ],
      ),
    );
  }

  Expanded _expandexPageNoNext() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // _selectindex+1 ==> sayfa sayısı 0dan başladığı için eklenmiştir, doğru sayfa sayısını göstermesi içindir.
            TextButton(
              onPressed: () {},
              child:
                  Text("${_selectindex + 1} / ${DoctorConst.doctorInfoPageNo}"),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.slowMiddle);
                  },
                );
              },
              child: Text(DoctorConst.doctorInfoPageNext),
            ),
          ],
        ),
      ),
    );
  }
}
