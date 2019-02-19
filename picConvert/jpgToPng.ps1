
#encoding : gbk
function jpgToPng {           #���ļ����µ�jpg��ʽתΪpng��ʽ
    param (
        $dicPath                #�ļ���·��
    )
    $files=Get-ChildItem $dicPath | Select-Object Name
    foreach($file in $files){
        $fileName=$file.Name.Split(".")[0]          #�ļ���
        $fileExtension=$file.Name.Split(".")[1]         #�ļ���׺��
        if($fileExtension.Equals("jpg")){
            $fileinfo=New-Object System.IO.FileInfo($dicPath+"\"+$file.Name)
            $fileinfo.MoveTo($dicPath+"\"+$fileName+".png")
        }
    }
}

$dicPath=Read-Host "�����ļ���·��"
jpgToPng $dicPath
Write-Output "�������"
Pause