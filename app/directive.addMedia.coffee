import './directive.addMedia.pug'


angular.module("app").directive("addMedia",
["$log", ($log)->
    controller = ["$log", ($log)->
        $log.info('in usdPlaylist')
        return]
    return {
        restrict: 'E'
        controller: controller
        template: require("./directive.addMedia.pug")
    }
])
