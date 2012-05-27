void setupUI() {
  cp5 = new ControlP5( this )
    .setColorBackground( color( 25 ) )
    .setColorForeground( 128 )
    .setColorActive( 255 );

  serialList = cp5.addDropdownList( "serialList", width - 190, 20, 180, 100 )
    .setLabel( "Serial Port" )
    .actAsPulldownMenu( true )
    .setColorBackground( color( 255, 0, 0 ) )
    .setColorActive( color( 255, 0, 0 ) )
    .setColorForeground( color( 255, 0, 0 ) );
  
  for ( int i = 0; i < Serial.list().length; i++ ) {
    serialList.addItem( Serial.list()[i], i )
      .setColorForeground( 128 );
  }
  
  title = cp5.addTextlabel( "title", mainTitle.toUpperCase() + " - V" + version, 10, 12 )
    .setWidth( 300 );
  
  connectedLabel = cp5.addTextlabel( "connected", "a" , width - 185, 12 )
    .hide()
    .setWidth( 175 );
}

void drawUI() {
  background( 40 );
  
  // Draw boxes
  fill( 25 );
  noStroke();
  rect( 0, 0, width, 30 );
  
  fill( 255, 0, 0 );
  if ( ! connected )
    rect( width - 200, 0, width, 30 );
  
  // Draw title bar
  stroke( 64 );
  line( 0, 30, width, 30 );
  line( width - 200, 0, width - 200, 30 );
}
