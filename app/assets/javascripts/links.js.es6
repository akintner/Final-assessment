function addNewLink(){
  $('#create-link').on('click', function(e){
    event.preventDefault;
    var linkTitle = $('#link-title').val();
    var linkUrl   = $('#link-url').val()
    var linkData = {'title': linkTitle, 'url': linkUrl}
    $.ajax({
      url: '/api/v1/links',
      method: 'POST',
      data: JSON.stringify(linkData)
    }).done(function(link){
      appendLink(link);
      clearForm();
    }).fail(function(error){
      console.log(error)
    })
  })
}

function appendLink(link){
  $('#all-links').prepend("<div class='link'><li>Title: " + link.title +
    "</li><li>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" + 
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read + 
    "</li><button class='mark-as-read'>Mark as Read</button>" +
    "</div>")
}

function clearForm(){
  $('#link-title').val('')
  $('#link-url').val('')
}

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.links');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.links[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

function filterLinks(){
  $('#filter-links').keyup(function(){
    var rows = $('.links').find('#individual-link').hide();
      if (this.value.length) {
        doBlackMagic(this, rows)
      } else rows.show()
  });
}

function doBlackMagic(self, rows){
  var data = self.value.toLowerCase().split(" ");
  $.each(data, function(i, v) {
    rows.filter(":contains('" + v + "')").show();
  });
}

$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead);
  filterLinks();
  addNewLink();
})