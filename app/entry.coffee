import 'material-design-lite/dist/material.css'
import 'material-design-lite/dist/material.indigo-deep_orange.min.css'
import 'material-design-lite/dist/material.js'
import 'getmdl-select/getmdl-select.min.js'
import 'getmdl-select/getmdl-select.min.css'
import 'font-awesome/css/font-awesome.css'
import angular from 'angular'
import uirouter from 'angular-ui-router' 
import './app.css'
import './about.pug'
import './app.coffee'
import './directive.usdPlayer.coffee'
import './directive.usdPlaylist.coffee'
import './directive.usdLogger.coffee'
import './controller.homeCtrl.coffee'
nw.Window.get().showDevTools()





angular.module("app").config(($stateProvider, $urlRouterProvider)->

    $urlRouterProvider.otherwise("/home")
    
    $stateProvider.state({
        name: 'home',
        url: '/home',
        template: '<h1>toto</h1>'
        controller: "homeCtrl"
    })

    $stateProvider.state({
        name: 'about',
        url: '/about',
        template: require("./about.pug")
    }) 

    return)

angular.module("app").run ($log,$state,$rootScope)->
    $log.debug("hello")
    $state.transitionTo('home')
    $rootScope.showLogger = false
    $rootScope.showPlaylist = false
    $rootScope.toggleLogger = ()->
        $rootScope.showLogger = !$rootScope.showLogger
        $log.debug("toggleLogger", $rootScope.showLogger)
        return
    $rootScope.togglePlaylist = ()->
        $rootScope.showPlaylist = !$rootScope.showPlaylist
        $log.debug("togglePlaylist")
        return        
    return

#-- bootstrap
angular.element(()->
    angular.bootstrap(document, ['app'])
    return)
