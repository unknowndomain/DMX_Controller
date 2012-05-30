class Fader {
  
  long startTime;
  long endTime;

  float startValue;
  float endValue;

  boolean animating;
  
  void start( int duration, float tempStartValue, float tempEndValue ) {
    startTime = millis();
    endTime = millis() + duration;
    startValue = tempStartValue;
    endValue = tempEndValue;
    animating = true;
  }
  
  boolean isAnimating() {
    return animating;
  }

  float getProgress() {
    float progress = map( millis(), startTime, endTime, 0, 1 );
    return progress < 1.0 ? progress : 1.0;
  }
  
  float getValue() {
    float value = map( getProgress(), 0.0, 1.0, startValue, endValue );
    if ( value == endValue ) animating = false;
    return value;
  }
}
