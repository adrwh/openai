# Given a prompt and/or an input image, the model will generate a new image.
# https://beta.openai.com/docs/guides/images
# https://beta.openai.com/docs/api-reference/images/create

$cfg = Import-PowerShellDataFile ./cfg.psd1
$openAiKey = $cfg.key

$props = @{
    Header = @{
        'Authorization' = "Bearer $openAiKey"
        'Content-Type' = 'application/json'
    }
    Uri = 'https://api.openai.com/v1/images/generations'
    Method = "Post"
    Body = @{
        prompt = "Nazare big wave"
        n = 1
        size = "512x512"
        response_format = "url"
    } | ConvertTo-Json -Compress
    
}

$response = Invoke-RestMethod @props