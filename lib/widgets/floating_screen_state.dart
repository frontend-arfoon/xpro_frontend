import 'package:exact_pro/x_pro.dart';

enum ScreenState {
  empty,
  loading,
  error,
  data1,
  data2,
}

class FloatingScreenState extends StatelessWidget {
  const FloatingScreenState({
    super.key,
    required this.currentState,
    required this.onChange,
  });
  final ScreenState currentState;
  final Function(ScreenState newState) onChange;

  @override
  Widget build(BuildContext context) {
    return XPButton(
      onAction: () {
        var ns = ScreenState.empty;
        switch (currentState) {
          case ScreenState.empty:
            ns = ScreenState.loading;
          case ScreenState.loading:
            ns = ScreenState.error;
          case ScreenState.error:
            ns = ScreenState.data1;
          case ScreenState.data1:
            ns = ScreenState.data2;
          case ScreenState.data2:
            ns = ScreenState.empty;
        }
        onChange(ns);
      },
      height: 34,
      borderColor: context.theme.disabledLightColor,
      color: context.colors.text,
      text: 'State: ${currentState.toString()}',
    );
  }
}

class ScreenStateOver extends StatelessWidget {
  const ScreenStateOver({
    super.key,
    required this.currentState,
    required this.onChange,
    required this.child,
    this.side,
  });
  final ScreenState currentState;
  final Function(ScreenState newState) onChange;
  final Widget child;
  final Widget? side;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      primary: false,
      floatingActionButton: Container(
        margin: Spaces.only(end: Spaces.xlarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (side != null) side!,
            FloatingScreenState(
              currentState: currentState,
              onChange: onChange,
            ),
            Spaces.mediumHeight
          ],
        ),
      ),
    );
  }
}

class ApiScreenStateOver extends StatelessWidget {
  const ApiScreenStateOver({
    super.key,
    required this.child,
    this.side,
  });
  final Widget child;
  final Widget? side;

  @override
  Widget build(BuildContext context) {
    return Text("data");
    // ScreenStateOver(
    //   side: side,
    //   currentState: apiCubit.state.screenState,
    //   onChange: (s) {
    //     apiCubit.toggleScreenState(response1: response1, response2: response2);
    //   },
    //   child: child,
    // );
  }
}
