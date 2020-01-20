function Clear-HSL {
    if ((Test-path .\Resultats.zip) -eq $true){
        Remove-item .\Resultats.zip
    }

    if ((Test-path .\Resultats) -eq $true){
        Remove-item -recurse .\Resultats
    }

    if ((Test-path .\LICENSE) -eq $true){
        Remove-item -recurse .\LICENSE
    }

    if ((Test-path .\checksum.txt) -eq $true){
        Remove-item -recurse .\checksum.txt
    }

    if ((Test-path .\Scripts\Additional_exe\src\Compilo\target) -eq $true){
        Remove-item -recurse .\Scripts\Additional_exe\src\Compilo\target
    }

    if ((Test-path .\.gitignore) -eq $true){
        Remove-item -recurse  .\.gitignore
    }

}
function Test-HSL {
   $prephash = cat .\hash\prep.sha256
   echo $prephash
   $prephashere = Get-filehash -algorithm sha256 .\prep.ps1
   echo $prephashere
   if($prephashere.hash -eq $prephash){
    write-output "Sys De prep OK!"
   }
   else{
    [int]$errorstate = $errorstate + 1
   }
   $partie1hash = cat .\hash\partie1.sha256
   echo $partie1hash
   $partie1hashere = Get-filehash -algorithm sha256 .\partie1.ps1
   echo $partie1hashere
   if ($partie1hashere.hash -eq $partie1hash){
    write-output "Partie 1 OK!"
   }

   else {
       [int]$errorstate = $errorstate + 1
   }

   $partie2hash = cat .\hash\partie2.sha256
   echo $partie2hash
   
   $partie2hashere = Get-filehash -algorithm sha256 .\partie2.ps1 
   echo $partie2hashere
   
   if ($partie2hashere.hash -eq $partie2hash){
    write-output "Partie2 OK"
   }
   
   else {
       [int]$errorstate = $errorstate + 1
   }
   
   $partie3hash = cat .\hash\partie3.sha256
   echo $partie3hash
   
   $partie3hashere = Get-filehash -algorithm sha256 .\partie3.ps1
   echo $partie3hashere
   if ($partie3hashere.hash -eq $partie3hash){
    write-output "Parite3 OK"
   }
   else {
       [int]$errorstate = $errorstate + 1
   }
   $partie4hash = cat .\hash\partie4.sha256
   echo $partie4hash
   $partie4hashere = Get-filehash -algorithm sha256 .\partie4.ps1    
  if ($partie4hashere.hash -eq $partie4hash){
    write-output "Partie4 OK"
  }
  else {
   [int]$errorstate = $errorstate + 1
    }

    #Partie5
  
  $partie5hash = cat .\hash\partie5.sha256
  echo $partie5hash
  
  $partie5hashere = Get-filehash -algorithm sha256 .\partie5.ps1
  echo $partie5hashere 
  
  if ($partie5hashere.hash -eq $partie5hash){
    write-output "Partie5 OK"
  }
  else{
    [int]$errorstate = $errorstate + 1
    echo "pas OK"
  }
}

function Get-woomytmp {
  cd $env:tmp
  if ((Test-path .\woomy)-eq $true){
    cd .\woomy 
  ls
   } 
  else{
    write-output "Pas de dossier temp woomy"
  }
}
function Clear-woomytmp {
  cd $env:tmp
  Remove-item -recurse .\woomy
}

function Get-wutilsload {
  write-output "Loaded"
}