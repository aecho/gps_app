local currentLocation, currentLatitude, currentLongitude

local myMap = native.newMapView(0, 0, display.stageWidth, display.stageHeight)
myMap.x = display.contentCenterX
myMap.y = display.contentCenterY

if ( myMap ) then
	lat, long = myMap:getAddressLocation("Georgetown University")

	myMap:setCenter(lat, long)

	myMap.mapType = "normal"

 
    myMap:setCenter( 37.331692, -122.030456 )
  -- adopted from Carlos Yane's blog "tutsplus.com"
   
    local function mapLocationListener(event)
        print("map tapped latitude: ", event.latitude)
        print("map tapped longitude: ", event.longitude)
    end
    myMap:addEventListener("mapLocation", mapLocationListener)
end

local mapLocationHandler = function( event )
    if event.isError then
    
        native.showAlert( "Error", event.errorMessage, { "OK" } )
    else
        
        myMap:setCenter( event.latitude, event.longitude, true )


        markerTitle = "Location " .. locationNumber
        locationNumber = locationNumber + 1
        myMap:addMarker( event.latitude, event.longitude, { title=markerTitle, subtitle=inputField.text } )
    end
end

local locationTable  = myMap:getUserLocation()
myMap:addMarker( locationTable.latitude, locationTable.longitude, { title="Location", subtitle = locationTable.latitude .. ", " ..locationTable.longitude} )
-- adopted from Carlos Yane's blog "tutsplus.com"
