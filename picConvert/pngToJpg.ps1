# encoding : gbk
function pngToJpg {
    param (
        $dicPath
    )
    $files=Get-ChildItem $dicPath | Select-Object Name
    foreach($file in $files){
        $fileName=$file.Name.Split(".")[0]
        $fileExtension=$file.Name.Split(".")[1]
        if($fileExtension.Equals("png")){
            $fileinfo=New-Object System.IO.FileInfo($dicPath+"\"+$file.Name)
            $fileinfo.MoveTo($dicPath+"\"+$fileName+".jpg")
        }
    }
}

$dicPath=Read-Host "�����ļ���·��"
pngToJpg $dicPath
Write-Output "�������"
Pause