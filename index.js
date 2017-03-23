/* jshint node: true */
'use strict';

var fs   = require('fs'),
    path = require('path')

module.exports = {
  name: 'ember-leaf-core',

  included: function( app, parentAddon ) {
    var target = (parentAddon || app);

    //var modulePath      = path.relative(app.project.root, __dirname);
    //var componentsPath  = 'bower_components/'

    var componentsPath = target.bowerDirectory;
    var bootstrapPath  = path.join(componentsPath, 'bootstrap-sass-official/assets/');

    var bsJSPath = path.join(bootstrapPath, 'javascripts/');

    target.import(bsJSPath + 'bootstrap/tooltip.js');
    target.import(bsJSPath + 'bootstrap/popover.js');
    target.import(bsJSPath + 'bootstrap/dropdown.js');
    // not sure we STILL need collapse.js check
    target.import(bsJSPath + 'bootstrap/collapse.js');
    target.import(bsJSPath + 'bootstrap/transition.js');


    target.import('vendor/tabdrop/bootstrap-tabdrop.css')
    target.import('vendor/tabdrop/bootstrap-tabdrop.js')
  }
};
