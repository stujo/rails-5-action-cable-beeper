/*global Beeps*/

var Beeps = (function() {

  var callbacks = [];

  function onBeep(callback) {
    callbacks.push(callback);
  }

  function beep(beep) {
    callbacks.forEach(function(callback) {
      callback(beep);
    });
  }

  // Add Debug Logger
  onBeep(console.log.bind(null, 'BEEP'));

  return {
    beep: beep,
    onBeep: onBeep
  };
})();
