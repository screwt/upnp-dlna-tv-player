
angular.module("app").factory("discoverySrv",
["$log","$rootScope","$http",($log, $rootScope, $http)->

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

    distinctLocations = []

    client.on('response', (headers, statusCode, rinfo)->
        if headers.USN.indexOf("AVTransport") > -1
            if distinctLocations.indexOf(headers.LOCATION) < 0
                console.log('Got a response to an m-search.', headers.LOCATION, headers.ST, rinfo);
                distinctLocations.push(headers.LOCATION)
                ((_headers, _rinfo)->
                    $http.get(_headers.LOCATION)
                    .then (resp)->
                        parser = new DOMParser()
                        xmlDoc = parser.parseFromString(resp.data, "text/xml")
                        mn = xmlDoc.getElementsByTagName("modelName")
                        sn = xmlDoc.getElementsByTagName("serialNumber")
                        servicesType = xmlDoc.getElementsByTagName("serviceType")

                        url = new URL(headers.LOCATION)
                        url.pathname = ""
                        controlUrls = []

                        for srvt in servicesType
                            if srvt.textContent.indexOf("AVTransport") > -1
                                for subn in srvt.parentNode.childNodes
                                    if subn.tagName == "controlURL"
                                        url.pathname = subn.textContent
                                        controlUrls.push(url.toString())

                        
                        $log.debug(mn[0].textContent, sn[0].textContent, controlUrls)
                        #$rootScope.$apply ()->
                        devices.push({name:mn[0].textContent+" "+ sn[0].textContent, ctrlUrl:controlUrls[0]})
                    .catch (err)->
                        $log.error(err)
                        return
                    return)
                 .call(null,headers, rinfo)
        return)
    client.search('ssdp:all')
    

    devices = []

    search = ()->
        client.search('ssdp:all')
        return
    
    return{
        devices: devices
        search: search
    }])
