# Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position.
# https://beta.openai.com/docs/guides/completion
# https://beta.openai.com/docs/api-reference/completions/create

$cfg = Import-PowerShellDataFile ./cfg.psd1

$props = @{
    Header = @{
        "Authorization" = "Bearer $($cfg.key)"
        "Content-Type" = "Application/json"
    }
    Uri = "https://api.openai.com/v1/completions"
    Method = "POST"
    Body = @{
        model = "text-davinci-003"
        prompt = ""
    } | ConvertTo-Json -Compress
}

$response = Invoke-RestMethod @props