import './directive.usdPlaylist.pug'


angular.module("app").directive("usdPlaylist",
["$log", ($log)->
    controller = ["$log", ($log)->
        $log.info('in usdPlaylist')
        return]
    return {
        restrict: 'E'
        controller: controller
        template: require("./directive.usdPlaylist.pug")
    }
])
