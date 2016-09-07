$(function() { if (typeof angular !== 'undefined') {

  angular.module('app', []);

  angular.module('app').controller('SearchConfigController', function(){

    var vm = this;

    var get_selected = function(field_name) {
      if (get_config_field(field_name)) {
        return true;
      } else {
        return false;
      }
    };

    var get_weight = function(field_name) {
      if (f = get_config_field(field_name)) {
        return f.weight;
      } else {
        return "1.0";
      }
    };

    var get_config_field = function(field) {
      var f = get_config_fields().filter(function(cf){
        return cf.name == field;
      });
      if (1 == f.length) {
        return f[0];
      } else {
        return null;
      }
    };

    var get_config_fields = function() {
      return vm.config.query.multi_match.fields.map(function(field){
        parts = field.split('^');
        if (2 == parts.length) {
          name = parts[0];
          weight = parts[1];
        } else {
          name = parts[0];
          weight = "1.0";
        }
        return {name: name, weight: weight};
      });
    };

    vm.config = $('#search_config_config').data('initial-value');

    vm.refresh = function() {
      vm.config.query.multi_match.fields = vm.fields.filter(function(f){
        return f.selected;
      }).map(function(f){
        if ('1' == f.weight || '1.0' == f.weight) {
          return f.name;
        } else {
          return f.name + '^' + f.weight;
        }
      });
      vm.config_json = angular.toJson(vm.config, true);
    };

    vm.field_names = $('#search-fields').data('fields');

    vm.fields = vm.field_names.map(function(field){
      return {
        name: field,
        selected: get_selected(field),
        weight: get_weight(field)
      };
    });

    vm.hint = function(field_name) {
      return {
        grade_levels: 'e.g. 1st, 2nd',
        expanded_grade_levels: 'e.g. First, Second',
        grade_level_groups: 'e.g. Early Childhood, Middle School',
        description: 'editorial description',
        name: 'app/video/webpage name'
      }[field_name];
    };

    vm.refresh();

  });


} });
