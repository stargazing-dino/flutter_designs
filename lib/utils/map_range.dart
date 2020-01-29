double mapRange(num value, num inMin, num inMax, num outMin, num outMax) {
  return (value - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}
