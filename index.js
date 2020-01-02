'use strict';

const fs   = require('fs'),
      path = require('path'),
      Funnel = require('broccoli-funnel'),
      mergeTrees = require('broccoli-merge-trees'),
      stew = require('broccoli-stew'),
      rename = stew.rename,
      map = stew.map;


module.exports = {
  name: 'ember-leaf-core',

  included( app, parentAddon ) {
    let target = (parentAddon || app);

    let componentsPath = target.bowerDirectory;

    target.import('vendor/tabdrop/bootstrap-tabdrop.css');
    target.import('vendor/tabdrop/bootstrap-tabdrop.js');
    target.import('vendor/balloon-css/balloon.min.css');

    // register library version
    app.import('vendor/ember-leaf-core/register-version.js');
  },

  treeForVendor(vendorTree) {
    let trees = [];

    //console.error("VT: ",vendorTree);

    if (vendorTree) {
      trees.push(vendorTree);
    }


    let versionTree = rename(
      map(vendorTree, 'ember-leaf-core/register-version.template', (c) => c.replace('###VERSION###', require('./package.json').version)),
      'register-version.template',
      'register-version.js'
    );
    trees.push(versionTree);

    let cssPath = path.join(this.project.root, 'node_modules', 'balloon-css');

    trees.push(new Funnel(cssPath, {
      destDir: 'balloon-css',
      files: ['balloon.min.css']
    }));

    //console.error("TREES: ", trees.length, trees);
    return mergeTrees(trees, {overwrite: true}); /* BUG FIXME: why we need overwrite? */
  }
};
