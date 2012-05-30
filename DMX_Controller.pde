import processing.serial.*;
import controlP5.*;

// Strings
String mainTitle = "DMX Controller";
float version = 1.1;

int ch;
int num_channels = 20;

Serial arduino;
boolean connected = false;

// Presets
float presets[][] = new float[12][num_channels];
int current_preset = 0;

// ControlP5 Objects
ControlP5 cp5;
Channel channels[] = new Channel[512];
Textlabel title, connectedLabel;
DropdownList serialList;

void setup() {
  int channel_width = num_channels * 50;
  int preset_width = 200;
  size( channel_width + preset_width - 1, 211 );
  frame.setTitle( mainTitle );
  
  setupUI();

  for ( int ch = 1; ch <= num_channels; ch++ ) {
    channels[ch-1] = new Channel( cp5, ch, ( ch - 1 ) * 50, 30);
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
  
  if ( ! theEvent.isGroup() ) {
    if ( theEvent.controller().name().indexOf( "ch" ) != -1 ) {
      String cmd = int( theEvent.controller().name().substring( 2, theEvent.controller().name().length() ) ) + "c" + int( theEvent.controller().getValue() ) + "w";
      arduino.write( cmd );
    }
  
    if ( theEvent.controller().name().indexOf( "p" ) != -1 ) {
      int target_preset = int( theEvent.controller().name().substring( 1, theEvent.controller().name().length() ) );
      switchPreset( target_preset );
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
    
    cp5.getController( "presets" ).show();
      
    for ( int i = 0; i < presets.length; i++ ) {
      cp5.getController( "p" + i ).show();
    }
  }
}

void keyPressed() {
  if ( key == '=' )
    switchPreset( ( current_preset + 1 ) < presets.length ? current_preset + 1 : 0 );
    
  if ( key == '-' )
    switchPreset( ( current_preset - 1 ) >= 0 ? current_preset - 1 : presets.length - 1 );
}
