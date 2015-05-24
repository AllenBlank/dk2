angular.module('Dk2').config ($routeProvider) ->
  $routeProvider
  .when '/', 
    templateUrl: '/app/index.html'
    controller: ->
  .when '/cards/:id', 
    templateUrl: '/app/cards/show.html'
    controller:  'cardsController'
    action:      'show'
  .when '/searches', 
    templateUrl: '/app/searches/index.html'
    controller:  'searchesController'
    action:      'index'
  .when '/searches/new', 
    templateUrl: '/app/searches/new.html'
    controller:  'searchesController'
    action:      'new'
  .when '/searches/:id/edit', 
    templateUrl: '/app/searches/edit.html'
    controller:  'searchesController'
    action:      'edit'
  .when '/searches/:id', 
    templateUrl: '/app/searches/show.html'
    controller:  'searchesController'
    action:      'show'
  .otherwise
    redirectTo: '/'