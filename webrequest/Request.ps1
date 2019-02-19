# encoding : utf-8

Add-Type -AssemblyName System.Net.Http

class Request{

    Request(){
        $this.client=New-Object System.Net.Http.HttpClient
    }
    
    [string]Get([string]$url){                  #一般的get请求
        
        $this.client.DefaultRequestHeaders.Add("User-Agent","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36")
        
        $response=$this.client.GetAsync($url)
        $text=$response.Result.Content.ReadAsStringAsync()
        return $text.Result
    }
}

$request=[Request]::New()               #构造函数
$text=$request.Get("https://www.baidu.com")
Write-Host $text