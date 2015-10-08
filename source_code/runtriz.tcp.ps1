
$Listener = [System.Net.Sockets.TcpListener]12004
$listener.start()

    do {
        $client = $listener.AcceptTcpClient() # will block here until connection
        $stream = $client.GetStream();
        $reader = New-Object System.IO.StreamReader $stream
        $line = $reader.ReadLine()
        $z = $line.substring(19) 
        $split = $z.Split(';;')
        $output1 = $split -replace "%20", " " 
        $output2 = $output1 -replace "HTTP/1.1", ""
        $output2 | out-file -filepath $HOME\tmp
        Get-Content $HOME\tmp | Where-Object { $_ -ne '' } > $HOME\www.runtriz.com.txt
        Start-Process –FilePath $HOME\www.runtriz.com.txt -Verb Print -WindowStyle Hidden |  out-printer 
    } 
    while ($line -ne ([char]4))
    $listener.stop()