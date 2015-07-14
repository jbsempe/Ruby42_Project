$(document).ready(function(){
  if ($("body.orders").length > 0){
    new Mgv.Price($("body.orders"));
  }
});

Mgv.Price = function(container) {
  this.container = container;
  this.initUi();
  this.bindEvents();
}

Mgv.Price.prototype = {
  initUi: function(){
    this.ui = {
      price: this.container.find("[data-role=price]"),
      priceRelated: this.container.find("[data-role=price-related]")
    }
  },

  bindEvents: function(){
    this.ui.priceRelated.change(this.refreshPrice.bind(this));
  },

  refreshPrice: function(e){
    $.get('/orders/price.json',
      this.ui.priceRelated.serialize(),
      function(response) {
        this.ui.price.text(response.price);
      }.bind(this));
  }
}
