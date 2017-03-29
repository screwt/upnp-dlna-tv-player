
angular.module("app").factory("deviceSrv",
["$log","$rootScope",'$http',($log, $rootScope, $http)->

    getAVTransportURL = (device)->
        ret = null
        for srv in device.details.device.serviceList.service
            if srv.serviceType.indexOf("AVTransport") > -1
                ret = srv.controlURL
        return ret

    getAVTransportHeaders = (device, action)->
        ret = {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "urn:schemas-upnp-org:service:AVTransport:1#"+action
        }
        return ret        

    play = (device, media)->
        $log.debug("deviceSrv.play", device, media)
        url = getAVTransportURL(device)
        headers = getAVTransportHeaders(device, "SetAVTransportURI")
        $http({
            method: 'POST'
            url: url
            headers: headers
            data: "test"
        })
        .then (data)->
            return
        .catch (err)->
            $log.error(err)
            return
        return
    
    return{
        play: play
    }])
