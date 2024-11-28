$(document).ready(function() {
  $('input[type="file"]').on('change', function(e) {
    var files = e.target.files;
    $('#image-preview').empty(); // Clear previous previews

    for (var i = 0; i < files.length; i++) {
      var file = files[i];
      var reader = new FileReader();

      reader.onload = function(e) {
        var image = $('<img>').attr('src', e.target.result);
        $('#image-preview').append(image);
      };

      reader.readAsDataURL(file);
    }
  });
});