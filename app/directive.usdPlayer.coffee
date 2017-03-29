import './directive.usdPlayer.pug'


angular.module("app").directive("usdPlayer",
["$log", ($log )->
    controller = ["$log","discoverySrv","$scope","$document","$rootScope","deviceSrv", ($log, discoverySrv, $scope, $document, $rootScope, deviceSrv)->
        $log.info('in usdPlayer')
        $scope.devices = discoverySrv.devices
        $scope.selectedDevice = null
        $scope.selectDevice = (device)->
            menu = document.querySelectorAll(".mdl-menu__container")
            if menu[0]?
                menu[0].classList.toggle("is-visible")
            $log.debug("selectDevice", device, menu)
            $scope.selectedDevice = device
            return

        $rootScope.$on("playmedia", (e, media)->
            $log.debug("playmedia", media)
            deviceSrv.play($scope.selectedDevice, media)
            return)            
        
        return]
        

        
    return {
        restrict: 'E'
        controller: controller
        template: require("./directive.usdPlayer.pug")
    }
])
