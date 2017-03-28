import './directive.usdPlayer.pug'


angular.module("app").directive("usdPlayer",
["$log", ($log)->
    controller = ["$log", ($log)->
        $log.info('in usdPlayer')
        return]
    return {
        restrict: 'E'
        controller: controller
        template: require("./directive.usdPlayer.pug")
    }
])
