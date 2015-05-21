angular.module('Dk2')
.directive 'card', ->
  restrict: 'E'
  templateUrl: '/app/cards/_card.html'
  scope:
    card: '='
  controller: ->
  link: (scope, element)->
    # this bit hides the image and 
    # then fades it in once it's loaded.
    image = element.find('img')
    image.fadeTo(0,0)
    image.on 'load', ->
      $(this).fadeTo(300,1)