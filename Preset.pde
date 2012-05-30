void switchPreset( int target_preset) {
    cp5.getController( "p" + current_preset ).setColorBackground( color( 25 ) );
    cp5.getController( "p" + target_preset ).setColorBackground( color( 255, 0, 0 ) );;
    savePreset();
    loadPreset( target_preset );
    current_preset = target_preset;
}

void savePreset() {
  for ( int ch = 0; ch < num_channels; ch++ ) {
    presets[current_preset][ch] = int( channels[ch].slider.getValue() );
  }
}

void loadPreset( int preset ) {
  for ( int ch = 0; ch < num_channels; ch++ ) {
    channels[ch].fadeTo( int( presets[preset][ch] ), 500 );
  }
}
