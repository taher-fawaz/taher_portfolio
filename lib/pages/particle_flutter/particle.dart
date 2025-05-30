import 'dart:math';

import 'package:flutter/material.dart';

class Particle {
  final Color color;
  double xCoor;
  double yCoor;
  final double size;
  double xDirection = 0.0;
  double yDirection = 0.0;
  static double widgetWidth = 0.0;
  static double widgetHeight = 0.0;
  static double connectDistance = 100.0;
  static double speedUp = 3.0;
  Random random = Random();

  Particle({
    required this.color,
    required this.xCoor,
    required this.yCoor,
    required this.size,
  });

  bool isNear(Particle anotherParticle) {
    // Calculate the distance between two particles
    double distance = (this.xCoor - anotherParticle.xCoor) *
            (this.xCoor - anotherParticle.xCoor) +
        (this.yCoor - anotherParticle.yCoor) *
            (this.yCoor - anotherParticle.yCoor);

    if (sqrt(distance) <= connectDistance) {
      return true;
    }
    return false;
  }

  void getRandomDirection() {
    xDirection = random.nextDouble() * speedUp;
    yDirection = random.nextDouble() * speedUp;
  }

  void move() {
    // Make the particle bounce when it reaches the borders
    if (this.xCoor + this.xDirection > Particle.widgetWidth ||
        this.xCoor + this.xDirection < 0) {
      this.xDirection = this.xDirection * (-1);
    }
    if (this.yCoor + this.yDirection > Particle.widgetHeight ||
        this.yCoor + this.yDirection < 0) {
      this.yDirection = this.yDirection * (-1);
    }
    this.xCoor += this.xDirection;
    this.yCoor += this.yDirection;
  }
}
