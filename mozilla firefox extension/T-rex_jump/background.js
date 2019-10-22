
var DELAY = 0.1;
var trexjump = "https://elgoog.im/t-rex/?bot";


var gettingActiveTab = browser.tabs.query({active: true, currentWindow: true});
gettingActiveTab.then((tabs) => {
  restartAlarm(tabs[0].id);
});


browser.tabs.onUpdated.addListener((tabId, changeInfo, tab) => {
  if (!changeInfo.url) {
    return;
  }
  var gettingActiveTab = browser.tabs.query({active: true, currentWindow: true});
  gettingActiveTab.then((tabs) => {
    if (tabId == tabs[0].id) {
      restartAlarm(tabId);
    }
  });
});


browser.tabs.onActivated.addListener((activeInfo) => {
  restartAlarm(activeInfo.tabId);
});


function restartAlarm(tabId) {
  browser.pageAction.hide(tabId);
  browser.alarms.clearAll();
  var gettingTab = browser.tabs.get(tabId);
  gettingActiveTab.then((tab) => {
    if (tab.url != trexjump) {
      browser.alarms.create("", {delayInMinutes: DELAY});
    }
  });
}


browser.alarms.onAlarm.addListener((alarm) => {
  var gettingActiveTab = browser.tabs.query({active: true, currentWindow: true});
  gettingActiveTab.then((tabs) => {
    browser.pageAction.show(tabs[0].id);
  });
});


browser.pageAction.onClicked.addListener(() => {
  browser.tabs.update({url: trexjump});
});
