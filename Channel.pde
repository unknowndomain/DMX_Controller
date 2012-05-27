class Channel {

  ControlP5 cp5;
  Slider slider;
  int num, x, y;
  
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
    
    slider.getCaptionLabel().set( "CH " + ( num + 1 ) );
    slider.getValueLabel().hide();
  }
  
  void redraw() {
    line( x + 49, y, x + 49, y + 180 );
  }
  
}
