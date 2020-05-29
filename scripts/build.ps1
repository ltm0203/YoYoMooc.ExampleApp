# 以上脚本均需要在powershell中使用

$buildFolder = (Get-Item -Path "./" -Verbose).FullName ## 当前文件所在目录
$slnFolder = Join-Path $buildFolder "../"   ## 当前解决方案所在文件夹
$outputFolder = Join-Path $buildFolder "outputs" ## 当前文件夹下的outputs文件夹
$webFolder = Join-Path $slnFolder "src"  ## web项目所在文件夹路径

 
$outputWebFolder = Join-Path $outputFolder "web"
 
 

## CLEAR ######################################################################
Write-Host "Delete Temp Folder"
Remove-Item $outputFolder -Force -Recurse -ErrorAction Ignore
New-Item -Path $outputFolder -ItemType Directory
 
# 设置路径到解决方案文件夹  ###################################################
Set-Location $webFolder

# 还原项目依赖的包然后发布###################################################
dotnet restore

dotnet publish  --configuration Release --output dist
  

# 创建Docker镜像 ####################

# web
Set-Location dist

docker build . -t yoyomooc.azurecr.io/exampleapp -f Dockerfile

 
  

## DOCKER COMPOSE FILES #######################################################

 
  