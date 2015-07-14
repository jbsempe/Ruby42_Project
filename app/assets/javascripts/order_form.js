$(document).ready(function(){
  if ($("body.orders").length > 0){
    new Mgv.OrderForm($("body.orders"));
  }
});

Mgv.OrderForm = function(container) {
  this.container = container;
  this.initUi();
  this.bindEvents();
}

Mgv.OrderForm.prototype = {
  initUi: function(){
    this.ui = {
      form: this.container.find("form"),
      newOrderButton: this.container.find("[data-role=new-order]"),
      cancelOrderButton: this.container.find("[data-role=cancel-order]"),
      isQuoteInput: this.container.find("[data-role=is-quote-input]")
    }
  },

  bindEvents: function(){
    this.ui.newOrderButton.click(this.onNewOrderButtonClick.bind(this));
    this.ui.cancelOrderButton.click(this.onCancelOrderButtonClick.bind(this));
  },

  onNewOrderButtonClick: function(e){
    e.preventDefault();
    this.ui.form.addClass('expanded');
    this.ui.isQuoteInput.val(false);
  },

  onCancelOrderButtonClick: function(e){
    e.preventDefault();
    this.ui.form.removeClass('expanded');
    this.ui.isQuoteInput.val(true);
  }
}

