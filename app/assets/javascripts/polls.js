$('#poll_proposal').bind('railsAutocomplete.select', function(event, data){
  /* Do something here */
  alert(data.item.id);
});