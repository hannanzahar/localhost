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
//= require stickUp.min
//= require owl.carousel
//= require PIE_IE678
//= require PIE_IE9
//= require users
//= require classie
//= require wow.min
//= require bootstrap
//= require script
//= require uiMorphingButton_inflow

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}


$(document).ready(function() {
    $('#myCarousel').carousel({
	    interval: 10000
	})
});

