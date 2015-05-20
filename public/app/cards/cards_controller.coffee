angular.module('Dk2')
.controller 'cardsController', ($routeParams, $route, $scope, Card) ->
  
  @beforeActions = 
    setCard: ['show']
  
  @actions =
    show: ->

  @privateMethods =
    setCard: ->
      if $routeParams.id?
        Card.find($routeParams.id).success (data) ->
          $scope.card = data
      else
        $scope.card = {}
      
  $scope.$on "$routeChangeSuccess", =>
    for method, actions of @beforeActions
      if 0 <= $.inArray( $route.current.action, actions )
        @privateMethods[method]()
    @actions[$route.current.action]()
  