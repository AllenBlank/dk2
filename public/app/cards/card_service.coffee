class CardService
  @$inject: ['$http']
  
  constructor: (@http) ->

  find: (id) ->
    @http.get '/cards/' + id
    
    
angular.module('Dk2')
.service('Card', CardService)