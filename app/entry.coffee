import angular from 'angular'
import uirouter from 'angular-ui-router' 
import "./app.css"
import 'material-design-lite/dist/material.css'
import 'material-design-lite/dist/material.js'
import './about.pug'

angular.module("app",['ui.router'])

angular.module("app").config(($stateProvider, $urlRouterProvider)->

    $urlRouterProvider.otherwise("/home")
    
    $stateProvider.state({
        name: 'home',
        url: '/home',
        template: '<h1>toto</h1>'
    })

    $stateProvider.state({
        name: 'about',
        url: '/about',
        template: require("./about.pug")
    }) 

    return)

angular.module("app").run ($log,$state)->
    $log.debug("hello")
    $state.transitionTo('home')
    return

#-- bootstrap
angular.element(()->
    angular.bootstrap(document, ['app'])
    return)
