set url=http://www.gensat.org/gensat_for_public.zip
set dest=.\data\

powershell -Command "Invoke-WebRequest %url% -OutFile '.\downloads\gensat_for_public.zip'"
powershell -Command "Expand-Archive .\downloads\gensat_for_public.zip -DestinationPath '%dest%'"