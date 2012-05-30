class Channel {

  ControlP5 cp5;
  Slider slider;
  int num, x, y;
  Fader fader;
  
  Channel( ControlP5 temp_cp5, int temp_num, int temp_x, int temp_y ) {
    cp5 = temp_cp5;
    num = temp_num;
    x = temp_x;
    y = temp_y;
    
    slider = cp5.addSlider( "ch" + num )
      .setPosition( x + 10, y + 10 )
      .setRange( 0, 255 )
      .setSize( 10, 150 )
      .setValue( 0 )
      .setScrollSensitivity( .25 )
      .hide();
      
    fader = new Fader();
    
    slider.getCaptionLabel().set( "CH " + num );
    slider.getValueLabel().hide();
  }
  
  void fadeTo( int value, int duration ) {
      fader.start( duration, slider.getValue(), value );
  }
  
  void redraw() {
    line( x + 49, y, x + 49, y + 180 );
    
    if ( fader.isAnimating() )
      slider.setValue( int( fader.getValue() ) );
  }
  
}
