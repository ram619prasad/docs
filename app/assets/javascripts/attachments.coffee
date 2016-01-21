# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$(document).ready ->
	  # disable auto discover
	  Dropzone.autoDiscover = false
	  dropzone = new Dropzone('#new_attachment',
	    maxFilesize: 256
	    paramName: 'attachment[media]'
	    addRemoveLinks: true)
	  dropzone.on 'success', (file) ->

	# Event handler for deleting attachment
	$(document).on 'click', '.deleteFile', ->
  	deleteButton = $(this)
  	id = deleteButton.attr("data-id")
  	console.log id
  	$.ajax
	   url: 'attachments/' + id
	   method: 'DELETE'
	   success: (data) ->
	     deleteButton.closest('tr').remove()

	 # Event handler for edit action
	 $(document).on 'click', '.editFile', ->
  	editButton = $(this)
  	id = editButton.attr("data-id")
  	url = editButton.attr("data-url")
  	console.log id
  	console.log url
  	$.ajax
		  url: url
		  method: 'GET'
		  success: (data) ->
		  	$('.modalForm').html(data.content)
		  	$('#editFileModal').modal('show')
	     


	# clicking link will just open the modal
  $(document).on 'click', '.addNewDoc', ->
  	$('#newDoc').modal('show')
  	
