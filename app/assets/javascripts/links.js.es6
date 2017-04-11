function linksLoad(){
  $.ajax({
    url: '/api/v1/links',
    method: 'GET'
  }).done(function(links){
    if(!links.length == 0){
    links.forEach(function(element){
      if(element.read === true){
        formatReadLinks(element)        
      } else if(element.read === false){
        formatUnreadLinks(element)
      }
    })
    }
  }).fail(function(error){
    console.log(error)
  })
}

function formatUnreadLinks(link){
  $('#all-links').prepend("<div class='link'><li>Title: " + link.title +
    "</li><li>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" + 
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read + 
    "</li><button cclass='btn-edit' id='mark-as-read'>Mark as Read</button>" + "<a class='btn-edit' href=" +"/links/" +link.id +"/edit" +">Edit</a>" +
    "</div>")
}

function formatReadLinks(link){
  $('#all-links').prepend("<div class='link readLinks'><li>Title: " + link.title +
    "</li><li>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" + 
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read + 
    "</li><button class='btn-edit' id='mark-as-read unread'>Mark as Unread</button>" + "<a class='btn-edit' href=" +"/links/" +link.id +"/edit" +">Edit</a>" +
    "</div>")
}

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
  $('.all-links').prepend("<div class='link'><li>Title: " + link.title +
    "</li><li>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" + 
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read + 
    "</li><button class='btn-edit' id='mark-as-read'>Mark as Read</button>" + "<a class='btn-edit' href=" +"/links/" +link.id +"/edit" +">Edit</a>" +
    "</div>")
}

function clearForm(){
  $('#link-title').val('')
  $('#link-url').val('')
}

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link')
  var linkId = $link.children('#link-id')[0].name

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link input[name=${link.id}]`).siblings('.read-status').text(`Read? ${link.read}`)
  $(`.link input[name=${link.id}]`).parents('.link').addClass('beenRead').css({
    'background-color': 'lightgreen',
  })
  $(`.link input[name=${link.id}]`).parents('.link').children('#mark-as-read').text('Mark as undread').addClass('unread')
  markAsUnread(link.id);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

function markAsUnread(link_id) {
  var unreadLink = $(`.link input[name=${link_id}]`).siblings('unread');
  $(unreadLink).on('click', function(e){
    e.preventDefault();

    var $link = $(this).parents('.link')
    var linkId = $link.children('#link-id')[0].name

    $.ajax({
      type: "PATCH",
      url: "/api/v1/links/" + linkId,
      data: { read: false },
    }).then(updateUnreadLinkStatus)
      .fail(displayFailure);
    })
}

function updateUnreadLinkStatus(link) {
  $(`.link input[name=${link.id}]`).siblings('.read-status').text(`Read? ${link.read}`)
  $(`.link input[name=${link.id}]`).parent('.link').removeClass('beenRead').css({
    'background-color': 'white',
  })
  $(`.link input[name=${link.id}]`).siblings('#mark-as-read').text('Mark as Read').removeClass('unread')
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

function filterLinks(){
  $('#filter-links').keyup(function(){
    var rows = $('.all-links').find('div').hide();
      if (this.value.length) {
        doBlackMagic(this, rows)
      } else rows.show()
  });
}

function doBlackMagic(self, rows){
  var data = self.value.split(" ");
  $.each(data, function(i, v) {
    rows.filter(":contains('" + v + "')").show();
  });
}

function readButton(){
  $('#show-read').on('click', function(e){
    $('div.link.beenRead').toggle('show');
  });
}

function unreadButton(){
  $('#show-unread').on('click', function(e){
    $('div.link.beenRead').toggle('hide');
  });
}

$( document ).ready(function(){
  linksLoad();
  $("body").on("click", "#mark-as-read", markAsRead);
  filterLinks();
  addNewLink();
  readButton();
  unreadButton();
})