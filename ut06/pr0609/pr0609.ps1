$muestrasCPU = @(15, 12, 18, 20, 45, 88, 95, 99, 100, 98, 55, 22, 15, 10, 12, 14, 95, 99, 100, 10)
$suma=0
$maximo=0
$contadorCritico=0
$mensaje=''

foreach ($dato in $muestrasCPU) {
    $suma += $dato
    if($dato -gt $maximo){
        $maximo=$dato
    }
    if($dato -gt 90){
        $contadorCritico++ 
    }
}
$cargaPromedio = $suma / $muestrasCPU.Length
if($cargaPromedio -gt 70 -or $contadorCritico -gt 3){
    $mensaje="[RECOMENDACION] NECESARIO UPGRADE DE HARDWARE"
} else {
    $mensaje = "[RECOMENDACION] FALSA ALARMA. EL SERVIDOR AGUANTA"
}

Write-Host "=== INFORME DE RENDIMIENTO ==="
Write-Host "Muestras analizadas: "+$muestrasCPU.Length
Write-Host " "
Write-Host "RESULTADOS DEL ANALISIS:"
Write-Host "-Carga Promedio: "+$cargaPromedio+" %"
Write-Host "-Pico Maximo: "+$maximo+" %"
Write-Host "-Incidentes Criticos (>90%): "+$contadorCritico
Write-Host " "
Write-Host "DIAGNOSTICO:"
Write-Host $mensaje