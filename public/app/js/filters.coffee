angular.module('Dk2').filter 'inGroupsOf', ->
  (inputArray, groups) ->
    if inputArray? and groups?
      returnArray = []
      for element, index in inputArray
        if index % groups is 0
          returnArray.push []
        returnArray[returnArray.length - 1].push element
      returnArray
    else
      inputArray