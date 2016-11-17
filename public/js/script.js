"use strict";
(function(){

console.log("js plugged in")

const code = $("xmp")
const hideButton = $('#hide')
const showButton = $('#show')
const hideNumbers = $('#hideNumbers')
const showNumbers = $('#showNumbers')
const rowNumbers = $('.row-number')

code.hide()

showButton.click(function(){
  hideButton.removeAttr('checked');
  code.show()
})

hideButton.click(function(){
  showButton.removeAttr('checked');
  hideButton.attr("checked");
  code.hide();
})

hideNumbers.on("click", function(){
  rowNumbers.hide();
  showNumbers.removeAttr("checked");
  hideNumbers.attr("checked")
})

showNumbers.on("click", function(){
  rowNumbers.show();
  hideNumbers.removeAttr('checked');
  showNumbers.attr("checked");
})



})();
