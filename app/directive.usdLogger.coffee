import './directive.usdLogger.pug'


angular.module("app").directive("usdLogger",
["$log", ($log)->
    controller = ["$log", ($log)->
        $log.info('in usdLogger')
        return]
    return {
        restrict: 'E'
        controller: controller
        template: require("./directive.usdLogger.pug")
    }
])
