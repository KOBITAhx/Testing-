local function conectarAlServidorConMenorEstadistica()
    local servidores = game:GetService("NetworkServer"):GetChildren() 
    local estadisticaMasBaja = math.huge 
  local servidorMasBajo = nil 
  
     for _, servidor in pairs(servidores) do
        local estadisticaServidor = servidor:GetCustomProperty("Estadistica") -- Obtén la estadística del servidor
        
        if estadisticaServidor and estadisticaServidor < estadisticaMasBaja then
            estadisticaMasBaja = estadisticaServidor
            servidorMasBajo = servidor
        end
    end
    
    if servidorMasBajo then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servidorMasBajo.PlaceId)
    else
        print("No se encontraron servidores con estadísticas disponibles.")
    end
end

wait(5)
conectarAlServidorConMenorEstadistica()
