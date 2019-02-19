
#encoding : gbk
function jpgToPng {           #将文件夹下的jpg格式转为png格式
    param (
        $dicPath                #文件夹路径
    )
    $files=Get-ChildItem $dicPath | Select-Object Name
    foreach($file in $files){
        $fileName=$file.Name.Split(".")[0]          #文件名
        $fileExtension=$file.Name.Split(".")[1]         #文件后缀名
        if($fileExtension.Equals("jpg")){
            $fileinfo=New-Object System.IO.FileInfo($dicPath+"\"+$file.Name)
            $fileinfo.MoveTo($dicPath+"\"+$fileName+".png")
        }
    }
}

$dicPath=Read-Host "输入文件夹路径"
jpgToPng $dicPath
Write-Output "处理完成"
Pause