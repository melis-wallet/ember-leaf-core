/* globals module */

module.exports = {
  afterInstall: function () {

    return this.addBowerPackageToProject('fastclick');
  },

  normalizeEntityName: function () {
  }
};
