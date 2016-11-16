"use strict";
(function(){

console.log("js plugged in")

const code = $("xmp")
const hideButton = $('#hide')
const showButton = $('#show')

code.hide()

showButton.click(function(){
  hideButton.removeAttr('checked');
  code.show()
})

hideButton.on("click", function(){
  code.hide();
  showButton.removeAttr('checked');
  hideButton.attr("checked")
})


})();
