angular.module('Dk2').config ($routeProvider) ->
  $routeProvider
  .when '/', 
    templateUrl: '/app/index.html'
    controller: ->
  .when '/cards/:id', 
    templateUrl: '/app/cards/show.html'
    controller:  'cardsController'
    action:      'show'
  .otherwise
    redirectTo: '/'