# Lista de parches CRÍTICOS requeridos por el boletín de seguridad
$kbsRequeridos = @("KB500123", "KB409999", "KB890830", "KB500556", "KB500321", "KB999999")

# Lista de parches INSTALADOS actualmente en el servidor 
# Nota: Están desordenados y podría haber parches viejos que no son críticos.
$kbsInstalados = @("KB100000", "KB500556", "KB409999", "KB100001", "KB890830", "KB200022")

$kbsFaltantes = @()
$kbsExtra = @()

foreach ($datoRequerido in $kbsRequeridos) {
    if ($datoRequerido -notin $kbsInstalados) {
        $kbsFaltantes += $datoRequerido
    }
}

foreach ($datoInstalado in $kbsInstalados) {
    if ($datoInstalado -notin $kbsRequeridos) {
        $kbsExtra += $datoInstalado
    }
}

$porcentaje = (100 * ($kbsRequeridos.Length - $kbsFaltantes.Length) / $kbsRequeridos.Length).ToString() + "%"

Write-Host "=== AUDITORIA DE SEGURIDAD ==="
Write-Host "Total Requeridos: $($kbsRequeridos.Length)"
Write-Host "Total Instalados: $($kbsInstalados.Length)"
Write-Host ""
Write-Host "ESTADO DE CUMPLIMIENTO: $porcentaje"
Write-Host ""
Write-Host 
Write-Host "[URGENTE] Parches Faltantes:"
Write-Host ($kbsFaltantes -join ", ")
Write-Host 
Write-Host ""
Write-Host "[INFO] Parches 'Extra' instalados (No criticos):"
Write-Host ($kbsExtra -join " - ")