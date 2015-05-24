angular.module('Dk2')
.controller 'searchesController', ($routeParams, $route, $scope, Search) ->
  
  @beforeActions = 
    setSearch: ['show','new']
    setupPagination: ['show']
  
  @actions =
    index: =>
      Search.all().success (data) ->
        $scope.searches = []
        for search in data
          $scope.searches.push Search.extend(search)
    show: =>
      $scope.updateSearch = (search) ->
        Search.update(search).success (data) ->
          $scope.search = Search.extend(data)
          $scope.currentPage = 1
          window.scrollTo(0,0)
    new: =>
      $scope.createSearch = (search) ->
        Search.create(search).success (data) ->
          window.location = Search.extend( data ).showPath
        $scope.search = {}

  @privateMethods =
    setSearch: ->
      if $routeParams.id?
        Search.find($routeParams.id).success (data) ->
          $scope.search = Search.extend(data)
      else
        $scope.search = {}
    setupPagination: ->
      $scope.currentPage = 1
      $scope.perPage = 20
      $scope.onPage = (index) ->
        max = $scope.currentPage * $scope.perPage
        min = max - $scope.perPage
        min <= index < max
      $scope.pageChanged = ->
        window.scrollTo(0,0)
      
  $scope.$on "$routeChangeSuccess", =>
    for method, actions of @beforeActions
      if 0 <= $.inArray( $route.current.action, actions )
        @privateMethods[method]()
    @actions[$route.current.action]()
  