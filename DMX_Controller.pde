import processing.serial.*;
import controlP5.*;

// Strings
String mainTitle = "DMX Controller";
float version = 1;

int ch;

Serial arduino;
boolean connected = false;

// ControlP5 Objects
ControlP5 cp5;
Channel channels[] = new Channel[512];
Textlabel title, connectedLabel;
DropdownList serialList;

void setup() {
  size( ( 20 * 50 ) - 1, 211 );
  frame.setTitle( mainTitle );
  
  setupUI();

  for ( int ch = 0; ch < ( width + 1 ) / 50; ch++ ) {
    channels[ch] = new Channel( cp5, ch, ch * 50, 30);
  }

  if ( searchForArduino() != -1 )
    connectToArduino( searchForArduino() );
}

void draw() {
  drawUI();
  
  if ( connected )
    for ( int i = 0; i < channels.length; i++ )
      if ( channels[i] != null )
        channels[i].redraw();
}

void controlEvent(ControlEvent theEvent) {
  if ( theEvent.name() == "serialList" ) {
    connectToArduino( (int)theEvent.group().value() );
  }
    
  if ( connected ) {
    if ( theEvent.name().indexOf( "ch" ) != -1 ) {
      String cmd = int( theEvent.name().substring( 2, theEvent.name().length() ) ) + "c" + int( theEvent.getValue() ) + "w";
      arduino.write( cmd );
      println( cmd );
    }
  }
}

int searchForArduino() {
  for ( int i = 0; i < Serial.list().length; i++ )
    if ( Serial.list()[i].toLowerCase().indexOf( "tty.usbmodem" ) != -1 )
      return i;
  return -1;
}

void connectToArduino( int id ) {
  if ( ! connected ) {
    arduino = new Serial( this, Serial.list()[id], 9600 );
    serialList.hide();
    connectedLabel.setValue( Serial.list()[id] )
      .show();
    connected = true;
  
    for ( int i = 0; i < channels.length; i++ ) {
      if ( channels[i] != null ) {
        channels[i].slider.show();
      }
    }
  }
}

void mouseMoved() {
  
}
