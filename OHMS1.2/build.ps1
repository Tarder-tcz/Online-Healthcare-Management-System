# PowerShell build script: compile Java sources in src/ to WEB-INF/classes/
# Usage: powershell -ExecutionPolicy Bypass -File .\build.ps1

param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Definition
Write-Host "Project root: $root"

if (-not (Test-Path (Join-Path $root 'src'))) {
    Write-Error "Source folder not found: $root\src"
    exit 1
}

$webinf = Join-Path $root 'WEB-INF'
$classesDir = Join-Path $webinf 'classes'
if (-not (Test-Path $classesDir)) { New-Item -ItemType Directory -Path $classesDir | Out-Null }

# Gather source files and write to a response file; quote each path
$sourceFiles = Get-ChildItem -Path (Join-Path $root 'src') -Recurse -Filter *.java | ForEach-Object { $_.FullName }
if ($sourceFiles.Count -eq 0) {
    Write-Error "No Java source files found under src\"
    exit 1
}

# Build lib pattern (app lib)
$libPattern = Join-Path $root 'lib\*'
# Try to include Tomcat's lib so servlet API is available during compilation
$tomcatRoot = Split-Path -Parent (Split-Path -Parent $root)
$tomcatLibPattern = Join-Path $tomcatRoot 'lib\*'
$destDir = $classesDir

# Verify javac exists
try {
    & javac -version > $null 2>&1
}
catch {
    Write-Error "javac not found. Please install JDK and ensure javac is on PATH."
    exit 1
}

Write-Host "Compiling using javac (ensure JDK is in PATH)..."

# Build argument list: -cp, classpath (app lib + tomcat lib), -d, destDir, then all source files
$classpath = "$libPattern;$tomcatLibPattern"
$args = @('-cp', $classpath, '-d', $destDir) + $sourceFiles

Write-Host "Running: javac -cp <app lib>;<tomcat lib> -d $destDir <source files>"

$null = & javac @args
if ($LASTEXITCODE -ne 0) {
    Write-Error "Compilation failed. Exit code: $LASTEXITCODE"
    exit $LASTEXITCODE
}

Write-Host "Compilation successful. Classes placed in $classesDir"

Write-Host "Done. Restart Tomcat to pick up changes."
