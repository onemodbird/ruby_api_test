$(function() {

  $('.flag').on('ajax:success', function() {
    $(this).siblings().removeClass('hide');
    $(this).siblings().show();
    $(this).hide();
  }).on('ajax:error', function() {
    alert('There was an error saving your change.  Please try again.');
  });

  $('.auto-tag').on('ajax:success', function() {
    var reds = $(this).closest('tr').find('td.grade-levels .label-danger');
    var auto_tag_action = $(this).data('auto-tag');
    console.log(reds);
    console.log(auto_tag_action);

    if ('remove' === auto_tag_action) {
      reds.hide();
    } else if ('add' === auto_tag_action) {
      reds.removeClass('label-danger').addClass('label-info');
    }

    $(this).parent().hide();
  }).on('ajax:error', function() {
    alert('There was an error saving your change.  Please try again.');
  });

});
