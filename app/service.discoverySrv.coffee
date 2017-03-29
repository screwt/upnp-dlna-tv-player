
angular.module("app").factory("discoverySrv",
["$log","$rootScope",($log, $rootScope)->

    #ssdp = require('@achingbrain/ssdp')
    Client = require('node-ssdp').Client
    client = new Client()
    
    #bus = ssdp()
    #bus.on('discover:*', (service, arg, arg2)->
    #    if service.indexOf("AVTransport") > 0
    #        $rootScope.$apply( ()->
    #            devices.push(arg)
    #            $log.info("service", typeof service, service, arg, arg2)
    #            $rootScope.$broadcast("newdevice")
    #            return)
    #        
    #    return)
    #bus.discover()

    client.on('response', (headers, statusCode, rinfo)->
        if headers.USN.indexOf("AVTransport") > -1
            console.log('Got a response to an m-search.', headers.LOCATION, headers.ST);
        return)
    client.search('ssdp:all')
    

    devices = []

    
    
    return{
        devices:devices
    }])
