$loginResponse = Invoke-RestMethod -Uri "http://localhost:5000/api/auth/login" -Method Post -ContentType "application/json" -Body '{"email":"alex.morgan@acme.com","password":"Password123!"}'
$token = $loginResponse.token

$headers = @{
    Authorization = "Bearer $token"
}

$status = Invoke-RestMethod -Uri "http://localhost:5000/api/settings/supabase" -Headers $headers
Write-Host "Supabase Status:"
$status | ConvertTo-Json -Depth 4

$sync = Invoke-RestMethod -Uri "http://localhost:5000/api/settings/supabase/sync" -Method Post -Headers $headers
Write-Host "Sync Result:"
$sync | ConvertTo-Json
