import './directive.usdPlaylist.pug'


angular.module("app").directive("usdPlaylist",
["$log", ($log)->
    controller = ["$log","$rootScope","$scope", ($log, $rootScope, $scope)-> 
        $log.info('in usdPlaylist')

        $scope.playlist = []

        $rootScope.$on("addmedia", (evnt, arg)->
            $log.debug("addM", arg)
            $scope.playlist.push({active:false, info:arg})
            return)

        $scope.launchMedia = (media, index)->
            $scope.playlist.map (el)->
                el.active = false
                return el
            $scope.playlist[index].active = true
            $rootScope.$broadcast("playmedia", media)
            return
        
        return]
    return {
        restrict: 'E'
        controller: controller
        template: require("./directive.usdPlaylist.pug")
    }
])
