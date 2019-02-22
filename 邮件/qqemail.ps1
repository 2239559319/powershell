#encoding : utf-8
using namespace System.Net.Mail
using namespace System.Text
using namespace System.Net

function sendMessage {
    param (
        [string]$to,
        [string]$from,
        [string]$password
    )
    #邮件内容设置
    $msg=New-Object MailMessage
    $msg.To.Add($to)        #收件人地址
    $msg.From=New-Object MailAddress($from,"xiaochuan")
    $msg.Body="this is a email sent by powershell using .net"
    $msg.BodyEncoding=[Encoding]::UTF8

    $smtpclient=New-Object SmtpClient
    $smtpclient.Host="smtp.qq.com"
    $smtpclient.Port=587
    $smtpclient.EnableSsl=$true
    $smtpclient.Credentials=New-Object NetworkCredential($from,$password)

    $smtpclient.Send($msg)
}

sendMessage -to "w2239559319@outlook.com" -from "306234087@qq.com" -password "fgdbsnksjtwhbhji"