// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require modernizr-2.8.3.min
//= require private_pub
//= require chat
//= require user
//= require turbolinks
//= require gmaps/google
//= require_self
//= require_tree
//= require stickUp.min.js
//= require owl.carousel.js
//= require PIE_IE678.js
//= require PIE_IE9.js
//= require users.js
//= require classie.js
//= require wow.min.js
//= require bootstrap.js
//= require script.js
//= require uiMorphingButton_inflow.js

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}

