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
  
  cp5.addTextlabel( "presets", "PRESETS", ( num_channels  * 50 ) + 10, 40 )
    .hide()
    .setWidth( 300 );
  
  for ( int i = 0; i < presets.length; i++ ) {
    cp5.addButton( "p" + i, 1.0, ( ( num_channels  * 50 ) + ( i % 2 * 95 ) ) + 10, 61 + ( i/2 * 25 ), 85, 15 )
      .hide()
      .setLabel( str( i + 1 ) );
  }
  
  cp5.getController( "p0" ).setColorBackground( color( 255, 0, 0 ) );

  title = cp5.addTextlabel( "title", mainTitle.toUpperCase() + " - V" + version, 10, 12 )
    .setWidth( 300 );
  
  connectedLabel = cp5.addTextlabel( "connected", "" , width - 185, 12 )
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
