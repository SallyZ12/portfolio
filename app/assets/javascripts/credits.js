
$(function() {
  console.log("loaded:assets/javascripts/credits.js")
  getCreditForm()
  // postCredit()
});



// retrieves html form and puts on page
  function getCreditForm(){
    $('a#new-credit-form').on('click', function(e){
      e.preventDefault();
      $.ajax({
        url: this.href,
        method: 'get',
        dataType: 'html'
      }).done(function(response){
          $('div#ajax-credit-form').html(response);
        // console.log('response:', response)
        postCredit()
      })
    });
  };


   // loads data into Rails database
    function postCredit(){

      $('form#new_credit').on('submit',function(e){
        e.preventDefault();
          let inputs = $(this).serialize();
          let addCredit = $.post('/credits', inputs);

          addCredit.done(function(data) {
            let credit = data;
            // use Credit Class here

            $("#creditName").text(credit["credit_name"]);
            // $("#creditSector").text(credit["sector"]);
            // $("#creditRating").text(credit["rating"]);
            // $("#creditState").text(credit["state"]);
          });
      });
    };
