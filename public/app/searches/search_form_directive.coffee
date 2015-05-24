angular.module('Dk2')
.directive 'searchForm', ->
  restrict: 'E'
  templateUrl: '/app/searches/_form.html'
  scope:
    search:  '='
    submit: '='
    title: '@'
    collapsed: '@'
  controller: ->
  link: (scope, element)->
    if scope.collapsed is 'true'
      title = element.find('.form-title')
      fields = element.find('fieldset')
      fields.hide()
      $('<span/>')
        .addClass('glyphicon glyphicon-collapse-down pull-right')
        .appendTo(title)
      title.click ->
        fields.slideToggle()