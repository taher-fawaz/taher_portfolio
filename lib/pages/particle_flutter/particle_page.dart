import 'dart:math';
import 'package:flutter/material.dart';
import 'package:taher_portfolio/pages/particle_flutter/particles.dart'
    as particle;
import 'package:taher_portfolio/pages/particle_flutter/simple_animations_package.dart';

class ParticleBackgroundPage extends StatelessWidget {
  const ParticleBackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // AnimatedParticle(),
        const Positioned.fill(
            child:
                AnimatedBackground()), //Go to AnimatedBackground widget and comment the child to get bubble only background
        // Positioned.fill(child: Particles(30)), //Uncomment when you need to show bubble
      ],
    );
  }
}

class Particles extends StatefulWidget {
  final int numberOfParticles;

  const Particles(this.numberOfParticles, {Key? key}) : super(key: key);

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles> {
  final Random random = Random();

  final List<ParticleModel> particles = [];

  @override
  void initState() {
    List.generate(widget.numberOfParticles, (index) {
      particles.add(ParticleModel(random));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: const Duration(seconds: 30),
      onTick: _simulateParticles,
      builder: (context, time) {
        return CustomPaint(
          painter: ParticlePainter(particles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    for (var particle in particles) {
      particle.maintainRestart(time);
    }
  }
}

class ParticleModel {
  Animatable<Map<String, dynamic>> tween;
  double size;
  AnimationProgress animationProgress;
  Random random;

  ParticleModel(this.random, {Duration time = Duration.zero})
      : tween = MultiTrackTween([]),
        size = 0.2 + random.nextDouble() * 0.4,
        animationProgress =
            AnimationProgress(duration: Duration.zero, startTime: time) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);
    final duration = Duration(milliseconds: 3000 + random.nextInt(6000));

    tween = MultiTrackTween([
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
          curve: Curves.easeInOutSine),
      Track("y").add(
          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
          curve: Curves.easeIn),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + random.nextDouble() * 0.4;
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}

class ParticlePainter extends CustomPainter {
  List<ParticleModel> particles;
  Duration time;

  ParticlePainter(this.particles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withAlpha(50);

    for (var particle in particles) {
      var progress = particle.animationProgress.progress(time);
      final animation = particle.tween.transform(progress);
      final position =
          Offset(animation["x"] * size.width, animation["y"] * size.height);
      canvas.drawCircle(position, size.width * 0.2 * particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Trendy Dark Mode Colors: Deep Purple to Electric Blue
    // Trendy Light Mode Colors: Coral Pink to Peach Orange
    final tween = isDark
        ? MultiTrackTween([
            Track("color1").add(
                const Duration(seconds: 5),
                ColorTween(
                    begin: const Color(0xFF1A0B3D), // Deep Dark Purple
                    end: const Color(0xFF6366F1))), // Electric Indigo
            Track("color2").add(
                const Duration(seconds: 5),
                ColorTween(
                    begin: const Color(0xFF0F172A), // Dark Slate
                    end: const Color(0xFF3B82F6))) // Electric Blue
          ])
        : MultiTrackTween([
            Track("color1").add(
                const Duration(seconds: 5),
                ColorTween(
                    begin: const Color(0xFFFEF3F2), // Soft Peach White
                    end: const Color(0xFFFF6B6B))), // Coral Red
            Track("color2").add(
                const Duration(seconds: 5),
                ColorTween(
                    begin: const Color(0xFFFFF7ED), // Warm Cream
                    end: const Color(0xFFFF9F43))) // Sunset Orange
          ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        final animationMap = animation as Map<String, dynamic>;
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [animationMap["color1"], animationMap["color2"]])),
          child:
              const AnimatedParticle(), //Comment this when not using particle_flutter
        );
      },
    );
  }
}

class AnimatedParticle extends StatefulWidget {
  const AnimatedParticle({Key? key}) : super(key: key);

  @override
  _AnimatedParticleState createState() => _AnimatedParticleState();
}

class _AnimatedParticleState extends State<AnimatedParticle> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Particle colors that complement the background
    final tween = isDark
        ? MultiTrackTween([
            Track("color1").add(
                const Duration(seconds: 3),
                ColorTween(
                    begin: const Color(0xFF8B5CF6), // Purple 500
                    end: const Color(0xFF06B6D4))), // Cyan 500
          ])
        : MultiTrackTween([
            Track("color1").add(
                const Duration(seconds: 3),
                ColorTween(
                    begin: const Color(0xFFEC4899), // Pink 500
                    end: const Color(0xFFF59E0B))), // Amber 500
          ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        final animationMap = animation as Map<String, dynamic>;
        return particle.Particles(150, animationMap["color1"]);
      },
    );
  }
}
