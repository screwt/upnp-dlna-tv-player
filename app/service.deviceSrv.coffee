


angular.module("app").factory("deviceSrv",
["$log","$rootScope",'$http',($log, $rootScope, $http)->


    getAVTransportHeaders = (device, action)->
        ret = {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": '"urn:schemas-upnp-org:service:AVTransport:1#'+action+'"'
        }
        return ret        

    launchPlay = (device)->
        url = device.ctrlUrl
        data = require("./soap/Play.xml")

        $log.debug("deviceSrv.play", device, url, data)

        headers = getAVTransportHeaders(device, "Play")
        
        $http({
            method: 'POST'
            url: url
            headers: headers
            data: data
        })
        .then (data)->
            
            return
        .catch (err)->
            $log.error(err)
            return
        return

        
        return

    play = (device, media)->
        url = device.ctrlUrl
        data = require("./soap/setAVTransportUri.xml")
        data = data.replace("{{mediaUrl}}", media.info)
        $log.debug("deviceSrv.play", device, media, url, data)
        
        headers = getAVTransportHeaders(device, "SetAVTransportURI")
        $http({
            method: 'POST'
            url: url
            headers: headers
            data: data
        })
        .then (data)->
            launchPlay(device)
            return
        .catch (err)->
            $log.error(err)
            return
        return

    stop = (device)->
        url = device.ctrlUrl
        data = require("./soap/Stop.xml")

        $log.debug("deviceSrv.play", device, url, data)

        headers = getAVTransportHeaders(device, "Stop")
        
        $http({
            method: 'POST'
            url: url
            headers: headers
            data: data
        })
        .then (data)->
            
            return
        .catch (err)->
            $log.error(err)
            return
        return


    pause = (device)->
        url = device.ctrlUrl
        data = require("./soap/Pause.xml")
        headers = getAVTransportHeaders(device, "Pause")
        
        $http({
            method: 'POST'
            url: url
            headers: headers
            data: data
        })
        .then (data)->
            
            return
        .catch (err)->
            $log.error(err)
            return
        return
                        
    
    return{
        play: play
        stop: stop
        pause: pause
        launchPlay: launchPlay
    }])
