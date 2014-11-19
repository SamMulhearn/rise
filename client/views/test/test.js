Template.test.rendered = function () {

  // Setup parsley form validation
  // replace form with the id of your form
  $('#demo-form').parsley({trigger: 'change'});
  console.log('fired')
}