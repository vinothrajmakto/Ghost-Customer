import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'companyapproval_model.dart';
export 'companyapproval_model.dart';

class CompanyapprovalWidget extends StatefulWidget {
  const CompanyapprovalWidget({super.key});

  @override
  State<CompanyapprovalWidget> createState() => _CompanyapprovalWidgetState();
}

class _CompanyapprovalWidgetState extends State<CompanyapprovalWidget> {
  late CompanyapprovalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompanyapprovalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF183835),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'mnuvstod' /* Your Profile is being Validate... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Jaldi',
                            color: Colors.white,
                            fontSize: 19.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -0.64),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Container(
                  width: double.infinity,
                  height: 300.0,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Lottie.asset(
                      'assets/jsons/pmxQRduRQP.json',
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
