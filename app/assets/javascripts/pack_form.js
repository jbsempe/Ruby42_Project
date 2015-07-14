$(document).ready(function(){
  if ($("body.packs").length > 0){
    new Mgv.PackPreview($("body.packs"));
  }
});

Mgv.PackPreview = function(container) {
  this.container = container;
  this.initUi();
  this.bindEvents();
}

Mgv.PackPreview.prototype = {
  initUi: function(){
    this.ui = {
      uploadImageButton: this.container.find("[data-role=upload-image]"),
      uploadPreview: this.container.find("[data-role=upload-preview]")
    }
  },

  bindEvents: function(){
    this.ui.uploadImageButton.change(this.uploadImageButtonChange.bind(this));
  },

  uploadImageButtonChange: function(e){
    var oFReader = new FileReader();
    oFReader.readAsDataURL(this.ui.uploadImageButton.get(0).files[0]);
    oFReader.onload = this.onFileReaderLoad.bind(this);
  },

  onFileReaderLoad: function(oFREvent){
    this.ui.uploadPreview.attr('src', oFREvent.target.result);
  }
}
