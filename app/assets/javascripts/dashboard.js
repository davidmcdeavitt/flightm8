window.onload = function() {

  var savedDealsButton = document.querySelector('#savedDealsButton');
  var preferredDealsButton = document.querySelector('#preferredDealsButton');

  function populateDeals(){
    var settings = {
      url: '/api/mypreferreddeals'
    }
    $.ajax(settings).done(function(response) {
      resultsBox = document.querySelector(".results");
      resultsBox.innerHTML = "";
      var deals = response[0];
      for (i=0 ; i<deals.length; i++){
        var source = $('#source').html();
        var template = Handlebars.compile(source);
        var html = template({
          id: deals[i].id,
          title: deals[i].title,
          description: deals[i].description,
          price: deals[i].price,
          image_url: deals[i].image_url,
          saved: deals[i].savedDeal
        });
        $('.results').append(html);
      }
    });
  }
  function showSavedDeals(){
    var settings = {
      url: '/api/mysaveddeals'
    }
    $.ajax(settings).done(function(response) {
      resultsBox = document.querySelector(".results");
      resultsBox.innerHTML = "";
      var deals = response;
      for (i=0 ; i<deals.length; i++){
        var source = $('#source').html();
        var template = Handlebars.compile(source);
        var html = template({
          id: deals[i].id,
          title: deals[i].title,
          description: deals[i].description,
          price: deals[i].price,
          image_url: deals[i].image_url,
          saved: deals[i].savedDeal
        });
        $('.results').append(html);
      }
    });
  }

  function saveThisDeal(event){
    if ( event.target.classList.contains("saveThisDeal") ){
      var deal_id = event.target.getAttribute("data-deal_id")
      var user_id = event.target.getAttribute("data-user_id")
      var concat_url = '/save/deals/' + deal_id
      var settings = {
        url: concat_url
      }
      $.ajax(settings).done(function(response) {
        if (response["added"] != undefined ) {
          event.target.textContent = "Unsave"
        } else {
          event.target.textContent = "Save"
        }
        //update the dom based on the response

      });
    }
  }

  savedDealsButton.addEventListener('click', function(event) {
    showSavedDeals();
  });

  preferredDealsButton.addEventListener('click', function(event) {
    populateDeals();
  });

  document.body.addEventListener('click', function(event) {
    saveThisDeal(event);
  });

  populateDeals();

}
