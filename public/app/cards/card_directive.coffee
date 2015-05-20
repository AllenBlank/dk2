angular.module('Dk2')
.directive 'card', ->
  restrict: 'E'
  templateUrl: '/app/cards/_card.html'
  scope:
    card: '='
  controller: ->
  link: (scope, element)->
    element.on 'click', ->