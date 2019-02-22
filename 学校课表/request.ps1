# encoding : utf-8
using namespace System.Net.Http
using namespace System.Collections.Generic

Add-Type -AssemblyName System.Net.Http

class Request{

    $client
    Request(){
        $this.client=New-Object HttpClient
        $this.client.DefaultRequestHeaders.Add("User-Agent","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36")
    }

    [string]Get([string]$url){                  #一般的get请求
        $response=$this.client.GetAsync($url)
        $text=$response.Result.Content.ReadAsStringAsync()
        return $text.Result
    }
    [string]Post([string]$url,[FormUrlEncodedContent]$data){        #post请求
        $response=$this.client.POstAsync($url,$data)
        $text=$response.Result.Content.ReadAsStringAsync()
        return $text.Result
    }
}

function getCourse {                #获取json字符串
    param (
        [string]$url="http://zhjwjs.scu.edu.cn/teacher/personalSenate/giveLessonInfo/thisSemesterClassSchedule/getCourseArragementPublic"
    )
    $request=[Request]::New()
    #post参数填充
    $keyValues=New-Object 'Dictionary[[string],[string]]'
    $keyValues.Add("zxjxjhh","2018-2019-2-1")
    $keyValues.Add("kch","")
    $keyValues.Add("kcm","")
    $keyValues.Add("js","")
    $keyValues.Add("kkxs","304")
    $keyValues.Add("skxq","")
    $keyValues.Add("skjc","")
    $keyValues.Add("xq","")
    $keyValues.Add("jxl","")
    $keyValues.Add("jas","")
    $keyValues.Add("pageNum","1")
    $keyValues.Add("pageSize","30")
    $keyValues.Add("kclb","")

    $data=New-Object FormUrlEncodedContent($keyValues)
    $text=$request.Post($url,$data)
    $text
}
getCourse