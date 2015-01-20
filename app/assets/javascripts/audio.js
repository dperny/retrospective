$(document).ready(function() {
  soundManager.setup({
    url: smswfurl, 
    preferFlash: false,
    onready: function() {},
    ontimeout: smTimeout
  });
});

function smTimeout() {
  // put some stuff here if SM fails to load
}


