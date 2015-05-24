class SearchService
  @$inject: ['$http']
  
  constructor: (@http) ->

  all: ->
    @http.get '/searches'
  find: (id) ->
    @http.get '/searches/' + id
  create: (search) ->
    @http.post '/searches', search
  update: (search) ->
    @http.put '/searches/' + search.id, search
  destroy: (search) ->
    @http.delete '/searches/' + search.id
  extend: (search) ->
    search.showPath = '#/searches/' + search.id
    search.editPath = search.showPath + '/edit'
    search
    
angular.module('Dk2')
.service('Search', SearchService)