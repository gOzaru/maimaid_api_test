// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/library/widget/github/loading/decorate/decorate.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/audio_equalizer.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_beat.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_clip_rotate.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_clip_rotate_multiple.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_clip_rotate_pulse.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_grid_beat.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_grid_pulse.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_pulse.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_pulse_rise.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_pulse_sync.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_rotate.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_rotate_chase.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_scale.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_scale_multiple.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_scale_ripple.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_scale_ripple_multiple.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_spin_fade_loader.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_triangle_path.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_triangle_path_colored.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_zig_zag.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/ball_zig_zag_deflect.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/cube_transition.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/line_scale.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/line_scale_party.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/line_scale_pulse_out.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/line_scale_pulse_out_rapid.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/line_spin_fade_loader.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/orbit.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/pacman.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/semi_circle_spin.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/square_spin.dart';
import 'package:maimaid_api_test/library/widget/github/loading/indicators/triangle_skew_spin.dart';

import 'indicators/circle_stroke_spin.dart';

// Project imports:


///This is derived from package loading_indicator: ^3.1.0

///34 different types animation enums.
enum Indicator {
  ballPulse,
  ballGridPulse,
  ballClipRotate,
  squareSpin,
  ballClipRotatePulse,
  ballClipRotateMultiple,
  ballPulseRise,
  ballRotate,
  cubeTransition,
  ballZigZag,
  ballZigZagDeflect,
  ballTrianglePath,
  ballTrianglePathColored,
  ballTrianglePathColoredFilled,
  ballScale,
  lineScale,
  lineScaleParty,
  ballScaleMultiple,
  ballPulseSync,
  ballBeat,
  lineScalePulseOut,
  lineScalePulseOutRapid,
  ballScaleRipple,
  ballScaleRippleMultiple,
  ballSpinFadeLoader,
  lineSpinFadeLoader,
  triangleSkewSpin,
  pacman,
  ballGridBeat,
  semiCircleSpin,
  ballRotateChase,
  orbit,
  audioEqualizer,
  circleStrokeSpin,
}

/// Entrance of the loading.
class LoadingIndicator extends StatelessWidget {
  /// Indicate which type.
  final Indicator indicatorType;

  /// The color you draw on the shape.
  final List<Color>? colors;
  final Color? backgroundColor;

  /// The stroke width of line.
  final double? strokeWidth;

  /// Applicable to which has cut edge of the shape
  final Color? pathBackgroundColor;

  /// Animation status, true will pause the animation, default is false
  final bool pause;

  const LoadingIndicator({
    Key? key,
    required this.indicatorType,
    this.colors,
    this.backgroundColor,
    this.strokeWidth,
    this.pathBackgroundColor,
    this.pause = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (indicatorType == Indicator.circleStrokeSpin && pause) {
      debugPrint("LoadingIndicator: it will not take any effect when set pause:true on ${Indicator.circleStrokeSpin}");
    }
    List<Color> safeColors = colors == null || colors!.isEmpty ? [Theme.of(context).primaryColor] : colors!;
    return DecorateContext(
      decorateData: DecorateData(
        indicator: indicatorType,
        colors: safeColors,
        strokeWidth: strokeWidth,
        pathBackgroundColor: pathBackgroundColor,
        pause: pause,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: backgroundColor,
          child: _buildIndicator(),
        ),
      ),
    );
  }

  /// return the animation indicator.
  _buildIndicator() {
    switch (indicatorType) {
      case Indicator.ballPulse:
        return const BallPulse();
      case Indicator.ballGridPulse:
        return const BallGridPulse();
      case Indicator.ballClipRotate:
        return const BallClipRotate();
      case Indicator.squareSpin:
        return const SquareSpin();
      case Indicator.ballClipRotatePulse:
        return const BallClipRotatePulse();
      case Indicator.ballClipRotateMultiple:
        return const BallClipRotateMultiple();
      case Indicator.ballPulseRise:
        return const BallPulseRise();
      case Indicator.ballRotate:
        return const BallRotate();
      case Indicator.cubeTransition:
        return const CubeTransition();
      case Indicator.ballZigZag:
        return const BallZigZag();
      case Indicator.ballZigZagDeflect:
        return const BallZigZagDeflect();
      case Indicator.ballTrianglePath:
        return const BallTrianglePath();
      case Indicator.ballTrianglePathColored:
        return const BallTrianglePathColored();
      case Indicator.ballTrianglePathColoredFilled:
        return const BallTrianglePathColored(isFilled: true);
      case Indicator.ballScale:
        return const BallScale();
      case Indicator.lineScale:
        return const LineScale();
      case Indicator.lineScaleParty:
        return const LineScaleParty();
      case Indicator.ballScaleMultiple:
        return const BallScaleMultiple();
      case Indicator.ballPulseSync:
        return const BallPulseSync();
      case Indicator.ballBeat:
        return const BallBeat();
      case Indicator.lineScalePulseOut:
        return const LineScalePulseOut();
      case Indicator.lineScalePulseOutRapid:
        return const LineScalePulseOutRapid();
      case Indicator.ballScaleRipple:
        return const BallScaleRipple();
      case Indicator.ballScaleRippleMultiple:
        return const BallScaleRippleMultiple();
      case Indicator.ballSpinFadeLoader:
        return const BallSpinFadeLoader();
      case Indicator.lineSpinFadeLoader:
        return const LineSpinFadeLoader();
      case Indicator.triangleSkewSpin:
        return const TriangleSkewSpin();
      case Indicator.pacman:
        return const Pacman();
      case Indicator.ballGridBeat:
        return const BallGridBeat();
      case Indicator.semiCircleSpin:
        return const SemiCircleSpin();
      case Indicator.ballRotateChase:
        return const BallRotateChase();
      case Indicator.orbit:
        return const Orbit();
      case Indicator.audioEqualizer:
        return const AudioEqualizer();
      case Indicator.circleStrokeSpin:
        return const CircleStrokeSpin();
      default:
        throw Exception("no related indicator type:$indicatorType found");
    }
  }
}
