slate.bind("tab:ctrl;shift;alt;cmd", function(win) {
  var appName = win.app().name();
  if (appName === "iTerm2") {
    win.doOperation(slate.operation("focus", {"app": "Google Chrome"}));
  } else {
    win.doOperation(slate.operation("focus", {"app": "iTerm2"}));
  }
});
slate.log("[SLATE] -------------- Finished Loading Config --------------");
